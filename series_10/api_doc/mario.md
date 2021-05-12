# /api/v1/mario/plugin

## GET



### 获取 mario 插件



本 API 支持翻页参数

响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": "bbe6087e83324efba5ef7fec1c59ff95",
            "create_time": 1545297433.275232,
            "update_time": 1545297433.275248,
            "statistic": {
                "total_execution": 0.0,
                "total_error_execution": 0.0,
                "execution_per_second": 0.0,
                "average_execution_time": 0.0,
                "error_execution_per_second": 0.0,
                "timestamp": 0.0
            },
            "running_state": "unknown",
            "name": "plugin1",
            "comment": "",
            "type": "user_plugin",
            "state": "enabled",
            "code": "print(\"test\")",
            "hash": "231496871f9a2ed5404086f91b6ef55f"
        }
    ]
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False | 最大长度: 64;  | 
|comment | 字符串 | 非必填/'' | False | 最小长度: 0；  | 
|state | 指定选项 | 必填 | False | 选项是: ['enabled', 'disabled'] | 
|code | 字符串 | 必填 | False | lua 脚本;  | 



### 新建 mario 插件



请求

```js
{
    "name": "plugin1",
    "state": "enabled",
    "code": "print(\"test\")"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": "85d81d46fc474edf8311bdeb2c597668",
        "create_time": 1545297433.000389,
        "update_time": 1545297433.000405,
        "statistic": {
            "total_execution": 0.0,
            "total_error_execution": 0.0,
            "execution_per_second": 0.0,
            "average_execution_time": 0.0,
            "error_execution_per_second": 0.0,
            "timestamp": 0.0
        },
        "running_state": "unknown",
        "name": "plugin1",
        "comment": "",
        "type": "user_plugin",
        "state": "enabled",
        "code": "print(\"test\")",
        "hash": "231496871f9a2ed5404086f91b6ef55f"
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False | 最大长度: 64;  | 
|comment | 字符串 | 非必填/'' | False | 最小长度: 0；  | 
|state | 指定选项 | 必填 | False | 选项是: ['enabled', 'disabled'] | 
|code | 字符串 | 必填 | False | lua 脚本;  | 
|id | UUID | 必填 | False | UUID4 | 



### 修改 mario 插件



请求

```js
{
    "name": "plugin1",
    "state": "enabled",
    "code": "print(\"test\")",
    "id": "7da7a4c1933c42be90f629d5ca8dc0fd"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": "7da7a4c1933c42be90f629d5ca8dc0fd",
        "create_time": 1545297433.415531,
        "update_time": 1545297433.429221,
        "statistic": {
            "total_execution": 0.0,
            "total_error_execution": 0.0,
            "execution_per_second": 0.0,
            "average_execution_time": 0.0,
            "error_execution_per_second": 0.0,
            "timestamp": 0.0
        },
        "running_state": "unknown",
        "name": "plugin1",
        "comment": "",
        "type": "user_plugin",
        "state": "enabled",
        "code": "print(\"test\")",
        "hash": "231496871f9a2ed5404086f91b6ef55f"
    }
}
```

## DELETE

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | UUID | 必填 | False | UUID4 | 



### 删除 mario 插件



请求

```js
{
    "id": "6ff551dd85f54865a58df83e0de026e7"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": null
}
```

# /api/v1/mario/plugin/state

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|timestamp | 浮点数字 | 必填 | False |  -  | 
|id | UUID | 必填 | False | UUID4 | 
|hash | 字符串 | 必填 | False | 最大长度: 32;  | 
|state | 字符串 | 必填 | False | 最大长度: 32;  | 
|total_execution | 整型数字 | 必填 | False |  -  | 
|total_error_execution | 整型数字 | 必填 | False |  -  | 
|execution_per_second | 整型数字 | 必填 | False |  -  | 
|error_execution_per_second | 整型数字 | 必填 | False |  -  | 
|average_execution_time | 浮点数字 | 必填 | False |  -  | 



### mario 更新插件状态



请求

```js
[
    {
        "timestamp": 1545297433,
        "id": "325e4a11a0994053b918d19b14214648",
        "hash": "cfcd208495d565ef66e7dff9f98764da",
        "state": "running",
        "total_execution": 123,
        "total_error_execution": 123,
        "execution_per_second": 123,
        "error_execution_per_second": 123,
        "average_execution_time": 0.007
    },
    {
        "timestamp": 1545297433,
        "id": "78eb088083174a5cbb5cafd9222b9616",
        "hash": "c4ca4238a0b923820dcc509a6f75849b",
        "state": "running",
        "total_execution": 123,
        "total_error_execution": 123,
        "execution_per_second": 123,
        "error_execution_per_second": 123,
        "average_execution_time": 0.007
    },
    {
        "timestamp": 1545297433,
        "id": "0258fce859254377907de1a255d2975a",
        "hash": "c81e728d9d4c2f636f067f89cc14862c",
        "state": "running",
        "total_execution": 123,
        "total_error_execution": 123,
        "execution_per_second": 123,
        "error_execution_per_second": 123,
        "average_execution_time": 0.007
    },
    {
        "timestamp": 1545297433,
        "id": "7fabee0b40a3498b910c18ccffff16c1",
        "hash": "eccbc87e4b5ce2fe28308fd9f2a7baf3",
        "state": "running",
        "total_execution": 123,
        "total_error_execution": 123,
        "execution_per_second": 123,
        "error_execution_per_second": 123,
        "average_execution_time": 0.007
    }
]
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": "325e4a11a0994053b918d19b14214648",
            "action": "nop",
            "code": "0"
        },
        {
            "id": "78eb088083174a5cbb5cafd9222b9616",
            "action": "update",
            "code": "new code"
        },
        {
            "id": "0258fce859254377907de1a255d2975a",
            "action": "delete",
            "code": ""
        },
        {
            "id": "7fabee0b40a3498b910c18ccffff16c1",
            "action": "delete",
            "code": ""
        },
        {
            "id": "edf14336e5a344eea6a54e74b47f587a",
            "action": "new",
            "code": "4"
        }
    ]
}
```

# /api/v1/mario/plugin/state/log

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|timestamp | 浮点数字 | 必填 | False |  -  | 
|id | UUID | 必填 | False | UUID4 | 
|tag | 字符串 | 必填 | False | 最大长度: 32;  | 
|msg | 字符串 | 必填 | False |  -  | 



### mario 更新 plugin 日志



请求

```js
[
    {
        "timestamp": 1545297434,
        "id": "a7276226aa5c414196b02f1d332b8ea9",
        "tag": "system",
        "msg": "test msg"
    },
    {
        "timestamp": 1545297434,
        "id": "d5ebeaa7974f461891ece33a48e34fc7",
        "tag": "system",
        "msg": "test msg"
    }
]
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": null
}
```

# /api/v1/mario/plugin/log

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 
|plugin_id | 字符串 | 必填 | False |  -  | 
|tag | 字符串 | 非必填/无默认值 | False |  -  | 



### 获取插件 log



本 API 支持翻页参数

请求

```js
{
    "plugin_id": "91a1769c6d6d4fe5bc39e5e00aa661fa",
    "count": 2,
    "offset": 1,
    "time_before": 1545297433.688,
    "time_after": 1545297430.688
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "items": [
            {
                "id": 8,
                "timestamp": 1545297431.688,
                "tag": "",
                "msg": ""
            },
            {
                "id": 9,
                "timestamp": 1545297430.688,
                "tag": "",
                "msg": ""
            }
        ],
        "total": 3
    }
}
```

## DELETE

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 
|plugin_id | 字符串 | 必填 | False |  -  | 
|tag | 字符串 | 非必填/无默认值 | False |  -  | 



### 删除插件 log



请求

```js
{
    "plugin_id": "1df641ff9ecb488d980dda1553bc7e2b"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": null
}
```

# /api/v1/mario/plugin/log/download

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 
|plugin_id | 字符串 | 必填 | False |  -  | 
|tag | 字符串 | 非必填/无默认值 | False |  -  | 



### 下载插件 log



请求

```js
{
    "plugin_id": "b0a6c5863e024c1381c2671d917511f4"
}
```

响应

```js
"不支持展示的数据类型，如文件下载等"
```

