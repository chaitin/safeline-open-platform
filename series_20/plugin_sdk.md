# SafeLine 20 扩展插件文档


SafeLine 扩展插件系统（以下简称插件系统）使用 Lua 作为脚本语言，**目前语法兼容标准 Lua 5.1。**

在「网站防护」→「扩展插件管理」页面可对插件进行新增，查看，删除等操作。本文档将说明插件的编写方法以及可用的相关接口。

[toc]

## 导入

在编写插件时，首先需要导入 safeline 模块，safeline 模块包含了插件系统提供的所有接口。

```lua
local safeline = require "safeline"
```
注意： 出于安全性的考量，插件脚本中只允许使用有限的标准库函数，其中 IO 库中的所有函数均被禁用，OS 库中仅保留 `time`, `date`, `clock`, `timediff` 等函数。

## 注册

每个插件至少需要调用一次注册函数以获得一个触发器(Trigger)，调用注册函数时通常会指定一个触发条件及其回调函数，当满足条件时该回调函数会被调用。
注册函数签名如下：
```lua
function safeline.register(type, ...)
```
第一个参数 type 代表触发器的类型，可能的取值及用途见下表。其后的变长参数的数目及类型随着 type 的不同而不同。

| 触发器类型 | 用途 | 
|:--------|:--------:|
| `safeline.TYPE_MATCH` | 处理符合给定条件的请求 |
| `safeline.TYPE_TICKER` | 执行定时任务 |
| `safeline.TYPE_QUERY`	 | 处理符合给定查询的请求 |

### Match 触发器

Match 触发器需要用户给定一个描述请求特征（仅限于预定义的一些条件）的表 match 和一个回调函数 process，当通过 SafeLine 的请求满足 match 的描述时，回调函数 process 会在该请求的上下文中被调用。其注册方式如下：

```lua
local safeline = require "safeline"
 
local match = {
    ip          = "0.0.0.0/0",
    host        = [[.*\.chaitin\.cn:80]],
    url_path    = [[/.*safeline]],
    target      = safeline.MATCH_TARGET_ALL,
}
 
function process(ip, host, url_path)
    -- 在此处理请求
end
 
safeline.register(safeline.TYPE_PROCESS, match, process)
```
`match` 是一个`table`，用来描述要匹配的请求的特征，其支持的字段见下表：

