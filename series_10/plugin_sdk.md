# SafeLine 10 扩展插件文档

SafeLine 扩展插件系统（以下简称插件系统）使用 Lua 作为脚本语言，**目前语法兼容标准 Lua 5.1。**

在「入侵检测」→「扩展插件管理」页面可对插件进行新增，查看，删除等操作。本文档将说明插件的编写方法以及可用的相关接口。



## 导入

在编写插件时，首先需要导入 skynet 模块，skynet 模块包含了插件系统提供的所有接口。

```lua
local skynet = require "skynet"
```

注意： 出于安全性的考量，插件脚本中只允许使用有限的标准库函数，其中 IO 库中的所有函数，OS 库中的 `execute`, `exit`, `remove`, `setlocale`, `tmpname` 等函数均被禁用。

## 注册

每个插件都需要调用注册函数，注册函数的参数根据插件的类型有所不同。

其函数签名如下：

```lua
function skynet.register(type, ...)
```

`type` 代表插件的类型，可能的取值为:
- `skynet.TYPE_PROCESS`  process 插件
- `skynet.TYPE_TICKER`   ticker 插件

### process 插件

process 类型的插件会被特定的请求触发，其注册方式如下：

```lua
local skynet = require "skynet"
 
local match = {
    ip      = "0.0.0.0/0",          -- 字符串类型，要匹配的 ip 段，使用 cidr 记法
    host    = ".*\\.chaitin\\.cn",  -- 字符串类型，要匹配的域名，支持 perl 风格的正则表达式
    urlpath = ".*",                 -- 字符串类型，访问路径，同样支持正则
    type    = [type value],         -- 指定 plugin 被触发的模式（可省略）
                                       -- skynet.MATCH_TYPE_DEFAULT：优化的触发模式，每秒钟最多一次（默认值）
                                       -- skynet.MATCH_TYPE_ALL：每个请求都被触发
    target  = [target value],       -- 指定plugin要命中的请求类型（可省略）
                                       -- skynet.MATCH_TARGET_ALL：命中全部请求（默认值）
                                       -- skynet.MATCH_TARGET_ACCESS：命中未被拦截的请求
                                       -- skynet.MATCH_TARGET_DETECT：命中产生攻击日志的请求（包括被拦截的以及未拦截但产生日志的请求）
}
 
 
function process(ip, host, urlpath)
   -- 在此处理请求
end
 
skynet.register(skynet.TYPE_PROCESS, match, process)
```

- `match` 是一个 table，用来声明插件的触发规则，其中，`ip` `host` `urlpath` 规定了能够触发插件的请求的形式。如果只关心请求中的某些数据，可以据此省略 table 中的某些数据域(field)。比如只关心请求中的 IP，可以在 `match` 中仅指定 IP。
```
注意： 域的组合不是任意的，目前支持的组合有 (ip)、(ip,host)、(host,urlpath)、(ip,host,urlpath) 四种。不同的组合选择将导致不同的匹配行为。
```

例如，如下两种组合理论上能够匹配完全相同的请求：
1. `{ip = "0.0.0.0/0", host = "localhost", urlpath = "/"}`
2. `{host = "localhost", urlpath = "/"}`

