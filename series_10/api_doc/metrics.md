# /api/v1/log/delete

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|domain | 字符串 | 非必填/无默认值 | False |  -  | 
|time_after | 浮点数字 | 非必填/无默认值 | False |  -  | 
|time_before | 浮点数字 | 非必填/无默认值 | False |  -  | 
|risk_level | 指定选项 | 非必填/无默认值 | False | 选项是: ['none', 'low', 'medium', 'high'] | 
|count | 整型数字 | 非必填/无默认值 | False |  -  | 
|offset | 整型数字 | 非必填/无默认值 | False |  -  | 
|src_ip | 字符串 | 非必填/无默认值 | False |  -  | 
|attack_type | 指定选项 | 非必填/无默认值 | False | 选项是: ['none', 'sql_injection', 'xss', 'csrf', 'ssrf', 'dos', 'backdoor', 'deserialization', 'code_execution', 'code_injection', 'command_injection', 'file_upload', 'file_inclusion', 'redirect', 'weak_permission', 'info_leak', 'unauthorized_access', 'unsafe_config', 'xxe', 'xpath_injection', 'ldap_injection', 'directory_traversal', 'scanner', 'permission_bypass', 'acl_bypass', 'file_write', 'file_download', 'file_deletion', 'logic_error', 'crlf_injection', 'ssti', 'click_hijacking', 'buffer_overflow', 'integer_overflow', 'format_string', 'race_condition', 'timeout', 'unknown'] | 
|action | 指定选项 | 非必填/无默认值 | False | 选项是: ['allow', 'deny'] | 
|event_id | 字符串 | 非必填/无默认值 | False | 最大长度: 36;  | 
|rule_id | 字符串 | 非必填/无默认值 | False | 最大长度: 36;  | 



### 删除防护日志



请求

```js
{
    "risk_level": [
        "high",
        "low"
    ],
    "attack_type": [
        "sql_injection",
        "xss"
    ],
    "action": [
        "deny",
        "allow"
    ]
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {}
}
```

### 删除单条日志



请求

```js
{
    "event_id": "064d9798c40f41bcb7cd7c7aec008ade"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {}
}
```

# /api/v1/log/detail

## GET



### 获取攻击日志详情



请求

```js
{
    "id": 0
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 0,
        "timestamp": 1545297166.357962,
        "node": "node",
        "province": "北京",
        "src_ip": "66.161.242.142",
        "src_port": 80,
        "dest_ip": "192.168.2.1",
        "dest_port": 80,
        "payload": "payload",
        "location": "location",
        "event_id": "064d9798c40f41bcb7cd7c7aec008ade",
        "selector_id": "100",
        "attack_type": "xss",
        "risk_level": "high",
        "action": "deny",
        "method": "GET",
        "host": "test.com",
        "urlpath": "/test",
        "decode_path": "decode_path",
        "session": {
            "session": {
                "session": "test"
            }
        },
        "req_header_raw": "req_header_raw",
        "req_body": "req_body",
        "resp_header_raw": "resp_header_raw",
        "resp_body": "resp_body",
        "module": "",
        "reason": "发现 XSS 攻击"
    }
}
```

# /api/v1/log

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|domain | 字符串 | 非必填/无默认值 | False |  -  | 
|time_after | 浮点数字 | 非必填/无默认值 | False |  -  | 
|time_before | 浮点数字 | 非必填/无默认值 | False |  -  | 
|risk_level | 指定选项 | 非必填/无默认值 | False | 选项是: ['none', 'low', 'medium', 'high'] | 
|count | 整型数字 | 非必填/无默认值 | False |  -  | 
|offset | 整型数字 | 非必填/无默认值 | False |  -  | 
|src_ip | 字符串 | 非必填/无默认值 | False |  -  | 
|attack_type | 指定选项 | 非必填/无默认值 | False | 选项是: ['none', 'sql_injection', 'xss', 'csrf', 'ssrf', 'dos', 'backdoor', 'deserialization', 'code_execution', 'code_injection', 'command_injection', 'file_upload', 'file_inclusion', 'redirect', 'weak_permission', 'info_leak', 'unauthorized_access', 'unsafe_config', 'xxe', 'xpath_injection', 'ldap_injection', 'directory_traversal', 'scanner', 'permission_bypass', 'acl_bypass', 'file_write', 'file_download', 'file_deletion', 'logic_error', 'crlf_injection', 'ssti', 'click_hijacking', 'buffer_overflow', 'integer_overflow', 'format_string', 'race_condition', 'timeout', 'unknown'] | 
|action | 指定选项 | 非必填/无默认值 | False | 选项是: ['allow', 'deny'] | 
|event_id | 字符串 | 非必填/无默认值 | False | 最大长度: 36;  | 
|rule_id | 字符串 | 非必填/无默认值 | False | 最大长度: 36;  | 