| 字段 | 类型 | | 用途 | 
|:--------|:--------:| :--------:| :--------: |
| ip | 字符串 | | 匹配请求的源 IP，支持匹配单个 IP 地址（v4 或 v6）或使用 CIDR 记法表示的 IP 段 |
| host | 字符串 | | 匹配请求的目的域名，支持 perl 风格的正则表达式。该域名和 SafeLine 「防护站点」中的「域名」+「监听端口」对应，**即匹配时不省略端口号**。 |
| url_path | 字符串 | | 匹配请求的路径，支持 perl 风格的正则表达式。**路径中不包含[请求参数](https://en.wikipedia.org/wiki/Query_string)**|
| target	 | 枚举类型 | `safeline.MATCH_TARGET_ALL` | 匹配全部请求（默认值）|
| | | `safeline.MATCH_TARGET_ACCESS` | 匹配普通请求 |
| | | `safeline.MATCH_TARGET_DETECT` | 匹配产生「攻击检测日志」的请求（包括被拦截的以及未拦截但产生日志的请求） |

```
注意：host 和 url_path 中的正则表达式均匹配整个字符串，例如：url_path = "/safeline"  仅匹配访问 “/safeline” 或者 “/safeline?key=xxxx” 的请求，而不匹配访问 “/safeline.html” 的请求。
```
```
提示：
对于正则表达式，建议使用 Lua 的 raw string 语法 [[ ]] 代替双引号以减少转义符的使用。
当某个字段被省略时，会被视为匹配所有，即 host 被省略时，和 host = [[.*]] 等价。
```

process 是回调函数，当插件触发时被调用，参数的值即为请求对应的源 IP 地址(ip)、目的域名(host)、访问路径(url_path)。函数无返回值。
```
例如：对于一个访问 https://www.chaitin.cn/zh/safeline 的请求，其 host 是 "www.chaitin.cn:443"，访问路径是 "/zh/safeline"。
```
在回调函数中，下列函数可获取当前请求的上下文：
- `target = safeline.get_target()`
    - 获取当前请求的 target 信息，可能返回值如下：
    
    | 返回值 | 含义 |
    |:--------:|:--------:|
    | safeline.MATCH_TARGET_ACCESS | 普通的访问请求 |
    | safeline.MATCH_TARGET_DETECT | 产生「攻击检测日志」的请求（包括被拦截的以及未拦截但产生日志的请求）|
    
- `session = safeline.get_session()`
    - 获取当前请求的 session 信息
    - 返回值为 table，其 key 为 session ID，其 value 为 session  value。默认的 session ID 是字符串 "session"。


- `info = safeline.get_detailed_info()`
    - 获取当前请求的详细信息，返回值为 table，其索引随着 target 的不同。
    - 返回值为 table，当请求的 target 是 `safeline.MATCH_TARGET_ACCESS` 是，其内容为：
    
    | 字段 | 类型 | 含义 |
    |:--------:|:--------:|:--------:|
    | scheme | 字符串 | 请求的协议，目前可能的取值为 "http"或 "https"|
    | method | 字符串 | 请求的[HTTP请求方法](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods) |
    | host | 字符串 | 请求的目标域名 |
    | port | 整数 | 请求的目标端口 |
    | url_path | 字符串 | 请求的路径，不包含请求参数 |
    | timestamp | 时间 | 请求到达服务器时的时间戳 |
    | time | 浮点数 | 请求消耗业务服务器的时间，单位为秒 |
    | status_code| 整数 | 请求的[HTTP响应状态码](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Status) |
    | ip | 字符串 | 请求的源 IP 地址 |
    | req_block_reason | 字符串 | 请求被拦截的原因，可能的取值为 "web" 或 "acl"，分别代表被 检测引擎 和 访问控制拦截。请求未被拦截时该字段被省略 |
    | resp_block_reason | 字符串 | 该请求的响应被拦截的原因，取值同 req_block_reason |
    - 当请求的 target 是 `safeline.MATCH_TARGET_DETECT` 时，其部分内容为：
    
    | 字段 | 类型 | 含义 |
    |:--------:|:--------:|:--------:|
    | node | 字符串 | 检测服务器节点名称 |
    | timestamp | 整数 | 请求的 Unix 时间戳 |
    | host | 字符串 | 请求的目标域名 |
    | urlpath | 字符串 | 请求的访问路径 |
    | method | 字符串 | 请求的[HTTP请求方法](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods) |
    | req_header_raw | 字符串 | 经过编码的 HTTP 请求头 |
    | resp_header_raw | 字符串 | 经过编码的 HTTP 响应头 |
    | body | 字符串 | 请求体 |
    | resp_body | 字符串 | 响应体 |
    | src_ip | 字符串 | 请求的源 IP |
    | dest_ip | 字符串 | 请求的目的 IP |
    | attack_type | 整数 | 请求的攻击类型 |
    | risk_level | 字符串 | 请求的风险级别 |
    | event_id | 字符串 | 请求的时间 ID |
    | rule_id | 字符串 | 命中该次请求的规则 ID |
    | user_agent | 字符串 | User Agent |
    | action | 整数 | SafeLine 对此请求执行的动作（拦截/放行） |


### Ticker 触发器
Ticker 触发器会根据用户指定的周期定时地调用回调函数，**在集群部署模式下亦能保证该定时器的正确性**。其注册方式如下：
```lua
local safeline = require "safeline"
 
local duration = 10
 
function tick(dur)
    -- 在此处理定时任务
end
 
safeline.register(safeline.TYPE_TICKER, duration, tick)
```
- durtaion 是一个整数，用来声明插件的触发间隔，其单位为秒。

- ticker 是插件的回调函数，当插件触发时被调用，参数 dur 的值为插件的触发间隔，其单位为秒。函数无返回值。

### Query 触发器
Query 触发器允许用户使用类 SQL 的查询语言对请求进行流式的统计，每次统计结果产生时会将其传递给回调函数。其注册方式如下：
```lua
safeline = require("safeline")
 
query = [[SELECT ip FROM access_log WHERE time > 0.01]]
 
function process(key, rows)
    -- 在此处理查询结果
end)
 
safeline.register(safeline.TYPE_QUERY, query, process)
```
- query 是用户指定的查询的语句，用法如下
    - Plumber SQL 使用
    ```sql
    --当前支持的语法如下：
    SELECT [ DISTINCT ]
    expression [ [ AS ] output_name ] [, ...]
    [ FROM source_name ]
    [ WHERE condition ]
    [ GROUP BY window | expression [, ...] ]
    [ HAVING condition [, ...] ]
    [ ORDER BY expression [ ASC | DESC ] ]
    [ LIMIT count ]
    [ OFFSET start ];
    ```
    - Source
    ```sql
    --Source 代表了一个数据流，当前仅支持在 FROM 子句中直接指定 source_name。
    --指定数据源后可在其他字句中直接引用流中的字段名。
    SELECT word form article；
    SELECT article.word form article；
    ```
    - 函数
        - 窗口函数
        
            窗口函数将无边界的数据流按照某种策略划分为有边界的数据分组，每个数据分组被成为一个「窗口」。

            窗口函数只能在 GROUP BY 子句中使用，在表达式中被引用时，窗口函数的返回值为该窗口的 ID（对于时间窗口，该 ID 为窗口的起始时间戳）。
            ```
            注意： 当前仅支持时间窗口。
            ```
            - `TUMBLE_WINDOW(timestamp, size)`:使用滚动时间窗口，`timestamp` 为划分的时间戳，若数据流中的元素不包含可用的时间戳，可以使用 本地时间 `NOW()` 替代，`size` 为以秒为单位的窗口大小。
            - `TUMBLE_WINDOW(timestamp, size, slide)`:使用滑动时间窗口，`timestamp` 为划分的时间戳，若数据流中的元素不包含可用的时间戳，可以使用 本地时间 `NOW()` 替代，`size` 为以秒为单位的窗口大小，`offset` 为以秒为单位的窗口滑动步长。
        - 聚合函数
            聚合函数将数据流中的分组聚合为单个元素。
            聚合函数只能在 GROUP BY 中指定了 key 的情况下使用，且不允许在 WHERE 子句中使用。
            - `COUNT(<expression>)`:统计当前分组中元素的个数。
            ```
            注意： 暂不支持 COUNT(*)。
            ```
            - `SUM(<expression>)`:对当前分组中的元素求和。
        - 标记函数
            标量函数可以作为任意表达式使用。
            - `NOW()`:返回当前时间。

- 目前可用的数据源为  "access_log" ，其内容为当前所有请求的概要数据，具体字段如下：

    | 字段 | 类型 | 含义 |
    |:--------:|:--------:|:--------:|
    | scheme | 字符串 | 请求的协议，目前可能的取值为 "http"或 "https"|
    | method | 字符串 | 请求的[HTTP请求方法](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods) |
    | host | 字符串 | 请求的目标域名 |
    | port | 整数 | 请求的目标端口 |
    | url_path | 字符串 | 请求的路径，不包含请求参数 |
    | timestamp | 时间 | 请求到达服务器时的时间戳 |
    | time | 浮点数 | 请求消耗业务服务器的时间，单位为秒 |
    | status_code| 整数 | 请求的[HTTP响应状态码](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Status) |
    | ip | 字符串 | 请求的源 IP 地址 |
    | req_block_reason | 字符串 | 请求被拦截的原因，可能的取值为 "web" 或 "acl"，分别代表被 检测引擎 和 访问控制拦截。请求未被拦截时该字段被省略 |
    | resp_block_reason | 字符串 | 该请求的响应被拦截的原因，取值同 req_block_reason |
    查询每次返回的结果会作为参数传递给回调函数，若返回结果为数据分组，参数 key 即为分组的 key，参数 rows 即为分组内容；若返回结果为单个元素，则参数 key 为 nil，参数 rows 仅包含一个元素。
    ```
    注意:请勿使用 pairs 或 ipairs 遍历 rows 对象，直接 for row in rows do 即可。
    ```
    ```lua
    -- 示例
    -- 查询 5 秒内访问超过 100 次的前 10 个 IP：
    SELECT ip FROM access_log GROUP BY TUMBLE_WINDOW(timestamp, 5), ip HAING COUNT(ip) > 100 ORDER BY COUNT(ip) DESC LIMIT 10
    -- 查询每次请求时间超过 0.01 秒的请求的信息：
    SELECT ip, (scheme + "://" + host + url_path) as url FROM access_log WHERE time > 0.01
    ```

## 接口函数

此处列举在扩展插件可供使用的接口函数。所有接口函数均位于 safeline 包内，以 “返回值 = 函数名(参数)”形式描述其签名，多个返回值和参数之间以英文逗号 "," 分隔，变长参数以三个句号 "..." 表示。

### 访问频率控制
SafeLine 的「访问控制规则」的部分接口。
表 key 定义了限制条件：

| 字段 | 含义 |
|:--------:|:--------:|
| scheme | 限制特定协议的请求，默认为 "http" |
| ip | 限制源 IP 的访问 |
| session | 限制 session 的访问 |
| host | 限制对 host 的访问 | 
| url_path | 限制对特定地址的访问 |

枚举值 scope 修饰了 key 中的定义：

| 值 | 含义 |
|:--------:|:--------:|
| safeline.ACTION_SCOPE_ALL	| 限制所有请求 |
| safeline.ACTION_SCOPE_URL	| 限制访问特定地址的请求 |
| safeline.ACTION_SCOPE_URLPREFIX | 限制访问某特定前缀地址的请求 |

- `err = safeline.action_ban(scope, key, duration)`
    - 封禁符合 key 约束的请求，有效时间为 duration 秒。
    - duration 为整型，以秒为单位。
    - 提交请求成功时函数返回 nil，失败时返回包含错误信息的字符串。
- `err = safeline.action_limit(scope, key, duration, period, limit)`
    - 限制符合 key 约束的请求的访问频率，在 period 内只允许访问 limit 次，有效时间为 duration 秒。
    - duration 为整型，以秒为单位；period 为整型，以秒为单位；limit 为整型。
    - 提交请求成功时函数返回 nil，失败时返回包含错误信息的字符串。

### KV 存储

插件系统内置的键值对型数据库（key-value database）接口，所有接口函数的第一个参数需要指定在哪个 DB 中操作，可选值为如下：

| DB | 用途|
|:--------:|:--------:|
| `safeline.DB_LOCAL` | 对于每个插件是独立的，不同插件之间互不干扰 |
| `safeline.DB_GLOBAL` |在所有插件间共享，不同插件直接可以交换数据 |

**DB 中的 key 和 value 类型均为字符串**。对于 safeline.db_add 以及 safeline.db_sub 函数，其返回值会自动转换为数字。
```
提示：从性能角度考虑，使用 safeline.DB_LOCAL 可以获得更高的性能。
```

- `val = safeline.db_get(db, key)`
    - 从指定 DB 中获取 key 对应的值。
    - 当 key 存在时，返回值为字符串，否则返回 nil。
- `safeline.db_set(db, key, val)`
    - 设定指定 DB 中 key 的值为 val。
    - 无返回值。
- `safeline.db_del(db, key)`
    - 从指定 DB 中删除 key。
- `size = safeline.db_size(db)`
    - 获取指定 DB 中 key  数目。
    - 返回值为整数。
- `safeline.db_clear(db)`
    - 清空指定 DB。
- `result = safeline.db_add(db, key, val)`
    - 给指定 DB 中 key 的值加上浮点数 val，即 db[key] += val，key 不需要事先创建，初始值为 0。
    - 返回累加后的值，类型为浮点数。
    ```
    注意：直接对该 key 调用 safeline.db_get 会返回字符串形式的值。
    ```
- `result = safeline.db_sub(db, key, val)`
    - 给指定 DB 中 key 的值减去浮点数 val，即 db[key] -= val，key 不需要事先创建，初始值为 0。
    - 返回累加后的值，类型为浮点数。
    ```
    注意：直接对该 key 调用 safeline.db_get 会返回字符串形式的值。
    ```

### HTTP 客户端

- `resp, err = safeline.http_get(url, header)`
    - 对地址 url 发起一次 HTTP GET 请求，url 中可携带 GET 参数，在 header 中可指定 HTTP header。
    - url 为字符串类型，header 为 table 类型。
    - 返回值为中 err 为字符串类型，包含请求错误信息，无错误时值为 nil，当无错误发生时resp 为 table 类型，包含 HTTP 请求的响应，其结构示例如下：
    ```
    {
        status_code = 200,
        header = {
            -- ...
        },
        body = "Response body",
    }
    ```
- `resp, err = safeline.http_post(url, header, data)`
    - 对地址 url 发起一次 HTTP POST 请求，在 header 中可指定 HTTP header，data 为 POST 数据。
    - url 为字符串类型，header 为 table 类型，data 为字符串类型。
    - 返回值同 safeline.http_get()。

### 插件日志
- `safeline.log(tag, msg)`
    - 产生一条插件日志，日志可以在 SafeLine 管理界面「检测日志」→ 「扩展插件日志」中查看。
    - tagtag 被插件系统内部保留使用，msg 是日志内容，tag 和 msg 均不得为空。 和 msg 均为字符串类型，tag 用于标记日志的类别，值为 "system" 的
    - 函数无返回值。


### 异步支持
对于某些需要等待返回结果的操作（比如 action_ban），我们可能需要在较短时间内执行多次（比如封禁 1000 个查询到的违规用户），此时我们就需要将这些任务异步化。

本 API 支持 Promise 风格的异步。一个 Promise 定义了一个异步的执行流。Promise 由 Promise 链节点组成，Promise 链中一个节点包含对上一节点返回的结果的处理。

比如，我们希望封禁一个用户，并且在日志中记录封禁的成功与否及失败原因。此时，日志记录就应该作为封禁操作的下一个Promise链条节点，因为它需要封禁的结果。

和 Promise 有关的 API 有：
- `promiseObject = safeline.promise(func, ...)`
    - 创建 Promise 对象并返回，其中 func 是需要执行的异步函数，后面的...是该函数的参数。
- `newPromiseObject = promiseObject(func, ...)`
    - 往一个 promise 后添加一个 Promise 链的节点，并返回添加节点后的 Promise，func 是该节点要执行的异步函数，...是该函数的参数。
    - 注意，Promise 链条的上一个节点的返回值是当前节点的函数参数，且出现在通过...指定的参数后。
- `promiseObject()`
    - 提交一个 Promise 对象，使之能执行。注意，一个 Promise 对象如果不提交，那它不会执行。
    - Promise 的执行由 lua 插件的调度器决定在合适的时机执行。
    - 以封禁一群用户并记录相应日志为例
    ```lua
    --同步执行（每封禁一个用户之前必须等待前一个用户的封禁结果返回并日志）：
    safeline = require("safeline")
 
    safeline.register(safeline.TYPE_QUERY, [[
            SELECT
                    TUMBLE_WINDOW(timestamp, 1) AS timestamp,
                    ip,
                    COUNT(ip) AS count_ip,
                    SUM(time) AS interval
            FROM access_log
            GROUP BY TUMBLE_WINDOW(timestamp, 1), ip
            HAVING count_ip > 2000
            ORDER BY count_ip desc
    ]], function(key, rows)
            for r in rows do
                   err = safeline.action_ban(safeline.ACTION_SCOPE_URLPREFIX, {
                            ip = r.ip,
                            host = "myhost.com",
                            urlpath = "/",
                            scheme = "http"
                   }, 0)
                   if err == nil then
                            safeline.log("Banned user " .. r.ip .. " from accessing.")
                   else
                            safeline.log("Cannot ban user " .. r.ip .. " due to error: " .. err)
                   end
            end
    end)
    --使用 Promise 的例子（封禁不同用户并日志的操作互不相关，在 lua 引擎看来就是不同的执行流）：
    safeline = require("safeline")
 
    safeline.register(safeline.TYPE_QUERY, [[
            SELECT
                    TUMBLE_WINDOW(timestamp, 1) AS timestamp,
                    ip,
                    COUNT(ip) AS count_ip,
                    SUM(time) AS interval
            FROM access_log
            GROUP BY TUMBLE_WINDOW(timestamp, 1), ip
            HAVING count_ip > 2000
            ORDER BY count_ip desc
    ]], function(key, rows)
            for r in rows do
                    err = safeline.action_ban(safeline.ACTION_SCOPE_URLPREFIX, {
                            ip = r.ip,
                            host = "myhost.com",
                            urlpath = "/",
                            scheme = "http"
                    }, 0)(function(err)
                            if err == nil then
                                    safeline.log("Banned user " .. r.ip .. " from accessing.")
                            else
                                    safeline.log("Cannot ban user " .. r.ip .. " due to error: " .. err)
                            end
                    end)()
            end
    end)
    ```

## 示例
一个典型的插件如下所示：
```lua
local safeline = require "safeline"
 
query = [[ SELECT ip, (scheme + '://' + host + url_path) as url, time FROM access_log WHERE time > 0.01 ]]
 
function process(key, rows)
    for row in rows do
        safeline.log("耗时请求", "IP: " .. row.ip .. ", URL: " .. row.url .. ", time: " .. row.time)
    end
end
 
 
 
safeline.register(safeline.TYPE_QUERY, query, process)
```