但是，这两种组合却会导致对插件的不同触发行为。第一个组合会针对不同的 ip 进行单独触发，而第二个在触发时并不关心 ip 的情况，只针对不同的 `host` 和 `urlpath` 进行触发。因此第二个组合会减少实际的触发次数，从而获得更好的性能。所以在实现 plugin 时，如果对于某个域并不关心，最好的做法是不写该域，而不是使用类似于`0.0.0.0/0`或`.*`这样的通配符。
```
注意： 当 match 的 target = skynet.MATCH_TARGET_ALL 且用户在 SafeLine 的「入侵检测」→「防护策略管理」中添加了「自定义规则」时，插件可能会接收到类型分别为 skynet.MATCH_TARGET_ACCESS 和 skynet.MATCH_TARGET_DETECT 的重复请求，如果需要去重，请使用 skynet.get_target() 判断类型后再做处理。
```
- `process` 是插件的的回调函数，当插件触发时被调用，参数的值即为请求对应的客户端 IP 地址(`ip`)、访问域名(`host`)、访问路径(`urlpath`)。例如，对于一个访问 `https://chaitin.cn/safeline.html` 的请求，其域名是 `chaitin.cn`，访问路径是 `/safeline.html` ）。
```
注意： 
为了保证性能，默认设置插件的 match.type = skynet.MATCH_TYPE_DEFAULT，同样的请求（即 ip、host、urlpath 相同）在一秒内只会被触发一次。

对于搭载了插件平台版本 >= 1.0.0 的 SafeLine(详询技术人员)， 当插件的 target = skynet.MATCH_TARGET_DETECT 时，此模式不起作用，等同于 skynet.MATCH_TYPE_ALL

host 和 urlpath 中的正则表达式均匹配整个字符串（插件平台在正则后插入了 $），例如 urlpath = "/safeline" 仅匹配访问 /safeline 或者 /safeline?key=xxxx 的请求，而不匹配访问 /safeline.html 的请求。
```

- 回调函数无返回值。

### ticker 插件

ticker 类型的插件会被定时触发，其注册方式如下：

```lua
local skynet = require "skynet"
 
local duration = 10
 
function ticker(dur)
    -- 在此处理定时任务
end
 
skynet.register(skynet.TYPE_TICKER, duration, ticker)
```
- `durtaion` 是一个整数，用来声明插件的触发间隔，其单位为秒。

- `ticker` 是插件的回调函数，当插件触发时被调用，参数 `dur` 的值为插件的触发间隔，其单位为秒。

- ticker 插件通常用于定时获取所有请求的统计信息，例如获取访问频率最高的某个 URL（详见本文档「接口函数」→「top 类」一节）。
```
注意： 并非所有的接口函数都可以在 ticker 插件的回调函数中被调用，以接口函数的说明为准。
```

- 回调函数无返回值。

## 接口函数

skynet 包中提供的函数以下统称为接口函数。

### key table
key 是一个在接口函数中广泛使用的数据结构。

```lua
key = {
    ip      = "",
    host    = "",
    urlpath = "",
}
```
`key` 的结构和 process 插件的 `match` 相似，但只保留了描述请求的域，和 match 不同的是，key 中的数据只能是确定值，即，`ip` 只能是单个的 ip 地址，`host` 和 `urlpath` 不支持正则表达式。

用户可将其作为参数传递给接口函数，查询指定 `ip／host／urlpath` 的访问频率，风险级别等，或者对其进行封禁。

以下函数中的 `key` 参数为上述的 `key table`，代表符合条件的一类请求。

### stat 类

获取（非攻击）请求的统计信息，理论上可查询的最大时间范围为 60 分钟 + 60 秒。

`function skynet.stat_visit(key, time) `：
- 返回在过去 `time` 秒内符合 `key` 约束的请求数。
- `time` 为整型，以秒为单位。
- 返回值为整型。

`function skynet.stat_time(key, time) `:
- 返回在过去 time 秒内符合 key 约束的请求消耗服务器的时间。
- `time` 为整型，以秒为单位。
- 返回值为整型，以秒为单位。

`function skynet.stat_resp_code(key, time)` :
- 返回一个以 HTTP 状态码为索引的 table，其值为在过去 time 秒内符合 key 约束的不同 HTTP 状态码的请求数。
- `time` 为整型，以秒为单位。
- 返回值为 table。
  - skynet.RESP_CODE_1XX 请求已接受，需要继续处理
  - skynet.RESP_CODE_2XX 请求已成功
  - skynet.RESP_CODE_3XX 请求重定向
  - skynet.RESP_CODE_4XX 客户端错误
  - skynet.RESP_CODE_5XX 服务端错误

### top 类

