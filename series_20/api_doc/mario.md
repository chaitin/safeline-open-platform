# /api/MarioPluginAPI

## GET

### 权限
 - Website And Security Policy Management

### - 获取插件信息列表



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 9,
            "state": "running",
            "statistic": {
                "total_execution": 123.0,
                "total_error_execution": 123.0,
                "execution_per_second": 123.5,
                "average_execution_time": 0.007,
                "error_execution_per_second": 123.5,
                "timestamp": 1544513537.0
            },
            "name": "foobar",
            "comment": "comment",
            "create_time": "1544513537",
            "last_update_time": "1544513537",
            "is_enabled": true,
            "code": "print('Hello World!')",
            "hash": "e0906b1de689ae9a9daa3ed52d8ee0ac"
        }
    ],
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False |  -  | 
|comment | 字符串 | 非必填/<class 'str'> | False | 最小长度: 0；  | 
|is_enabled | 布尔 | 必填 | False |  -  | 
|code | 字符串 | 必填 | False | lua 脚本;  | 

### 权限
 - Website And Security Policy Management

### - 创建一个插件



请求

```js
{
    "name": "foobar",
    "comment": "comment",
    "is_enabled": true,
    "code": "print('Hello World!')"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 5,
        "state": "unknown",
        "statistic": {
            "total_execution": 0.0,
            "total_error_execution": 0.0,
            "execution_per_second": 0.0,
            "average_execution_time": 0.0,
            "error_execution_per_second": 0.0,
            "timestamp": 0.0
        },
        "name": "foobar",
        "comment": "comment",
        "create_time": "1544513536",
        "last_update_time": "1544513536",
        "is_enabled": true,
        "code": "print('Hello World!')",
        "hash": "e0906b1de689ae9a9daa3ed52d8ee0ac"
    },
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|name | 字符串 | 必填 | False |  -  | 
|comment | 字符串 | 非必填/<class 'str'> | False | 最小长度: 0；  | 
|is_enabled | 布尔 | 必填 | False |  -  | 
|code | 字符串 | 必填 | False | lua 脚本;  | 

### 权限
 - Website And Security Policy Management

### - 修改一个插件的信息



请求

```js
{
    "name": "new_foobar",
    "comment": "comment",
    "is_enabled": true,
    "code": "print('test_edit_mario_plugin')",
    "id": 7
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 7,
        "state": "unknown",
        "statistic": {
            "total_execution": 0.0,
            "total_error_execution": 0.0,
            "execution_per_second": 0.0,
            "average_execution_time": 0.0,
            "error_execution_per_second": 0.0,
            "timestamp": 0.0
        },
        "name": "new_foobar",
        "comment": "comment",
        "create_time": "1544513537",
        "last_update_time": "1544513537",
        "is_enabled": true,
        "code": "print('test_edit_mario_plugin')",
        "hash": "1112745ea3468f8485bb054701b74be4"
    },
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#xageqgfpcyiomciyldcwxqkytpvoxysn) | 

<a id="xageqgfpcyiomciyldcwxqkytpvoxysn">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除一个插件



请求

```js
{
    "id": 6
}
```

响应

```js
{
    "err": null,
    "data": null,
    "msg": null
}
```

# /api/MarioPluginStateUpdateAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|timestamp | 浮点数字 | 必填 | False |  -  | 
|id | 字符串 | 必填 | False |  -  | 
|state | 指定选项 | 必填 | False | 选项是: ['running', 'compile-error'] | 
|total_execution | 整型数字 | 必填 | False |  -  | 
|total_error_execution | 整型数字 | 必填 | False |  -  | 
|execution_per_second | 浮点数字 | 必填 | False |  -  | 
|error_execution_per_second | 浮点数字 | 必填 | False |  -  | 
|average_execution_time | 浮点数字 | 必填 | False |  -  | 

### 权限
 - Minion

### - 插件状态更新



请求

```js
[
    {
        "timestamp": 1544513537,
        "id": 10,
        "state": "running",
        "total_execution": 123,
        "total_error_execution": 123,
        "execution_per_second": 123.5,
        "error_execution_per_second": 123.5,
        "average_execution_time": 0.007
    }
]
```

响应

```js
{
    "err": null,
    "data": null,
    "msg": null
}
```

# /api/PluginLogAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#grujmzwrfudpeebakdozancmdqlnnugs) | 
|timestamp__range | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#mpogkbwxumdbnnuyxzniqxfxqyilowhq) | 
|plugin_id | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#vybkwoncchnjlvfnwvneoakmumiaslrx) | 
|tag__like | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#zghrtwgurvydlmahckxuhaiwxvypzahq) | 
|content__like | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#jhswphxsdjjatywrzpnljvedkqdeuexe) | 

<a id="grujmzwrfudpeebakdozancmdqlnnugs">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="mpogkbwxumdbnnuyxzniqxfxqyilowhq">timestamp__range</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 


<a id="vybkwoncchnjlvfnwvneoakmumiaslrx">plugin_id</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="zghrtwgurvydlmahckxuhaiwxvypzahq">tag__like</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="jhswphxsdjjatywrzpnljvedkqdeuexe">content__like</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 获取插件信息列表



?> 本 API 支持翻页参数

请求

```js
{
    "plugin_id": [
        "1"
    ],
    "tag__like": [
        "t"
    ],
    "content__like": [
        "c"
    ],
    "timestamp__range": [
        "1544513438-1544513538"
    ]
}
```

响应

```js
{
    "err": null,
    "data": [],
    "msg": null
}
```

# /api/DownloadPluginLogAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#ujrlngizbotoaguqwitnevlelwwbllvn) | 
|timestamp__range | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#krzymkipklphnkrixnkqnizzookbjtin) | 
|plugin_id | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#twlgkxqcncnjqbryofxlpklmwyzfkocj) | 
|tag__like | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#cbchbnrhfnkcmugcuzlsldxgyuwkllsa) | 
|content__like | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#vrlbcbgteivvdticnpkviwzxcidpcuzk) | 

<a id="ujrlngizbotoaguqwitnevlelwwbllvn">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="krzymkipklphnkrixnkqnizzookbjtin">timestamp__range</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 


<a id="twlgkxqcncnjqbryofxlpklmwyzfkocj">plugin_id</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="cbchbnrhfnkcmugcuzlsldxgyuwkllsa">tag__like</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="vrlbcbgteivvdticnpkviwzxcidpcuzk">content__like</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 下载插件日志



请求

```js
{
    "tag__like": [
        "t"
    ],
    "content__like": [
        "c"
    ],
    "timestamp__range": [
        "1544513435-1544513535"
    ]
}
```

响应

```js
{
    "err": null,
    "data": null,
    "msg": null
}
```