### 获取日志列表



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "total": 3,
        "items": [
            {
                "id": 0,
                "timestamp": 1545297166.616753,
                "node": "node",
                "province": "北京",
                "src_ip": "124.89.111.235",
                "src_port": 80,
                "dest_ip": "192.168.2.1",
                "dest_port": 80,
                "payload": "payload",
                "location": "location",
                "event_id": "064d9798c40f41bcb7cd7c7aec008ade",
                "selector_id": "100",
                "attack_type": "xss",
                "risk_level": "high",
                "action": "deny",
                "method": "GET",
                "host": "test.com",
                "urlpath": "/test",
                "decode_path": "decode_path",
                "session": {
                    "session": {
                        "session": "test"
                    }
                },
                "req_header_raw": "req_header_raw",
                "req_body": "req_body",
                "resp_header_raw": "resp_header_raw",
                "resp_body": "resp_body",
                "module": "",
                "reason": "发现 XSS 攻击"
            },
            {
                "id": 1,
                "timestamp": 1545210766.737222,
                "node": "node",
                "province": "北京",
                "src_ip": "249.135.0.145",
                "src_port": 80,
                "dest_ip": "192.168.2.1",
                "dest_port": 80,
                "payload": "payload",
                "location": "location",
                "event_id": "064d9798c40f41bcb7cd7c7aec008ade",
                "selector_id": "100",
                "attack_type": "xss",
                "risk_level": "high",
                "action": "deny",
                "method": "GET",
                "host": "test.com",
                "urlpath": "/test",
                "decode_path": "decode_path",
                "session": {
                    "session": {
                        "session": "test"
                    }
                },
                "req_header_raw": "req_header_raw",
                "req_body": "req_body",
                "resp_header_raw": "resp_header_raw",
                "resp_body": "resp_body",
                "module": "",
                "reason": "发现 XSS 攻击"
            },
            {
                "id": 2,
                "timestamp": 1545124366.738601,
                "node": "node",
                "province": "北京",
                "src_ip": "82.39.218.183",
                "src_port": 80,
                "dest_ip": "192.168.2.1",
                "dest_port": 80,
                "payload": "payload",
                "location": "location",
                "event_id": "064d9798c40f41bcb7cd7c7aec008ade",
                "selector_id": "100",
                "attack_type": "xss",
                "risk_level": "high",
                "action": "deny",
                "method": "GET",
                "host": "test.com",
                "urlpath": "/test",
                "decode_path": "decode_path",
                "session": {
                    "session": {
                        "session": "test"
                    }
                },
                "req_header_raw": "req_header_raw",
                "req_body": "req_body",
                "resp_header_raw": "resp_header_raw",
                "resp_body": "resp_body",
                "module": "",
                "reason": "发现 XSS 攻击"
            }
        ]
    }
}
```

# /api/v1/stat/attack_number_trend

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 
|domain | 字符串 | 非必填/无默认值 | False |  -  | 



### 获取攻击数时间趋势



响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "time": 1545235200,
            "count": 1
        }
    ]
}
```

# /api/v1/stat/req_number_trend

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 



### 获取请求数时间趋势



响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "time": 1545235200,
            "count": 100
        }
    ]
}
```

# /api/v1/stat/risk_level

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 
|domain | 字符串 | 非必填/无默认值 | False |  -  | 



### 获取攻击等级数据



响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "risk_level": "low",
            "count": 1
        }
    ]
}
```

# /api/v1/log/archive/period

## GET



### 获取归档时间



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "length": 6,
        "date": "month"
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|date | 指定选项 | 必填 | False | 选项是: ['month', 'week', 'day'] | 
|length | 整型数字 | 必填 | False | 最小值: 1;  | 



### 获取归档历史纪录



请求

```js
{
    "date": "month",
    "length": 5
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "length": 5,
        "date": "month"
    }
}
```

### 修改归档时间



请求

```js
{
    "date": "month",
    "length": 1
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "length": 1,
        "date": "month"
    }
}
```