`function skynet.top_n(type, n, duration)`:
- 查询在 `duration` 秒内出现频率最高的前 n 条数据，数据类型由 `type` 指定。
- `type` 为整型，其可能的取值如下：
  - `skynet.TOP_IP` 查询指定时间段内 所有请求中出现频率最高的 **IP**
  - `skynet.TOP_IP_HOST` 查询指定时间段内，所有请求中出现频率最高的 **IP**，**域名** 组合
  - `skynet.TOP_HOST_URLPATH` 查询指定时间段内，所有请求中出现频率最高的 **域名**，**访问路径** 组合
  - `skynet.TOP_IP_HOST_URLPATH` 查询指定时间段内，所有请求中出现频率最高的 **IP**，**域名**，**访问路径** 的组合
  - `skynet.TOP_SESSION` 查询指定时间段内，所有请求中出现频率最高的 **session**
  - `skynet.TOP_IP_SESSION` 查询指定时间段内，所有请求中出现频率最高的 **IP**，**session**组合
  - `skynet.TOP_SESSION_HOST` 查询指定时间段内，所有请求中出现频率最高的的 **session**，**域名** 组合
  - `skynet.TOP_SESSION_HOST_URLPATH` 查询指定时间段内，所有请求中出现频率最高的的 **session**，**域名** ，**访问路径** 组合
```
注意：此处的 session 特指 SafeLine 的「Session 策略」中所指定的 session，请在「站点管理」→「防护站点管理」中选择一个虚拟服务器，在其子站点的编辑窗口中即可指定 session 策略。
```
- `n`, `duration` 均为整型，`duration` 可能的取值如下：
  - skynet.TOP_DURATION_5S 查询 5 秒内的数据
- 返回一个 key table 的数组，key table 中额外的 count 域保存了访问次数。
```
注意：当插件平台的部署模式为集群时，该函数取得的数据为当前节点下的数据，在之后的版本中会支持获取全部节点合并后的数据。
```

### action 类

SafeLine 的「访问控制规则」的部分接口。

`function skynet.action_ban(key, duration)`:
- 封禁符合 `key` 约束的请求，有效时间为 `duration` 秒。
- `duration` 为整型，以秒为单位。
- 提交请求成功时函数返回 `nil`，失败时返回包含错误信息的字符串。

`function skynet.action_limit(key, duration, period, limit)`:
- 限制符合 `key` 约束的请求的访问频率，在 `period` 内只允许访问 `limit` 次，有效时间为 `duration` 秒。
- `duration` 为整型，以秒为单位；`period` 为整型，以秒为单位；`limit` 为整型。
- 提交请求成功时函数返回 `nil`，失败时返回包含错误信息的字符串。

### db 类

插件系统内置的键值对型数据库（key-value database）接口，所有接口函数的第一个参数需要指定在哪个 DB 中操作，可选值为 `skynet.DB_GLOBAL` 或 `skynet.DB_LOCAL`，LOCAL DB 对于每个插件是独立的，不同插件之间互不干扰。GLOBAL DB 是所有插件共享的，不同插件可以通过 GLOBAL DB 交换数据。

key 和 value 的类型均为字符串，对于 `skynet.db_add` 以及 `skynet.db_sub` 函数，其返回值会自动转换为数字。

从性能角度考虑，如果不是必须的话，尽量使用 LOCAL DB，可以获得更高的性能。

```
function skynet.db_get(db, key) 
```
```
function skynet.db_set(db, key, val) 
```
```
function skynet.db_del(db, key)
```
```
function skynet.db_size(db) 
```
```
function skynet.db_clear(db) 
```
```
function skynet.db_add(db, key, val) 
```
执行：`db[key] += val`，不需要事先创建，初始值为 0
```
function skynet.db_sub(db, key, val)
```
执行：`db[key] -= val`，不需要事先创建，初始值为 0

### http 类

插件系统内置的 HTTP 客户端接口。
`function skynet.http_get(url, header)`:
- 对地址 `url` 发起一次 HTTP GET 请求，`url` 中可携带 GET 参数，在 `header` 中可指定 HTTP header。
- `url` 为字符串类型，`header` 为 table 类型。
- 返回值为 `(resp, err)`，`err` 为字符串类型，包含请求错误信息，无错误时值为 `nil`，当无错误发生时 `resp` 为 table 类型，包含 HTTP 请求的响应，其结构示例如下：
    ```
    {
        status_code = 200,
        header = {
            -- ...
        },
        body = "Response body",
    }
    ```

`function skynet.http_post(url, header, data)`:
- 对地址 `url` 发起一次 HTTP POST 请求，在 `header` 中可指定 HTTP header，`data` 为 POST 数据。
- `url` 为字符串类型，`header` 为 table 类型，`data` 为字符串类型。
- 返回值同 `skynet.http_get()`。

### log 类

`function skynet.log(tag, msg)`:
- 产生一条插件日志，日志会被记录到日志文件中或者显示在 SafeLine 的界面上。
- `tag` 和 `msg` 均为字符串类型，`tag` 用于标记日志的类别，值为 “system” 的 tag 被插件系统内部保留使用，`msg` 是日志内容，`tag` 和 `msg` 均不得为空。
- 函数无返回值。
```
注意：大量发送日志会给 SafeLine 后端造成压力，因此插件平台会限制日志的发送频率，超过阈值的日志会被直接丢弃。
```

### 其他类

`function skynet.get_target()`:获取当前请求的 target 信息，可能的返回值如下：
- `skynet.MATCH_TARGET_ACCESS` 普通的访问请求
- `skynet.MATCH_TARGET_DETECT` 被 SafeLine 命中的请求，可能是一个攻击请求

```
注意： 该函数不适用于 ticker 插件。
```

`function skynet.get_sesion()`:
- 获取当前请求的 session 信息。
- 返回值为二维数组，内层数组长度固定为 2。其第一个元素为 session id，第二个元素为 session value。
    ```
    [
        ["session_id", "session_value"],
        ["session_id", "session_value"],
        ...
    ]
    ```
```
注意： 该函数不适用于 ticker 插件。
```

`function skynet.get_detailed_info()`：
- 获取当前请求的详细信息，返回值为 table，其索引随着 target 的不同。
```
注意： 该函数不适用于 ticker 插件。
```
- 返回值为 table。


当请求的 target 是 `skynet.MATCH_TARGET_ACCESS` 是，其内容为：
```
{
    ip      = "",    -- IP，可能是代理服务器的 IP 地址
    time    = 0,     -- 消耗后端服务器的时间，以秒为单位
    host    = "",    -- 域名
    uri     = "",    -- 访问路径
    src_ip  = "",    -- 真正的源 IP，可能为空
}
```

当请求的 target 是 `skynet.MATCH_TARGET_DETECT` 时，说明这是一个被 SafeLine 拦截的请求，其部分内容为（完整内容待补全）：
```

{
    node            =  "",    -- 检测服务器节点名称
    timestamp       =  0,     -- Unix 时间戳
    host            =  "",    -- 域名
    attack_type     =  1,     -- 攻击类型
    risk_level      =  0,     -- 风险级别，其取值和 skynet.stat_risk() 返回的 table 的索引相同
    event_id        =  "",    -- 该次拦截的事件 ID
    req_header_raw  =  "",    -- 经过编码的请求的 HTTP 头
    rule_id         =  "",    -- 命中该次拦截的规则 ID
    src_ip          =  "",    -- 源 IP
    user_agent      =  "",    -- User Agent
    urlpath         =  "",    -- 访问路径
    action          =  1,     -- SafeLine 对此请求执行的动作
    method          =  "",    -- 请求的方法，比如 GET/POST 等
    dest_ip         =  "",    -- 请求的目的 IP
    resp_header_raw =  "",    -- 原始响应头
    resp_body       =  "",    -- 原始响应内容
}
```

## 示例
一个典型的插件如下所示：
```lua
local skynet = require "skynet"
 
match = {
    ip      = "0.0.0.0/0",
    host    = ".+",
    urlpath = ".+",
    type    = skynet.MATCH_TYPE_ALL,
    target  = skynet.MATCH_TARGET_ALL,
}
 
function process(ip, host, urlpath)
    skynet.log("process", "matched")
 
    local m = {
        ip   = ip,
        host = host,
    }
 
    for i, v in ipairs(skynet.get_session()) do
        skynet.log("process", v[0] .. ": " .. v[1])
    end
 
    local c = skynet.stat_visit(m, 10)
 
    if c > 30 then
        skynet.action_ban(m, 60)
    end
end
 
skynet.register(skynet.TYPE_PROCESS, match, process)
```
