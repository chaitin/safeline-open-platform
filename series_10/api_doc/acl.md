# /api/v1/acl_rule

## GET



### 筛选 acl 规则



本 API 支持翻页参数

响应

```js
{
    "err": null,
    "msg": "",
    "data": []
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|expire_time | 浮点数字 | 非必填/无默认值 | True | 绝对过期时间，时间戳;  | 
|expire_after | 整型数字 | 非必填/无默认值 | True | 多少秒之后过期，和时间戳只传一个即可; 最小值: 1;  | 
|domain | 字符串 | 非必填/无默认值 | True |  -  | 
|urlpath | 字符串 | 非必填/无默认值 | True |  -  | 
|urlpath_match_method | 指定选项 | 非必填/'str' | False | 选项是: ['str', 'prefix'] | 
|action | 指定选项 | 必填 | False | 选项是: ['forbid', 'limit_rate'] | 
|limit_rate_period | 整型数字 | 非必填/无默认值 | True | 最小值: 1;  | 
|limit_rate_limit | 整型数字 | 非必填/无默认值 | True | 最小值: 1;  | 
|comment | 字符串 | 非必填/无默认值 | False | 最大长度: 128; 最小长度: 0；  | 
|cidr_list | 列表 | 非必填/[] | False |  - 详见下方表格 | 
|on_duplicate | 指定选项 | 非必填/'error' | False | 报错或跳过; 选项是: ['skip', 'error'] | 
|status | 指定选项 | 非必填/'enabled' | False | 选项是: ['enabled', 'disabled'] | 
|forbid_type | 指定选项 | 非必填/'cidr' | False | 选项是: ['cidr', 'session'] | 
|session_list | 列表 | 非必填/[] | False |  - 详见下方表格 | 

cidr_list

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | IPv4的 IP 或者子网形式字符串;  | 


session_list

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 



### 创建 acl 规则，支持 domain



请求

```js
{
    "cidr_list": [
        "1.2.3.5"
    ],
    "action": "forbid",
    "comment": "commmment",
    "domain": "test.com"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 1,
        "expire_time": null,
        "create_time": 1545297381.951624,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": "test.com",
        "urlpath": null,
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.5"
        ],
        "session_list": [],
        "uuid": "3d22e95f-fd81-42f8-8788-9f40e80901ad",
        "update_time": "2018-12-20T09:16:21.951681Z"
    }
}
```

### 创建 acl 规则，cidr + domain + path



请求

```js
{
    "cidr_list": [
        "1.2.3.6"
    ],
    "action": "forbid",
    "comment": "commmment",
    "domain": "test.com",
    "urlpath": "/test.html"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 2,
        "expire_time": null,
        "create_time": 1545297382.038304,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": "test.com",
        "urlpath": "/test.html",
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.6"
        ],
        "session_list": [],
        "uuid": "019c0ba3-7a24-4ad2-b29e-44ef35cce426",
        "update_time": "2018-12-20T09:16:22.038365Z"
    }
}
```

### 创建 acl 规则，支持过期时间



请求

```js
{
    "cidr_list": [
        "1.2.3.7"
    ],
    "action": "forbid",
    "comment": "commmment",
    "domain": "test.com",
    "urlpath": "/test.html",
    "expire_time": 1545297412
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 3,
        "expire_time": 1545297412.0,
        "create_time": 1545297382.124106,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": "test.com",
        "urlpath": "/test.html",
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.7"
        ],
        "session_list": [],
        "uuid": "20544de0-eebe-49d3-a902-2d127a50a531",
        "update_time": "2018-12-20T09:16:22.124159Z"
    }
}
```

### 创建 acl 规则，限制频率类



请求

```js
{
    "cidr_list": [
        "1.2.3.4"
    ],
    "action": "limit_rate",
    "comment": "commmment",
    "domain": "test.com",
    "urlpath": "/test.html",
    "expire_time": 1545297412,
    "limit_rate_period": 10,
    "limit_rate_limit": 100
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 4,
        "expire_time": 1545297412.0,
        "create_time": 1545297382.20804,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": "test.com",
        "urlpath": "/test.html",
        "urlpath_match_method": "str",
        "action": "limit_rate",
        "limit_rate_period": 10,
        "limit_rate_limit": 100,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.4"
        ],
        "session_list": [],
        "uuid": "61db1b28-0d5a-4be2-94ec-87684258ef35",
        "update_time": "2018-12-20T09:16:22.208090Z"
    }
}
```

### 创建 acl 规则，只有 cidr



请求

```js
{
    "cidr_list": [
        "1.2.3.4"
    ],
    "action": "forbid",
    "comment": "commmment"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 6,
        "expire_time": null,
        "create_time": 1545297382.372066,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": null,
        "urlpath": null,
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.4"
        ],
        "session_list": [],
        "uuid": "dcd5ad25-a4f9-437a-a1d4-a8a3f7f7244f",
        "update_time": "2018-12-20T09:16:22.372118Z"
    }
}
```

### 创建 acl 规则，urlpath 可以指定为匹配前缀



请求

```js
{
    "cidr_list": [
        "1.2.3.6"
    ],
    "action": "forbid",
    "comment": "commmment",
    "domain": "test.com",
    "urlpath": "/test.html",
    "urlpath_match_method": "prefix"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 7,
        "expire_time": null,
        "create_time": 1545297382.456937,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": "test.com",
        "urlpath": "/test.html",
        "urlpath_match_method": "prefix",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.6"
        ],
        "session_list": [],
        "uuid": "e7b332da-f5ee-4638-8e09-faa400bb3d93",
        "update_time": "2018-12-20T09:16:22.456987Z"
    }
}
```

### acl 规则的过期时间还可以使用相对时间，单位是秒，防止调用api的时候时间不一致导致的问题



请求

```js
{
    "cidr_list": [
        "1.2.3.4"
    ],
    "action": "forbid",
    "comment": "commmment",
    "expire_after": 120
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 8,
        "expire_time": 1545297502.61482,
        "create_time": 1545297382.61482,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": null,
        "urlpath": null,
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.4"
        ],
        "session_list": [],
        "uuid": "fd40b394-be8f-4825-a3dd-c8cc47c38960",
        "update_time": "2018-12-20T09:16:22.614820Z"
    }
}
```

### 创建 acl session 规则



请求

```js
{
    "session_list": [
        "session1"
    ],
    "action": "forbid",
    "comment": "commmment",
    "forbid_type": "session"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 9,
        "expire_time": null,
        "create_time": 1545297383.010752,
        "status": "enabled",
        "forbid_type": "session",
        "domain": null,
        "urlpath": null,
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [],
        "session_list": [
            "session1"
        ],
        "uuid": "57cdb1f7-cf4a-46e2-bfaa-8adfa8a12775",
        "update_time": "2018-12-20T09:16:23.010806Z"
    }
}
```

### 创建重复规则的时候，还可以指定为跳过，如果只有一条 IP 而且重复跳过，返回值 data 将为null



请求

```js
{
    "cidr_list": [
        "1.2.3.4",
        "2.3.4.5"
    ],
    "action": "forbid",
    "comment": "commmment",
    "on_duplicate": "skip"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 25,
        "expire_time": null,
        "create_time": 1545297384.107305,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": null,
        "urlpath": null,
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "2.3.4.5"
        ],
        "session_list": [],
        "uuid": "6767ccca-196e-47fd-b7bc-948080be7c23",
        "update_time": "2018-12-20T09:16:24.107355Z"
    }
}
```

### 创建 acl 规则，与白名单冲突



请求

```js
{
    "cidr_list": [
        "1.2.3.4"
    ],
    "action": "forbid",
    "comment": "commmment"
}
```

响应

```js
{
    "err": "ip-check-err",
    "msg": "IP 非法或属于白名单 1.2.3.4"
}
```

### 创建 acl 规则，与白名单冲突



请求

```js
{
    "cidr_list": [
        "1.2.3.4/8"
    ],
    "action": "forbid",
    "comment": "commmment"
}
```

响应

```js
{
    "err": "ip-check-err",
    "msg": "IP 非法或属于白名单 1.2.3.4"
}
```

### 创建重复规则的时候，默认行为是报错



请求

```js
{
    "cidr_list": [
        "1.2.3.4"
    ],
    "action": "forbid",
    "comment": "commmment"
}
```

响应

```js
{
    "err": "duplicate-rule",
    "msg": "1.2.3.4 与规则 ID 23 重复，无法添加"
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|expire_time | 浮点数字 | 非必填/无默认值 | True | 绝对过期时间，时间戳;  | 
|expire_after | 整型数字 | 非必填/无默认值 | True | 多少秒之后过期，和时间戳只传一个即可; 最小值: 1;  | 
|domain | 字符串 | 非必填/无默认值 | True |  -  | 
|urlpath | 字符串 | 非必填/无默认值 | True |  -  | 
|urlpath_match_method | 指定选项 | 非必填/'str' | False | 选项是: ['str', 'prefix'] | 
|action | 指定选项 | 必填 | False | 选项是: ['forbid', 'limit_rate'] | 
|limit_rate_period | 整型数字 | 非必填/无默认值 | True | 最小值: 1;  | 
|limit_rate_limit | 整型数字 | 非必填/无默认值 | True | 最小值: 1;  | 
|comment | 字符串 | 非必填/无默认值 | False | 最大长度: 128; 最小长度: 0；  | 
|cidr_list | 列表 | 非必填/[] | False |  - 详见下方表格 | 
|on_duplicate | 指定选项 | 非必填/'error' | False | 报错或跳过; 选项是: ['skip', 'error'] | 
|status | 指定选项 | 非必填/'enabled' | False | 选项是: ['enabled', 'disabled'] | 
|forbid_type | 指定选项 | 非必填/'cidr' | False | 选项是: ['cidr', 'session'] | 
|session_list | 列表 | 非必填/[] | False |  - 详见下方表格 | 
|id | 整型数字 | 必填 | False |  -  | 

cidr_list

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | IPv4的 IP 或者子网形式字符串;  | 


session_list

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 



### 编辑 acl 规则



请求

```js
{
    "cidr_list": [
        "1.2.3.5"
    ],
    "action": "forbid",
    "comment": "commmment",
    "id": 26
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 27,
        "expire_time": null,
        "create_time": 1545297384.21732,
        "status": "enabled",
        "forbid_type": "cidr",
        "domain": null,
        "urlpath": null,
        "urlpath_match_method": "str",
        "action": "forbid",
        "limit_rate_period": null,
        "limit_rate_limit": null,
        "comment": "commmment",
        "cidr_list": [
            "1.2.3.5"
        ],
        "session_list": [],
        "uuid": "e11742ca-e650-4128-bd92-fdd1c2d9a198",
        "update_time": "2018-12-20T09:16:24.217379Z"
    }
}
```

# /api/v1/acl_rule/disable

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|ids | 列表 | 必填 | False |  - 详见下方表格 | 

ids

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 



### 禁用 acl 规则



请求

```js
{
    "ids": [
        21
    ]
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "count": 1
    }
}
```

# /api/v1/acl_rule/delete

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|ids | 列表 | 必填 | False |  - 详见下方表格 | 

ids

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 



### 删除 acl 规则



请求

```js
{
    "ids": [
        20
    ]
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "count": 1
    }
}
```

# /api/v1/mario/cc_heartbeat

## POST



### mario 发送 acl 统计数据



请求

```js
{
    "timestamp": 1545297399,
    "top_ip": {
        "count": [
            10,
            100,
            1000
        ],
        "ip": [
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6"
        ],
        "time": [
            1.0,
            2.0,
            3.0
        ]
    },
    "top_ip_domain": {
        "count": [
            10,
            100,
            1000
        ],
        "ip": [
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6"
        ],
        "domain": [
            "chaitin.com",
            "chaitin.cn",
            "chaitin.org"
        ],
        "time": [
            1.0,
            2.0,
            3.0
        ]
    },
    "top_ip_domain_url": {
        "count": [
            10,
            100,
            1000
        ],
        "ip": [
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6"
        ],
        "domain": [
            "chaitin.com",
            "chaitin.cn",
            "chaitin.org"
        ],
        "url": [
            "/index.html",
            "/profile",
            "/user/items"
        ],
        "time": [
            1.0,
            2.0,
            3.0
        ]
    },
    "top_ip_session": {
        "count": [
            10,
            100,
            1000
        ],
        "ip": [
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6"
        ],
        "session": [
            "value1",
            "value2",
            "value3"
        ],
        "time": [
            1.0,
            2.0,
            3.0
        ]
    },
    "top_session": {
        "count": [
            10,
            100,
            1000
        ],
        "session": [
            "value1",
            "value2",
            "value3"
        ],
        "time": [
            1.0,
            2.0,
            3.0
        ]
    },
    "top_session_domain": {
        "count": [
            10,
            100,
            1000
        ],
        "session": [
            "value1",
            "value2",
            "value3"
        ],
        "domain": [
            "chaitin.com",
            "chaitin.cn",
            "chaitin.org"
        ],
        "time": [
            1.0,
            2.0,
            3.0
        ]
    },
    "top_session_domain_url": {
        "count": [
            10,
            100,
            1000
        ],
        "session": [
            "value1",
            "value2",
            "value3"
        ],
        "domain": [
            "chaitin.com",
            "chaitin.cn",
            "chaitin.org"
        ],
        "url": [
            "/index.html",
            "/profile",
            "/user/items"
        ],
        "time": [
            1.0,
            2.0,
            3.0
        ]
    },
    "top_ip_session_count": {
        "ip": [
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6"
        ],
        "session_count": [
            1000,
            100,
            10
        ]
    }
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

# /api/v1/acl/analyze/top_ip_session

## GET



### 获取 top ip session 数据



响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "ip": "1.2.3.4",
            "count": 1000
        },
        {
            "ip": "1.2.3.5",
            "count": 100
        },
        {
            "ip": "1.2.3.6",
            "count": 10
        }
    ]
}
```

# /api/v1/acl/analyze

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_before | 浮点数字 | 非必填/无默认值 | False |  -  | 
|time_after | 浮点数字 | 非必填/无默认值 | False |  -  | 
|group_by | 字符串 | 非必填/无默认值 | False |  -  | 
|order_by | 字符串 | 非必填/无默认值 | False |  -  | 
|ip | 字符串 | 非必填/无默认值 | False |  -  | 
|domain | 字符串 | 非必填/无默认值 | False |  -  | 
|urlpath | 字符串 | 非必填/无默认值 | False |  -  | 
|offset | 整型数字 | 非必填/0 | False |  -  | 
|count | 整型数字 | 非必填/10 | False |  -  | 



### acl 数据分析结果，group by ip



请求

```js
{
    "group_by": "ip",
    "order_by": "response_time",
    "top": 10,
    "db": true
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
                "ip": "110.158.248.217",
                "count_sum": 42120,
                "response_time_sum": 2963000.0,
                "response_time": 70.35,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "114.92.203.179",
                "count_sum": 42120,
                "response_time_sum": 2940000.0,
                "response_time": 69.8,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "225.25.253.147",
                "count_sum": 42120,
                "response_time_sum": 2936000.0,
                "response_time": 69.71,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "104.93.189.33",
                "count_sum": 42120,
                "response_time_sum": 2929000.0,
                "response_time": 69.54,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "168.40.155.84",
                "count_sum": 42120,
                "response_time_sum": 2914000.0,
                "response_time": 69.18,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "246.19.172.153",
                "count_sum": 42120,
                "response_time_sum": 2912000.0,
                "response_time": 69.14,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "53.78.243.9",
                "count_sum": 42120,
                "response_time_sum": 2909000.0,
                "response_time": 69.06,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "139.73.164.185",
                "count_sum": 42120,
                "response_time_sum": 2893000.0,
                "response_time": 68.68,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "46.129.149.28",
                "count_sum": 42120,
                "response_time_sum": 2881000.0,
                "response_time": 68.4,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "131.224.236.31",
                "count_sum": 42120,
                "response_time_sum": 2872000.0,
                "response_time": 68.19,
                "count": 1404.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip",
    "order_by": "response_time",
    "top": 10,
    "db": false
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
                "ip": "46.142.49.139",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2996000,
                "response_time": 45.52,
                "ip_comment": null
            },
            {
                "ip": "216.141.236.14",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2992000,
                "response_time": 45.46,
                "ip_comment": null
            },
            {
                "ip": "244.146.35.82",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2981000,
                "response_time": 45.29,
                "ip_comment": null
            },
            {
                "ip": "195.69.207.42",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2971000,
                "response_time": 45.14,
                "ip_comment": null
            },
            {
                "ip": "21.183.98.166",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2969000,
                "response_time": 45.11,
                "ip_comment": null
            },
            {
                "ip": "194.67.77.238",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2968000,
                "response_time": 45.09,
                "ip_comment": null
            },
            {
                "ip": "99.196.90.250",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2947000,
                "response_time": 44.77,
                "ip_comment": null
            },
            {
                "ip": "243.72.74.94",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2934000,
                "response_time": 44.58,
                "ip_comment": null
            },
            {
                "ip": "144.240.103.87",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2918000,
                "response_time": 44.33,
                "ip_comment": null
            },
            {
                "ip": "190.105.20.231",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 65820,
                "count": 2194.0,
                "response_time_sum": 2898000,
                "response_time": 44.03,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip",
    "order_by": "response_time",
    "top": 10,
    "db": true
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "items": [],
        "total": 0
    }
}
```

### 



请求

```js
{
    "group_by": "ip",
    "order_by": "response_time",
    "top": 10,
    "db": false
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "items": [],
        "total": 0
    }
}
```

### acl 数据分析结果，group by ip,domain



请求

```js
{
    "group_by": "ip,domain",
    "order_by": "response_time",
    "top": 10,
    "db": true
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
                "ip": "9.82.20.144",
                "domain": "d577b",
                "count_sum": 29,
                "response_time_sum": 61440000.0,
                "response_time": 2118620.69,
                "count": 0.97,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "91.202.163.231",
                "domain": "8fde5",
                "count_sum": 73,
                "response_time_sum": 75090000.0,
                "response_time": 1028630.14,
                "count": 2.43,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "249.82.59.142",
                "domain": "ac33c",
                "count_sum": 27,
                "response_time_sum": 27300000.0,
                "response_time": 1011111.11,
                "count": 0.9,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "34.145.153.219",
                "domain": "c4816",
                "count_sum": 86,
                "response_time_sum": 72600000.0,
                "response_time": 844186.05,
                "count": 2.87,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "41.118.104.205",
                "domain": "5555c",
                "count_sum": 48,
                "response_time_sum": 37470000.0,
                "response_time": 780625.0,
                "count": 1.6,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "12.84.138.144",
                "domain": "7029a",
                "count_sum": 99,
                "response_time_sum": 66750000.0,
                "response_time": 674242.42,
                "count": 3.3,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "204.116.42.124",
                "domain": "5a56a",
                "count_sum": 90,
                "response_time_sum": 50610000.0,
                "response_time": 562333.33,
                "count": 3.0,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "244.153.227.180",
                "domain": "e4810",
                "count_sum": 116,
                "response_time_sum": 63720000.0,
                "response_time": 549310.34,
                "count": 3.87,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "82.253.132.60",
                "domain": "cca84",
                "count_sum": 118,
                "response_time_sum": 62940000.0,
                "response_time": 533389.83,
                "count": 3.93,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "106.76.128.16",
                "domain": "99056",
                "count_sum": 171,
                "response_time_sum": 85290000.0,
                "response_time": 498771.93,
                "count": 5.7,
                "urlpath": null,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain",
    "order_by": "response_time",
    "top": 10,
    "db": false
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
                "ip": "62.163.10.67",
                "domain": "ee29b",
                "urlpath": null,
                "session": null,
                "count_sum": 30,
                "count": 1.0,
                "response_time_sum": 82380000,
                "response_time": 2746000.0,
                "ip_comment": null
            },
            {
                "ip": "152.187.102.139",
                "domain": "fa520",
                "urlpath": null,
                "session": null,
                "count_sum": 52,
                "count": 1.73,
                "response_time_sum": 58650000,
                "response_time": 1127884.62,
                "ip_comment": null
            },
            {
                "ip": "237.95.148.123",
                "domain": "79393",
                "urlpath": null,
                "session": null,
                "count_sum": 83,
                "count": 2.77,
                "response_time_sum": 86070000,
                "response_time": 1036987.95,
                "ip_comment": null
            },
            {
                "ip": "106.250.250.87",
                "domain": "22491",
                "urlpath": null,
                "session": null,
                "count_sum": 74,
                "count": 2.47,
                "response_time_sum": 62940000,
                "response_time": 850540.54,
                "ip_comment": null
            },
            {
                "ip": "103.170.97.185",
                "domain": "8a452",
                "urlpath": null,
                "session": null,
                "count_sum": 51,
                "count": 1.7,
                "response_time_sum": 29850000,
                "response_time": 585294.12,
                "ip_comment": null
            },
            {
                "ip": "36.211.255.159",
                "domain": "3d813",
                "urlpath": null,
                "session": null,
                "count_sum": 77,
                "count": 2.57,
                "response_time_sum": 41250000,
                "response_time": 535714.29,
                "ip_comment": null
            },
            {
                "ip": "251.159.76.206",
                "domain": "5fa41",
                "urlpath": null,
                "session": null,
                "count_sum": 208,
                "count": 6.93,
                "response_time_sum": 72330000,
                "response_time": 347740.38,
                "ip_comment": null
            },
            {
                "ip": "36.78.237.89",
                "domain": "89531",
                "urlpath": null,
                "session": null,
                "count_sum": 77,
                "count": 2.57,
                "response_time_sum": 23850000,
                "response_time": 309740.26,
                "ip_comment": null
            },
            {
                "ip": "145.12.138.211",
                "domain": "eb35d",
                "urlpath": null,
                "session": null,
                "count_sum": 254,
                "count": 8.47,
                "response_time_sum": 67470000,
                "response_time": 265629.92,
                "ip_comment": null
            },
            {
                "ip": "104.208.176.15",
                "domain": "4f3e3",
                "urlpath": null,
                "session": null,
                "count_sum": 139,
                "count": 4.63,
                "response_time_sum": 35730000,
                "response_time": 257050.36,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### acl 数据分析结果，group by ip,domain,urlpath



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true
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
                "ip": "201.39.104.50",
                "domain": "1c8c1",
                "urlpath": "/d1cb22",
                "count_sum": 12,
                "response_time_sum": 82560000.0,
                "response_time": 6880000.0,
                "count": 0.4,
                "ip_comment": null
            },
            {
                "ip": "123.139.148.183",
                "domain": "11009",
                "urlpath": "/bd5dec",
                "count_sum": 13,
                "response_time_sum": 67350000.0,
                "response_time": 5180769.23,
                "count": 0.43,
                "ip_comment": null
            },
            {
                "ip": "50.133.213.95",
                "domain": "303e4",
                "urlpath": "/cb114f",
                "count_sum": 14,
                "response_time_sum": 36000000.0,
                "response_time": 2571428.57,
                "count": 0.47,
                "ip_comment": null
            },
            {
                "ip": "138.253.198.91",
                "domain": "3db04",
                "urlpath": "/d27f84",
                "count_sum": 38,
                "response_time_sum": 46230000.0,
                "response_time": 1216578.95,
                "count": 1.27,
                "ip_comment": null
            },
            {
                "ip": "88.111.111.132",
                "domain": "ef420",
                "urlpath": "/6dc6a1",
                "count_sum": 55,
                "response_time_sum": 61860000.0,
                "response_time": 1124727.27,
                "count": 1.83,
                "ip_comment": null
            },
            {
                "ip": "80.88.94.205",
                "domain": "d6636",
                "urlpath": "/4206de",
                "count_sum": 50,
                "response_time_sum": 49620000.0,
                "response_time": 992400.0,
                "count": 1.67,
                "ip_comment": null
            },
            {
                "ip": "7.183.249.182",
                "domain": "6c5c1",
                "urlpath": "/f81d0c",
                "count_sum": 76,
                "response_time_sum": 46710000.0,
                "response_time": 614605.26,
                "count": 2.53,
                "ip_comment": null
            },
            {
                "ip": "164.174.66.13",
                "domain": "b9551",
                "urlpath": "/c06b13",
                "count_sum": 116,
                "response_time_sum": 51990000.0,
                "response_time": 448189.66,
                "count": 3.87,
                "ip_comment": null
            },
            {
                "ip": "222.235.224.196",
                "domain": "e0d98",
                "urlpath": "/8101cc",
                "count_sum": 154,
                "response_time_sum": 68610000.0,
                "response_time": 445519.48,
                "count": 5.13,
                "ip_comment": null
            },
            {
                "ip": "239.49.229.55",
                "domain": "6b78d",
                "urlpath": "/3d62f1",
                "count_sum": 114,
                "response_time_sum": 48180000.0,
                "response_time": 422631.58,
                "count": 3.8,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### acl 数据分析结果，group by ip,domain,urlpath



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "ip": "132.22.181.27"
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
                "ip": "132.22.181.27",
                "domain": "e6c3a",
                "urlpath": "/c2ea90",
                "count_sum": 1436,
                "response_time_sum": 77430000.0,
                "response_time": 53920.61,
                "count": 47.87,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### acl 数据分析结果，group by ip,domain,urlpath



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "domain": "e6c3a"
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
                "ip": "132.22.181.27",
                "domain": "e6c3a",
                "urlpath": "/c2ea90",
                "count_sum": 1436,
                "response_time_sum": 77430000.0,
                "response_time": 53920.61,
                "count": 47.87,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### acl 数据分析结果，group by ip,domain,urlpath



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "ip": "132.22.181.27",
    "domain": "e6c3a"
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
                "ip": "132.22.181.27",
                "domain": "e6c3a",
                "urlpath": "/c2ea90",
                "count_sum": 1436,
                "response_time_sum": 77430000.0,
                "response_time": 53920.61,
                "count": 47.87,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### acl 数据分析结果，group by ip,domain,urlpath



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "urlpath": "/c2ea90"
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
                "ip": "132.22.181.27",
                "domain": "e6c3a",
                "urlpath": "/c2ea90",
                "count_sum": 1436,
                "response_time_sum": 77430000.0,
                "response_time": 53920.61,
                "count": 47.87,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### acl 数据分析结果，group by ip,domain,urlpath



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "ip": "132.22.181.27",
    "domain": "e6c3a",
    "urlpath": "/c2ea90"
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
                "ip": "132.22.181.27",
                "domain": "e6c3a",
                "urlpath": "/c2ea90",
                "count_sum": 1436,
                "response_time_sum": 77430000.0,
                "response_time": 53920.61,
                "count": 47.87,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false
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
                "ip": "2.142.38.138",
                "domain": "a8d97",
                "urlpath": "/1fa60e",
                "session": null,
                "count_sum": 37,
                "count": 1.23,
                "response_time_sum": 57990000,
                "response_time": 1567297.3,
                "ip_comment": null
            },
            {
                "ip": "7.204.89.13",
                "domain": "20ff7",
                "urlpath": "/bc2ad6",
                "session": null,
                "count_sum": 54,
                "count": 1.8,
                "response_time_sum": 79530000,
                "response_time": 1472777.78,
                "ip_comment": null
            },
            {
                "ip": "235.74.118.120",
                "domain": "ce8c7",
                "urlpath": "/f2086c",
                "session": null,
                "count_sum": 109,
                "count": 3.63,
                "response_time_sum": 80790000,
                "response_time": 741192.66,
                "ip_comment": null
            },
            {
                "ip": "90.161.231.132",
                "domain": "b49c4",
                "urlpath": "/7f249b",
                "session": null,
                "count_sum": 82,
                "count": 2.73,
                "response_time_sum": 57090000,
                "response_time": 696219.51,
                "ip_comment": null
            },
            {
                "ip": "194.128.181.80",
                "domain": "15676",
                "urlpath": "/bb37e6",
                "session": null,
                "count_sum": 248,
                "count": 8.27,
                "response_time_sum": 76980000,
                "response_time": 310403.23,
                "ip_comment": null
            },
            {
                "ip": "125.179.73.110",
                "domain": "fde20",
                "urlpath": "/9223aa",
                "session": null,
                "count_sum": 183,
                "count": 6.1,
                "response_time_sum": 53490000,
                "response_time": 292295.08,
                "ip_comment": null
            },
            {
                "ip": "7.173.66.249",
                "domain": "d5f8d",
                "urlpath": "/78acd6",
                "session": null,
                "count_sum": 154,
                "count": 5.13,
                "response_time_sum": 40920000,
                "response_time": 265714.29,
                "ip_comment": null
            },
            {
                "ip": "53.75.224.191",
                "domain": "88a5f",
                "urlpath": "/6b789c",
                "session": null,
                "count_sum": 179,
                "count": 5.97,
                "response_time_sum": 46230000,
                "response_time": 258268.16,
                "ip_comment": null
            },
            {
                "ip": "71.200.224.51",
                "domain": "af8e1",
                "urlpath": "/cae22c",
                "session": null,
                "count_sum": 381,
                "count": 12.7,
                "response_time_sum": 83220000,
                "response_time": 218425.2,
                "ip_comment": null
            },
            {
                "ip": "58.156.107.101",
                "domain": "bb8b8",
                "urlpath": "/91a6a5",
                "session": null,
                "count_sum": 348,
                "count": 11.6,
                "response_time_sum": 73200000,
                "response_time": 210344.83,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "ip": "252.237.96.182"
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
                "ip": "252.237.96.182",
                "domain": "6cef4",
                "urlpath": "/40d31a",
                "session": null,
                "count_sum": 1438,
                "count": 47.93,
                "response_time_sum": 33240000,
                "response_time": 23115.44,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "domain": "6cef4"
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
                "ip": "252.237.96.182",
                "domain": "6cef4",
                "urlpath": "/40d31a",
                "session": null,
                "count_sum": 1438,
                "count": 47.93,
                "response_time_sum": 33240000,
                "response_time": 23115.44,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "ip": "252.237.96.182",
    "domain": "6cef4"
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
                "ip": "252.237.96.182",
                "domain": "6cef4",
                "urlpath": "/40d31a",
                "session": null,
                "count_sum": 1438,
                "count": 47.93,
                "response_time_sum": 33240000,
                "response_time": 23115.44,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "urlpath": "/40d31a"
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
                "ip": "252.237.96.182",
                "domain": "6cef4",
                "urlpath": "/40d31a",
                "session": null,
                "count_sum": 1438,
                "count": 47.93,
                "response_time_sum": 33240000,
                "response_time": 23115.44,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "ip": "252.237.96.182",
    "domain": "6cef4",
    "urlpath": "/40d31a"
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
                "ip": "252.237.96.182",
                "domain": "6cef4",
                "urlpath": "/40d31a",
                "session": null,
                "count_sum": 1438,
                "count": 47.93,
                "response_time_sum": 33240000,
                "response_time": 23115.44,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### acl 数据分析结果，group by ip,session



请求

```js
{
    "group_by": "ip,session",
    "order_by": "response_time",
    "top": 10,
    "db": true
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
                "ip": "76.249.245.179",
                "session": "8a434",
                "count_sum": 31,
                "response_time_sum": 81720000.0,
                "response_time": 2636129.03,
                "count": 1.03,
                "ip_comment": null
            },
            {
                "ip": "34.115.95.172",
                "session": "f3b91",
                "count_sum": 14,
                "response_time_sum": 26910000.0,
                "response_time": 1922142.86,
                "count": 0.47,
                "ip_comment": null
            },
            {
                "ip": "53.225.37.22",
                "session": "5ab45",
                "count_sum": 61,
                "response_time_sum": 88350000.0,
                "response_time": 1448360.66,
                "count": 2.03,
                "ip_comment": null
            },
            {
                "ip": "28.213.72.60",
                "session": "eb9bd",
                "count_sum": 45,
                "response_time_sum": 41490000.0,
                "response_time": 922000.0,
                "count": 1.5,
                "ip_comment": null
            },
            {
                "ip": "200.185.239.193",
                "session": "cde73",
                "count_sum": 29,
                "response_time_sum": 25110000.0,
                "response_time": 865862.07,
                "count": 0.97,
                "ip_comment": null
            },
            {
                "ip": "58.240.88.108",
                "session": "c7c16",
                "count_sum": 72,
                "response_time_sum": 44670000.0,
                "response_time": 620416.67,
                "count": 2.4,
                "ip_comment": null
            },
            {
                "ip": "61.14.220.92",
                "session": "67276",
                "count_sum": 147,
                "response_time_sum": 69780000.0,
                "response_time": 474693.88,
                "count": 4.9,
                "ip_comment": null
            },
            {
                "ip": "182.247.32.190",
                "session": "e3035",
                "count_sum": 196,
                "response_time_sum": 80310000.0,
                "response_time": 409744.9,
                "count": 6.53,
                "ip_comment": null
            },
            {
                "ip": "112.173.243.250",
                "session": "b6c78",
                "count_sum": 166,
                "response_time_sum": 67740000.0,
                "response_time": 408072.29,
                "count": 5.53,
                "ip_comment": null
            },
            {
                "ip": "55.46.250.78",
                "session": "23a7f",
                "count_sum": 90,
                "response_time_sum": 34260000.0,
                "response_time": 380666.67,
                "count": 3.0,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,session",
    "order_by": "response_time",
    "top": 10,
    "db": false
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
                "ip": "101.159.172.27",
                "session": "5f15c",
                "domain": null,
                "urlpath": null,
                "count_sum": 13,
                "count": 0.43,
                "response_time_sum": 35550000,
                "response_time": 2734615.38,
                "ip_comment": null
            },
            {
                "ip": "174.163.0.125",
                "session": "1e74a",
                "domain": null,
                "urlpath": null,
                "count_sum": 18,
                "count": 0.6,
                "response_time_sum": 47460000,
                "response_time": 2636666.67,
                "ip_comment": null
            },
            {
                "ip": "34.48.85.60",
                "session": "f85f8",
                "domain": null,
                "urlpath": null,
                "count_sum": 35,
                "count": 1.17,
                "response_time_sum": 68730000,
                "response_time": 1963714.29,
                "ip_comment": null
            },
            {
                "ip": "56.9.176.54",
                "session": "b20d7",
                "domain": null,
                "urlpath": null,
                "count_sum": 39,
                "count": 1.3,
                "response_time_sum": 59220000,
                "response_time": 1518461.54,
                "ip_comment": null
            },
            {
                "ip": "174.49.185.208",
                "session": "e0e37",
                "domain": null,
                "urlpath": null,
                "count_sum": 63,
                "count": 2.1,
                "response_time_sum": 80460000,
                "response_time": 1277142.86,
                "ip_comment": null
            },
            {
                "ip": "72.249.85.96",
                "session": "14506",
                "domain": null,
                "urlpath": null,
                "count_sum": 111,
                "count": 3.7,
                "response_time_sum": 82650000,
                "response_time": 744594.59,
                "ip_comment": null
            },
            {
                "ip": "60.82.247.240",
                "session": "854f7",
                "domain": null,
                "urlpath": null,
                "count_sum": 123,
                "count": 4.1,
                "response_time_sum": 73560000,
                "response_time": 598048.78,
                "ip_comment": null
            },
            {
                "ip": "39.206.54.108",
                "session": "efa17",
                "domain": null,
                "urlpath": null,
                "count_sum": 105,
                "count": 3.5,
                "response_time_sum": 60090000,
                "response_time": 572285.71,
                "ip_comment": null
            },
            {
                "ip": "40.31.129.181",
                "session": "606cf",
                "domain": null,
                "urlpath": null,
                "count_sum": 88,
                "count": 2.93,
                "response_time_sum": 48600000,
                "response_time": 552272.73,
                "ip_comment": null
            },
            {
                "ip": "125.40.74.243",
                "session": "5346d",
                "domain": null,
                "urlpath": null,
                "count_sum": 98,
                "count": 3.27,
                "response_time_sum": 49290000,
                "response_time": 502959.18,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### acl 数据分析结果，group by session



请求

```js
{
    "group_by": "session",
    "order_by": "response_time",
    "top": 10,
    "db": true
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
                "session": "f573f",
                "count_sum": 480,
                "response_time_sum": 1923000.0,
                "response_time": 4006.25,
                "count": 16.0
            },
            {
                "session": "12196",
                "count_sum": 1320,
                "response_time_sum": 2898000.0,
                "response_time": 2195.45,
                "count": 44.0
            },
            {
                "session": "eccba",
                "count_sum": 1350,
                "response_time_sum": 2603000.0,
                "response_time": 1928.15,
                "count": 45.0
            },
            {
                "session": "af8a9",
                "count_sum": 1260,
                "response_time_sum": 2188000.0,
                "response_time": 1736.51,
                "count": 42.0
            },
            {
                "session": "fe424",
                "count_sum": 810,
                "response_time_sum": 1285000.0,
                "response_time": 1586.42,
                "count": 27.0
            },
            {
                "session": "c5bdb",
                "count_sum": 1770,
                "response_time_sum": 2370000.0,
                "response_time": 1338.98,
                "count": 59.0
            },
            {
                "session": "541fb",
                "count_sum": 930,
                "response_time_sum": 840000.0,
                "response_time": 903.23,
                "count": 31.0
            },
            {
                "session": "1aee3",
                "count_sum": 600,
                "response_time_sum": 517000.0,
                "response_time": 861.67,
                "count": 20.0
            },
            {
                "session": "51d57",
                "count_sum": 1920,
                "response_time_sum": 1531000.0,
                "response_time": 797.4,
                "count": 64.0
            },
            {
                "session": "44244",
                "count_sum": 2610,
                "response_time_sum": 1899000.0,
                "response_time": 727.59,
                "count": 87.0
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session",
    "order_by": "response_time",
    "top": 10,
    "db": false
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
                "session": "8a5b7",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 330,
                "count": 11.0,
                "response_time_sum": 1710000,
                "response_time": 5181.82
            },
            {
                "session": "90c80",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 450,
                "count": 15.0,
                "response_time_sum": 1086000,
                "response_time": 2413.33
            },
            {
                "session": "6f362",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 1350,
                "count": 45.0,
                "response_time_sum": 2904000,
                "response_time": 2151.11
            },
            {
                "session": "73043",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 1020,
                "count": 34.0,
                "response_time_sum": 1847000,
                "response_time": 1810.78
            },
            {
                "session": "e32df",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 1620,
                "count": 54.0,
                "response_time_sum": 2320000,
                "response_time": 1432.1
            },
            {
                "session": "8fc55",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 2430,
                "count": 81.0,
                "response_time_sum": 2737000,
                "response_time": 1126.34
            },
            {
                "session": "1b555",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 1410,
                "count": 47.0,
                "response_time_sum": 1288000,
                "response_time": 913.48
            },
            {
                "session": "e2483",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 1110,
                "count": 37.0,
                "response_time_sum": 975000,
                "response_time": 878.38
            },
            {
                "session": "e9868",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 2790,
                "count": 93.0,
                "response_time_sum": 2072000,
                "response_time": 742.65
            },
            {
                "session": "db36b",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 3600,
                "count": 120.0,
                "response_time_sum": 2611000,
                "response_time": 725.28
            }
        ],
        "total": 300
    }
}
```

### acl 数据分析结果，group by session,domain



请求

```js
{
    "group_by": "session,domain",
    "order_by": "response_time",
    "top": 10,
    "db": true
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
                "session": "a7fb0",
                "domain": "31e3d",
                "count_sum": 1500,
                "response_time_sum": 2626000.0,
                "response_time": 1750.67,
                "count": 50.0
            },
            {
                "session": "89d79",
                "domain": "5e1cc",
                "count_sum": 1770,
                "response_time_sum": 2511000.0,
                "response_time": 1418.64,
                "count": 59.0
            },
            {
                "session": "f3bb8",
                "domain": "56f3a",
                "count_sum": 1650,
                "response_time_sum": 1929000.0,
                "response_time": 1169.09,
                "count": 55.0
            },
            {
                "session": "8a549",
                "domain": "ce681",
                "count_sum": 3210,
                "response_time_sum": 2807000.0,
                "response_time": 874.45,
                "count": 107.0
            },
            {
                "session": "b5c58",
                "domain": "3feb6",
                "count_sum": 3360,
                "response_time_sum": 2414000.0,
                "response_time": 718.45,
                "count": 112.0
            },
            {
                "session": "71930",
                "domain": "ad5e2",
                "count_sum": 2340,
                "response_time_sum": 1645000.0,
                "response_time": 702.99,
                "count": 78.0
            },
            {
                "session": "2e073",
                "domain": "d80b2",
                "count_sum": 2100,
                "response_time_sum": 1269000.0,
                "response_time": 604.29,
                "count": 70.0
            },
            {
                "session": "ad150",
                "domain": "18349",
                "count_sum": 4020,
                "response_time_sum": 2345000.0,
                "response_time": 583.33,
                "count": 134.0
            },
            {
                "session": "9c305",
                "domain": "3bac4",
                "count_sum": 4620,
                "response_time_sum": 2627000.0,
                "response_time": 568.61,
                "count": 154.0
            },
            {
                "session": "939df",
                "domain": "ffa0f",
                "count_sum": 5520,
                "response_time_sum": 2598000.0,
                "response_time": 470.65,
                "count": 184.0
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain",
    "order_by": "response_time",
    "top": 10,
    "db": false
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
                "session": "a7253",
                "domain": "7b14f",
                "ip": null,
                "urlpath": null,
                "count_sum": 510,
                "count": 17.0,
                "response_time_sum": 1981000,
                "response_time": 3884.31
            },
            {
                "session": "74a19",
                "domain": "8401a",
                "ip": null,
                "urlpath": null,
                "count_sum": 390,
                "count": 13.0,
                "response_time_sum": 1290000,
                "response_time": 3307.69
            },
            {
                "session": "3b02a",
                "domain": "70133",
                "ip": null,
                "urlpath": null,
                "count_sum": 1140,
                "count": 38.0,
                "response_time_sum": 2450000,
                "response_time": 2149.12
            },
            {
                "session": "3303f",
                "domain": "59838",
                "ip": null,
                "urlpath": null,
                "count_sum": 1950,
                "count": 65.0,
                "response_time_sum": 2770000,
                "response_time": 1420.51
            },
            {
                "session": "f84f0",
                "domain": "c1f57",
                "ip": null,
                "urlpath": null,
                "count_sum": 3390,
                "count": 113.0,
                "response_time_sum": 1876000,
                "response_time": 553.39
            },
            {
                "session": "a5dd1",
                "domain": "70e70",
                "ip": null,
                "urlpath": null,
                "count_sum": 5670,
                "count": 189.0,
                "response_time_sum": 2742000,
                "response_time": 483.6
            },
            {
                "session": "555f2",
                "domain": "fa6bf",
                "ip": null,
                "urlpath": null,
                "count_sum": 5910,
                "count": 197.0,
                "response_time_sum": 2828000,
                "response_time": 478.51
            },
            {
                "session": "6a997",
                "domain": "939a7",
                "ip": null,
                "urlpath": null,
                "count_sum": 5940,
                "count": 198.0,
                "response_time_sum": 2795000,
                "response_time": 470.54
            },
            {
                "session": "ca1a7",
                "domain": "8e57c",
                "ip": null,
                "urlpath": null,
                "count_sum": 3390,
                "count": 113.0,
                "response_time_sum": 1570000,
                "response_time": 463.13
            },
            {
                "session": "3a133",
                "domain": "4746f",
                "ip": null,
                "urlpath": null,
                "count_sum": 6810,
                "count": 227.0,
                "response_time_sum": 2918000,
                "response_time": 428.49
            }
        ],
        "total": 299
    }
}
```

### acl 数据分析结果，group by session,domain,urlpath



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true
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
                "session": "8effe",
                "domain": "6a183",
                "urlpath": "/eaf185",
                "count_sum": 810,
                "response_time_sum": 2214000.0,
                "response_time": 2733.33,
                "count": 27.0
            },
            {
                "session": "52390",
                "domain": "ec998",
                "urlpath": "/a69d34",
                "count_sum": 1080,
                "response_time_sum": 2191000.0,
                "response_time": 2028.7,
                "count": 36.0
            },
            {
                "session": "4c722",
                "domain": "779d5",
                "urlpath": "/7f32ca",
                "count_sum": 1320,
                "response_time_sum": 2608000.0,
                "response_time": 1975.76,
                "count": 44.0
            },
            {
                "session": "f1a9b",
                "domain": "36f4f",
                "urlpath": "/262825",
                "count_sum": 1350,
                "response_time_sum": 2443000.0,
                "response_time": 1809.63,
                "count": 45.0
            },
            {
                "session": "83903",
                "domain": "e3605",
                "urlpath": "/bbf7dc",
                "count_sum": 750,
                "response_time_sum": 717000.0,
                "response_time": 956.0,
                "count": 25.0
            },
            {
                "session": "8bd51",
                "domain": "c2a25",
                "urlpath": "/3f570f",
                "count_sum": 1020,
                "response_time_sum": 883000.0,
                "response_time": 865.69,
                "count": 34.0
            },
            {
                "session": "d307b",
                "domain": "37979",
                "urlpath": "/e7e7ca",
                "count_sum": 1440,
                "response_time_sum": 1155000.0,
                "response_time": 802.08,
                "count": 48.0
            },
            {
                "session": "170b4",
                "domain": "837f6",
                "urlpath": "/10e144",
                "count_sum": 3660,
                "response_time_sum": 2609000.0,
                "response_time": 712.84,
                "count": 122.0
            },
            {
                "session": "4ad28",
                "domain": "93929",
                "urlpath": "/6ee380",
                "count_sum": 1470,
                "response_time_sum": 811000.0,
                "response_time": 551.7,
                "count": 49.0
            },
            {
                "session": "fb7b5",
                "domain": "b36d6",
                "urlpath": "/88d910",
                "count_sum": 1860,
                "response_time_sum": 950000.0,
                "response_time": 510.75,
                "count": 62.0
            }
        ],
        "total": 300
    }
}
```

### acl 数据分析结果，group by session,domain,urlpath



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "domain": "89276"
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
                "session": "cc94f",
                "domain": "89276",
                "urlpath": "/2c8ab4",
                "count_sum": 50610,
                "response_time_sum": 730000.0,
                "response_time": 14.42,
                "count": 1687.0
            }
        ],
        "total": 1
    }
}
```

### acl 数据分析结果，group by session,domain,urlpath



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "urlpath": "/2c8ab4"
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
                "session": "cc94f",
                "domain": "89276",
                "urlpath": "/2c8ab4",
                "count_sum": 50610,
                "response_time_sum": 730000.0,
                "response_time": 14.42,
                "count": 1687.0
            }
        ],
        "total": 1
    }
}
```

### acl 数据分析结果，group by session,domain,urlpath



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": true,
    "domain": "89276",
    "urlpath": "/2c8ab4"
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
                "session": "cc94f",
                "domain": "89276",
                "urlpath": "/2c8ab4",
                "count_sum": 50610,
                "response_time_sum": 730000.0,
                "response_time": 14.42,
                "count": 1687.0
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false
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
                "session": "de76d",
                "domain": "f58fe",
                "urlpath": "/8f1818",
                "ip": null,
                "count_sum": 870,
                "count": 29.0,
                "response_time_sum": 1782000,
                "response_time": 2048.28
            },
            {
                "session": "dd5f1",
                "domain": "a4040",
                "urlpath": "/29c793",
                "ip": null,
                "count_sum": 1470,
                "count": 49.0,
                "response_time_sum": 2490000,
                "response_time": 1693.88
            },
            {
                "session": "3950c",
                "domain": "13b4f",
                "urlpath": "/d97140",
                "ip": null,
                "count_sum": 600,
                "count": 20.0,
                "response_time_sum": 772000,
                "response_time": 1286.67
            },
            {
                "session": "41225",
                "domain": "aa49f",
                "urlpath": "/222b46",
                "ip": null,
                "count_sum": 1680,
                "count": 56.0,
                "response_time_sum": 1863000,
                "response_time": 1108.93
            },
            {
                "session": "9e6cb",
                "domain": "d4f90",
                "urlpath": "/9786d1",
                "ip": null,
                "count_sum": 1980,
                "count": 66.0,
                "response_time_sum": 2194000,
                "response_time": 1108.08
            },
            {
                "session": "3ed74",
                "domain": "6a0a2",
                "urlpath": "/b0bb85",
                "ip": null,
                "count_sum": 2580,
                "count": 86.0,
                "response_time_sum": 2177000,
                "response_time": 843.8
            },
            {
                "session": "a90cc",
                "domain": "1e6cc",
                "urlpath": "/1805e0",
                "ip": null,
                "count_sum": 3180,
                "count": 106.0,
                "response_time_sum": 2177000,
                "response_time": 684.59
            },
            {
                "session": "2b910",
                "domain": "d22da",
                "urlpath": "/830221",
                "ip": null,
                "count_sum": 2100,
                "count": 70.0,
                "response_time_sum": 1411000,
                "response_time": 671.9
            },
            {
                "session": "506de",
                "domain": "c754e",
                "urlpath": "/84edf1",
                "ip": null,
                "count_sum": 1710,
                "count": 57.0,
                "response_time_sum": 1098000,
                "response_time": 642.11
            },
            {
                "session": "a5bf8",
                "domain": "61be3",
                "urlpath": "/6b9410",
                "ip": null,
                "count_sum": 4860,
                "count": 162.0,
                "response_time_sum": 2819000,
                "response_time": 580.04
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "domain": "7ad49"
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
                "session": "e15b7",
                "domain": "7ad49",
                "urlpath": "/c5eaa3",
                "ip": null,
                "count_sum": 63750,
                "count": 2125.0,
                "response_time_sum": 1873000,
                "response_time": 29.38
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "urlpath": "/c5eaa3"
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
                "session": "e15b7",
                "domain": "7ad49",
                "urlpath": "/c5eaa3",
                "ip": null,
                "count_sum": 63750,
                "count": 2125.0,
                "response_time_sum": 1873000,
                "response_time": 29.38
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "response_time",
    "top": 10,
    "db": false,
    "domain": "7ad49",
    "urlpath": "/c5eaa3"
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
                "session": "e15b7",
                "domain": "7ad49",
                "urlpath": "/c5eaa3",
                "ip": null,
                "count_sum": 63750,
                "count": 2125.0,
                "response_time_sum": 1873000,
                "response_time": 29.38
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip",
    "order_by": "count",
    "top": 10,
    "db": true
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "items": [],
        "total": 0
    }
}
```

### 



请求

```js
{
    "group_by": "ip",
    "order_by": "count",
    "top": 10,
    "db": true
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
                "ip": "94.29.143.132",
                "count_sum": 1740,
                "response_time_sum": 106000.0,
                "response_time": 60.92,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "221.125.52.245",
                "count_sum": 1740,
                "response_time_sum": 2753000.0,
                "response_time": 1582.18,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "194.197.4.66",
                "count_sum": 1740,
                "response_time_sum": 1106000.0,
                "response_time": 635.63,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "59.97.47.112",
                "count_sum": 1740,
                "response_time_sum": 2128000.0,
                "response_time": 1222.99,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "59.205.176.133",
                "count_sum": 1740,
                "response_time_sum": 890000.0,
                "response_time": 511.49,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "52.142.62.127",
                "count_sum": 1740,
                "response_time_sum": 1048000.0,
                "response_time": 602.3,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "211.141.58.51",
                "count_sum": 1740,
                "response_time_sum": 374000.0,
                "response_time": 214.94,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "28.228.102.16",
                "count_sum": 1740,
                "response_time_sum": 371000.0,
                "response_time": 213.22,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "185.87.192.108",
                "count_sum": 1740,
                "response_time_sum": 1629000.0,
                "response_time": 936.21,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "15.97.13.77",
                "count_sum": 1740,
                "response_time_sum": 2988000.0,
                "response_time": 1717.24,
                "count": 58.0,
                "domain": null,
                "urlpath": null,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain",
    "order_by": "count",
    "top": 10,
    "db": true
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
                "ip": "11.132.187.251",
                "domain": "8aa2a",
                "count_sum": 2992,
                "response_time_sum": 70020000.0,
                "response_time": 23402.41,
                "count": 99.73,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "114.208.83.105",
                "domain": "56a75",
                "count_sum": 2964,
                "response_time_sum": 38700000.0,
                "response_time": 13056.68,
                "count": 98.8,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "187.111.9.150",
                "domain": "6bca5",
                "count_sum": 2944,
                "response_time_sum": 10800000.0,
                "response_time": 3668.48,
                "count": 98.13,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "144.3.99.188",
                "domain": "18a37",
                "count_sum": 2941,
                "response_time_sum": 89610000.0,
                "response_time": 30469.23,
                "count": 98.03,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "202.38.29.73",
                "domain": "8317b",
                "count_sum": 2933,
                "response_time_sum": 3090000.0,
                "response_time": 1053.53,
                "count": 97.77,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "80.104.197.159",
                "domain": "2b908",
                "count_sum": 2930,
                "response_time_sum": 78600000.0,
                "response_time": 26825.94,
                "count": 97.67,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "239.254.151.81",
                "domain": "b976d",
                "count_sum": 2926,
                "response_time_sum": 62490000.0,
                "response_time": 21356.8,
                "count": 97.53,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "139.16.183.247",
                "domain": "38157",
                "count_sum": 2896,
                "response_time_sum": 13230000.0,
                "response_time": 4568.37,
                "count": 96.53,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "156.159.60.171",
                "domain": "acfdd",
                "count_sum": 2879,
                "response_time_sum": 3930000.0,
                "response_time": 1365.06,
                "count": 95.97,
                "urlpath": null,
                "ip_comment": null
            },
            {
                "ip": "86.222.184.82",
                "domain": "84f64",
                "count_sum": 2871,
                "response_time_sum": 16650000.0,
                "response_time": 5799.37,
                "count": 95.7,
                "urlpath": null,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true
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
                "ip": "173.25.178.145",
                "domain": "ddf90",
                "urlpath": "/2aa0de",
                "count_sum": 2993,
                "response_time_sum": 87600000.0,
                "response_time": 29268.29,
                "count": 99.77,
                "ip_comment": null
            },
            {
                "ip": "45.31.67.118",
                "domain": "5cae3",
                "urlpath": "/764a8c",
                "count_sum": 2987,
                "response_time_sum": 61230000.0,
                "response_time": 20498.83,
                "count": 99.57,
                "ip_comment": null
            },
            {
                "ip": "194.121.202.12",
                "domain": "d8852",
                "urlpath": "/ed69a8",
                "count_sum": 2987,
                "response_time_sum": 19200000.0,
                "response_time": 6427.85,
                "count": 99.57,
                "ip_comment": null
            },
            {
                "ip": "164.11.7.240",
                "domain": "62fac",
                "urlpath": "/8ab8b7",
                "count_sum": 2982,
                "response_time_sum": 20190000.0,
                "response_time": 6770.62,
                "count": 99.4,
                "ip_comment": null
            },
            {
                "ip": "167.88.47.85",
                "domain": "be9cf",
                "urlpath": "/65d8fa",
                "count_sum": 2980,
                "response_time_sum": 3510000.0,
                "response_time": 1177.85,
                "count": 99.33,
                "ip_comment": null
            },
            {
                "ip": "63.87.89.130",
                "domain": "2b3ce",
                "urlpath": "/3b4f2e",
                "count_sum": 2972,
                "response_time_sum": 89460000.0,
                "response_time": 30100.94,
                "count": 99.07,
                "ip_comment": null
            },
            {
                "ip": "25.44.126.235",
                "domain": "eef87",
                "urlpath": "/1ac34e",
                "count_sum": 2969,
                "response_time_sum": 48600000.0,
                "response_time": 16369.15,
                "count": 98.97,
                "ip_comment": null
            },
            {
                "ip": "51.148.241.33",
                "domain": "2192e",
                "urlpath": "/f796cb",
                "count_sum": 2963,
                "response_time_sum": 47460000.0,
                "response_time": 16017.55,
                "count": 98.77,
                "ip_comment": null
            },
            {
                "ip": "216.250.73.155",
                "domain": "382d0",
                "urlpath": "/ab4264",
                "count_sum": 2961,
                "response_time_sum": 1410000.0,
                "response_time": 476.19,
                "count": 98.7,
                "ip_comment": null
            },
            {
                "ip": "75.239.174.80",
                "domain": "c4555",
                "urlpath": "/5a3569",
                "count_sum": 2958,
                "response_time_sum": 76260000.0,
                "response_time": 25780.93,
                "count": 98.6,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "ip": "139.197.53.71"
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
                "ip": "139.197.53.71",
                "domain": "4380c",
                "urlpath": "/de0fe6",
                "count_sum": 2890,
                "response_time_sum": 5190000.0,
                "response_time": 1795.85,
                "count": 96.33,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "domain": "4380c"
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
                "ip": "139.197.53.71",
                "domain": "4380c",
                "urlpath": "/de0fe6",
                "count_sum": 2890,
                "response_time_sum": 5190000.0,
                "response_time": 1795.85,
                "count": 96.33,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "ip": "139.197.53.71",
    "domain": "4380c"
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
                "ip": "139.197.53.71",
                "domain": "4380c",
                "urlpath": "/de0fe6",
                "count_sum": 2890,
                "response_time_sum": 5190000.0,
                "response_time": 1795.85,
                "count": 96.33,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "urlpath": "/de0fe6"
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
                "ip": "139.197.53.71",
                "domain": "4380c",
                "urlpath": "/de0fe6",
                "count_sum": 2890,
                "response_time_sum": 5190000.0,
                "response_time": 1795.85,
                "count": 96.33,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "ip": "139.197.53.71",
    "domain": "4380c",
    "urlpath": "/de0fe6"
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
                "ip": "139.197.53.71",
                "domain": "4380c",
                "urlpath": "/de0fe6",
                "count_sum": 2890,
                "response_time_sum": 5190000.0,
                "response_time": 1795.85,
                "count": 96.33,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,session",
    "order_by": "count",
    "top": 10,
    "db": true
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
                "ip": "183.74.153.63",
                "session": "4d123",
                "count_sum": 2960,
                "response_time_sum": 51810000.0,
                "response_time": 17503.38,
                "count": 98.67,
                "ip_comment": null
            },
            {
                "ip": "13.54.130.160",
                "session": "7949c",
                "count_sum": 2948,
                "response_time_sum": 33180000.0,
                "response_time": 11255.09,
                "count": 98.27,
                "ip_comment": null
            },
            {
                "ip": "164.251.177.107",
                "session": "b7d51",
                "count_sum": 2945,
                "response_time_sum": 30630000.0,
                "response_time": 10400.68,
                "count": 98.17,
                "ip_comment": null
            },
            {
                "ip": "123.66.254.53",
                "session": "8375d",
                "count_sum": 2935,
                "response_time_sum": 17070000.0,
                "response_time": 5816.01,
                "count": 97.83,
                "ip_comment": null
            },
            {
                "ip": "252.244.73.116",
                "session": "969e1",
                "count_sum": 2920,
                "response_time_sum": 54210000.0,
                "response_time": 18565.07,
                "count": 97.33,
                "ip_comment": null
            },
            {
                "ip": "221.189.186.166",
                "session": "398a4",
                "count_sum": 2904,
                "response_time_sum": 73710000.0,
                "response_time": 25382.23,
                "count": 96.8,
                "ip_comment": null
            },
            {
                "ip": "162.252.122.208",
                "session": "5ec86",
                "count_sum": 2894,
                "response_time_sum": 23340000.0,
                "response_time": 8064.96,
                "count": 96.47,
                "ip_comment": null
            },
            {
                "ip": "54.10.26.19",
                "session": "5d995",
                "count_sum": 2893,
                "response_time_sum": 51960000.0,
                "response_time": 17960.59,
                "count": 96.43,
                "ip_comment": null
            },
            {
                "ip": "58.194.202.246",
                "session": "9ff33",
                "count_sum": 2892,
                "response_time_sum": 73710000.0,
                "response_time": 25487.55,
                "count": 96.4,
                "ip_comment": null
            },
            {
                "ip": "238.212.140.73",
                "session": "a165d",
                "count_sum": 2886,
                "response_time_sum": 44430000.0,
                "response_time": 15395.01,
                "count": 96.2,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session",
    "order_by": "count",
    "top": 10,
    "db": true
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
                "session": "64898",
                "count_sum": 89880,
                "response_time_sum": 1857000.0,
                "response_time": 20.66,
                "count": 2996.0
            },
            {
                "session": "5c127",
                "count_sum": 89220,
                "response_time_sum": 1026000.0,
                "response_time": 11.5,
                "count": 2974.0
            },
            {
                "session": "be0b1",
                "count_sum": 88950,
                "response_time_sum": 892000.0,
                "response_time": 10.03,
                "count": 2965.0
            },
            {
                "session": "25c37",
                "count_sum": 88710,
                "response_time_sum": 81000.0,
                "response_time": 0.91,
                "count": 2957.0
            },
            {
                "session": "23503",
                "count_sum": 88380,
                "response_time_sum": 221000.0,
                "response_time": 2.5,
                "count": 2946.0
            },
            {
                "session": "a8d8c",
                "count_sum": 87360,
                "response_time_sum": 141000.0,
                "response_time": 1.61,
                "count": 2912.0
            },
            {
                "session": "b629a",
                "count_sum": 87150,
                "response_time_sum": 2656000.0,
                "response_time": 30.48,
                "count": 2905.0
            },
            {
                "session": "8168c",
                "count_sum": 87120,
                "response_time_sum": 2284000.0,
                "response_time": 26.22,
                "count": 2904.0
            },
            {
                "session": "db5ef",
                "count_sum": 86310,
                "response_time_sum": 1466000.0,
                "response_time": 16.99,
                "count": 2877.0
            },
            {
                "session": "edf91",
                "count_sum": 85560,
                "response_time_sum": 457000.0,
                "response_time": 5.34,
                "count": 2852.0
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain",
    "order_by": "count",
    "top": 10,
    "db": true
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
                "session": "d8df5",
                "domain": "69650",
                "count_sum": 89670,
                "response_time_sum": 1407000.0,
                "response_time": 15.69,
                "count": 2989.0
            },
            {
                "session": "b0cb2",
                "domain": "bc4a8",
                "count_sum": 88710,
                "response_time_sum": 1174000.0,
                "response_time": 13.23,
                "count": 2957.0
            },
            {
                "session": "b9ee7",
                "domain": "f4189",
                "count_sum": 88410,
                "response_time_sum": 588000.0,
                "response_time": 6.65,
                "count": 2947.0
            },
            {
                "session": "188ee",
                "domain": "573e0",
                "count_sum": 88290,
                "response_time_sum": 1965000.0,
                "response_time": 22.26,
                "count": 2943.0
            },
            {
                "session": "cd322",
                "domain": "3288e",
                "count_sum": 88170,
                "response_time_sum": 546000.0,
                "response_time": 6.19,
                "count": 2939.0
            },
            {
                "session": "21d03",
                "domain": "4b6b9",
                "count_sum": 87780,
                "response_time_sum": 742000.0,
                "response_time": 8.45,
                "count": 2926.0
            },
            {
                "session": "d90d2",
                "domain": "f1836",
                "count_sum": 87660,
                "response_time_sum": 1000000.0,
                "response_time": 11.41,
                "count": 2922.0
            },
            {
                "session": "931f1",
                "domain": "d4cc7",
                "count_sum": 87480,
                "response_time_sum": 2564000.0,
                "response_time": 29.31,
                "count": 2916.0
            },
            {
                "session": "aeaa2",
                "domain": "395c2",
                "count_sum": 87210,
                "response_time_sum": 2781000.0,
                "response_time": 31.89,
                "count": 2907.0
            },
            {
                "session": "643ab",
                "domain": "fec09",
                "count_sum": 87060,
                "response_time_sum": 2059000.0,
                "response_time": 23.65,
                "count": 2902.0
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true
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
                "session": "d7acf",
                "domain": "597bb",
                "urlpath": "/1640cc",
                "count_sum": 89760,
                "response_time_sum": 2116000.0,
                "response_time": 23.57,
                "count": 2992.0
            },
            {
                "session": "adce3",
                "domain": "242b5",
                "urlpath": "/a5f82e",
                "count_sum": 89550,
                "response_time_sum": 120000.0,
                "response_time": 1.34,
                "count": 2985.0
            },
            {
                "session": "f6b8a",
                "domain": "9f597",
                "urlpath": "/33249f",
                "count_sum": 89190,
                "response_time_sum": 2290000.0,
                "response_time": 25.68,
                "count": 2973.0
            },
            {
                "session": "9d3dc",
                "domain": "7f088",
                "urlpath": "/a982f5",
                "count_sum": 88950,
                "response_time_sum": 1605000.0,
                "response_time": 18.04,
                "count": 2965.0
            },
            {
                "session": "822d2",
                "domain": "119bf",
                "urlpath": "/237d9e",
                "count_sum": 88770,
                "response_time_sum": 1930000.0,
                "response_time": 21.74,
                "count": 2959.0
            },
            {
                "session": "c6c36",
                "domain": "83ca0",
                "urlpath": "/6de954",
                "count_sum": 88710,
                "response_time_sum": 1009000.0,
                "response_time": 11.37,
                "count": 2957.0
            },
            {
                "session": "2d5c9",
                "domain": "2e873",
                "urlpath": "/e5acf4",
                "count_sum": 88620,
                "response_time_sum": 1332000.0,
                "response_time": 15.03,
                "count": 2954.0
            },
            {
                "session": "3c861",
                "domain": "5ed6d",
                "urlpath": "/35657f",
                "count_sum": 88200,
                "response_time_sum": 738000.0,
                "response_time": 8.37,
                "count": 2940.0
            },
            {
                "session": "f8401",
                "domain": "16e20",
                "urlpath": "/816a8a",
                "count_sum": 86790,
                "response_time_sum": 295000.0,
                "response_time": 3.4,
                "count": 2893.0
            },
            {
                "session": "f2e67",
                "domain": "1f0a4",
                "urlpath": "/73a72c",
                "count_sum": 86760,
                "response_time_sum": 47000.0,
                "response_time": 0.54,
                "count": 2892.0
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "domain": "8a402"
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
                "session": "fdde8",
                "domain": "8a402",
                "urlpath": "/1a0585",
                "count_sum": 71760,
                "response_time_sum": 49000.0,
                "response_time": 0.68,
                "count": 2392.0
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "urlpath": "/1a0585"
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
                "session": "fdde8",
                "domain": "8a402",
                "urlpath": "/1a0585",
                "count_sum": 71760,
                "response_time_sum": 49000.0,
                "response_time": 0.68,
                "count": 2392.0
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": true,
    "domain": "8a402",
    "urlpath": "/1a0585"
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
                "session": "fdde8",
                "domain": "8a402",
                "urlpath": "/1a0585",
                "count_sum": 71760,
                "response_time_sum": 49000.0,
                "response_time": 0.68,
                "count": 2392.0
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip",
    "order_by": "count",
    "top": 10,
    "db": false
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "items": [],
        "total": 0
    }
}
```

### 



请求

```js
{
    "group_by": "ip",
    "order_by": "count",
    "top": 10,
    "db": false
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
                "ip": "214.108.88.172",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 606000,
                "response_time": 18.1,
                "ip_comment": null
            },
            {
                "ip": "242.238.132.72",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 2669000,
                "response_time": 79.72,
                "ip_comment": null
            },
            {
                "ip": "213.117.63.47",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 2091000,
                "response_time": 62.46,
                "ip_comment": null
            },
            {
                "ip": "4.202.197.144",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 1838000,
                "response_time": 54.9,
                "ip_comment": null
            },
            {
                "ip": "219.85.170.248",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 2825000,
                "response_time": 84.38,
                "ip_comment": null
            },
            {
                "ip": "244.142.147.171",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 1003000,
                "response_time": 29.96,
                "ip_comment": null
            },
            {
                "ip": "226.39.139.148",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 372000,
                "response_time": 11.11,
                "ip_comment": null
            },
            {
                "ip": "192.168.119.23",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 1119000,
                "response_time": 33.42,
                "ip_comment": null
            },
            {
                "ip": "164.145.99.150",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 2432000,
                "response_time": 72.64,
                "ip_comment": null
            },
            {
                "ip": "156.196.41.132",
                "domain": null,
                "urlpath": null,
                "session": null,
                "count_sum": 33480,
                "count": 1116.0,
                "response_time_sum": 1831000,
                "response_time": 54.69,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain",
    "order_by": "count",
    "top": 10,
    "db": false
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
                "ip": "57.23.20.187",
                "domain": "28ea6",
                "urlpath": null,
                "session": null,
                "count_sum": 2975,
                "count": 99.17,
                "response_time_sum": 1530000,
                "response_time": 514.29,
                "ip_comment": null
            },
            {
                "ip": "204.244.188.163",
                "domain": "e812f",
                "urlpath": null,
                "session": null,
                "count_sum": 2972,
                "count": 99.07,
                "response_time_sum": 600000,
                "response_time": 201.88,
                "ip_comment": null
            },
            {
                "ip": "153.102.163.232",
                "domain": "a6e2c",
                "urlpath": null,
                "session": null,
                "count_sum": 2946,
                "count": 98.2,
                "response_time_sum": 32100000,
                "response_time": 10896.13,
                "ip_comment": null
            },
            {
                "ip": "204.124.159.227",
                "domain": "4462f",
                "urlpath": null,
                "session": null,
                "count_sum": 2926,
                "count": 97.53,
                "response_time_sum": 54540000,
                "response_time": 18639.78,
                "ip_comment": null
            },
            {
                "ip": "208.108.161.239",
                "domain": "50818",
                "urlpath": null,
                "session": null,
                "count_sum": 2920,
                "count": 97.33,
                "response_time_sum": 20340000,
                "response_time": 6965.75,
                "ip_comment": null
            },
            {
                "ip": "199.125.132.236",
                "domain": "94ed5",
                "urlpath": null,
                "session": null,
                "count_sum": 2912,
                "count": 97.07,
                "response_time_sum": 10890000,
                "response_time": 3739.7,
                "ip_comment": null
            },
            {
                "ip": "105.134.84.197",
                "domain": "8cbda",
                "urlpath": null,
                "session": null,
                "count_sum": 2853,
                "count": 95.1,
                "response_time_sum": 22500000,
                "response_time": 7886.44,
                "ip_comment": null
            },
            {
                "ip": "149.85.60.64",
                "domain": "d3f96",
                "urlpath": null,
                "session": null,
                "count_sum": 2830,
                "count": 94.33,
                "response_time_sum": 9780000,
                "response_time": 3455.83,
                "ip_comment": null
            },
            {
                "ip": "27.220.52.221",
                "domain": "ed0b0",
                "urlpath": null,
                "session": null,
                "count_sum": 2826,
                "count": 94.2,
                "response_time_sum": 57750000,
                "response_time": 20435.24,
                "ip_comment": null
            },
            {
                "ip": "109.246.145.45",
                "domain": "beea7",
                "urlpath": null,
                "session": null,
                "count_sum": 2812,
                "count": 93.73,
                "response_time_sum": 63930000,
                "response_time": 22734.71,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false
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
                "ip": "19.62.190.118",
                "domain": "18b01",
                "urlpath": "/5425c3",
                "session": null,
                "count_sum": 2995,
                "count": 99.83,
                "response_time_sum": 29820000,
                "response_time": 9956.59,
                "ip_comment": null
            },
            {
                "ip": "175.48.178.85",
                "domain": "5a21d",
                "urlpath": "/a7f832",
                "session": null,
                "count_sum": 2989,
                "count": 99.63,
                "response_time_sum": 86100000,
                "response_time": 28805.62,
                "ip_comment": null
            },
            {
                "ip": "156.104.107.162",
                "domain": "c95ad",
                "urlpath": "/230fce",
                "session": null,
                "count_sum": 2986,
                "count": 99.53,
                "response_time_sum": 2850000,
                "response_time": 954.45,
                "ip_comment": null
            },
            {
                "ip": "117.196.160.147",
                "domain": "9de1c",
                "urlpath": "/1ec088",
                "session": null,
                "count_sum": 2982,
                "count": 99.4,
                "response_time_sum": 42570000,
                "response_time": 14275.65,
                "ip_comment": null
            },
            {
                "ip": "35.196.90.27",
                "domain": "b9dc2",
                "urlpath": "/c902c8",
                "session": null,
                "count_sum": 2975,
                "count": 99.17,
                "response_time_sum": 85620000,
                "response_time": 28779.83,
                "ip_comment": null
            },
            {
                "ip": "197.39.29.123",
                "domain": "16a33",
                "urlpath": "/267a11",
                "session": null,
                "count_sum": 2939,
                "count": 97.97,
                "response_time_sum": 56100000,
                "response_time": 19088.13,
                "ip_comment": null
            },
            {
                "ip": "130.171.31.215",
                "domain": "e8394",
                "urlpath": "/ad5f32",
                "session": null,
                "count_sum": 2938,
                "count": 97.93,
                "response_time_sum": 46860000,
                "response_time": 15949.63,
                "ip_comment": null
            },
            {
                "ip": "7.48.254.244",
                "domain": "e738d",
                "urlpath": "/2a8afc",
                "session": null,
                "count_sum": 2921,
                "count": 97.37,
                "response_time_sum": 36510000,
                "response_time": 12499.14,
                "ip_comment": null
            },
            {
                "ip": "77.8.134.229",
                "domain": "22bd0",
                "urlpath": "/f3b803",
                "session": null,
                "count_sum": 2912,
                "count": 97.07,
                "response_time_sum": 71610000,
                "response_time": 24591.35,
                "ip_comment": null
            },
            {
                "ip": "1.251.244.213",
                "domain": "cf7cb",
                "urlpath": "/de154e",
                "session": null,
                "count_sum": 2910,
                "count": 97.0,
                "response_time_sum": 58890000,
                "response_time": 20237.11,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "ip": "197.2.52.54"
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
                "ip": "197.2.52.54",
                "domain": "4d87e",
                "urlpath": "/a4dbd0",
                "session": null,
                "count_sum": 2074,
                "count": 69.13,
                "response_time_sum": 12990000,
                "response_time": 6263.26,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "domain": "4d87e"
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
                "ip": "197.2.52.54",
                "domain": "4d87e",
                "urlpath": "/a4dbd0",
                "session": null,
                "count_sum": 2074,
                "count": 69.13,
                "response_time_sum": 12990000,
                "response_time": 6263.26,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "ip": "197.2.52.54",
    "domain": "4d87e"
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
                "ip": "197.2.52.54",
                "domain": "4d87e",
                "urlpath": "/a4dbd0",
                "session": null,
                "count_sum": 2074,
                "count": 69.13,
                "response_time_sum": 12990000,
                "response_time": 6263.26,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "urlpath": "/a4dbd0"
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
                "ip": "197.2.52.54",
                "domain": "4d87e",
                "urlpath": "/a4dbd0",
                "session": null,
                "count_sum": 2074,
                "count": 69.13,
                "response_time_sum": 12990000,
                "response_time": 6263.26,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "ip": "197.2.52.54",
    "domain": "4d87e",
    "urlpath": "/a4dbd0"
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
                "ip": "197.2.52.54",
                "domain": "4d87e",
                "urlpath": "/a4dbd0",
                "session": null,
                "count_sum": 2074,
                "count": 69.13,
                "response_time_sum": 12990000,
                "response_time": 6263.26,
                "ip_comment": null
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "ip,session",
    "order_by": "count",
    "top": 10,
    "db": false
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
                "ip": "129.77.100.212",
                "session": "a7b57",
                "domain": null,
                "urlpath": null,
                "count_sum": 3000,
                "count": 100.0,
                "response_time_sum": 39780000,
                "response_time": 13260.0,
                "ip_comment": null
            },
            {
                "ip": "195.74.209.178",
                "session": "2c708",
                "domain": null,
                "urlpath": null,
                "count_sum": 2991,
                "count": 99.7,
                "response_time_sum": 50640000,
                "response_time": 16930.79,
                "ip_comment": null
            },
            {
                "ip": "126.68.220.218",
                "session": "e755e",
                "domain": null,
                "urlpath": null,
                "count_sum": 2990,
                "count": 99.67,
                "response_time_sum": 74400000,
                "response_time": 24882.94,
                "ip_comment": null
            },
            {
                "ip": "195.186.200.240",
                "session": "8fb90",
                "domain": null,
                "urlpath": null,
                "count_sum": 2979,
                "count": 99.3,
                "response_time_sum": 21960000,
                "response_time": 7371.6,
                "ip_comment": null
            },
            {
                "ip": "143.120.140.98",
                "session": "594b6",
                "domain": null,
                "urlpath": null,
                "count_sum": 2976,
                "count": 99.2,
                "response_time_sum": 48420000,
                "response_time": 16270.16,
                "ip_comment": null
            },
            {
                "ip": "6.228.15.232",
                "session": "e6e7b",
                "domain": null,
                "urlpath": null,
                "count_sum": 2966,
                "count": 98.87,
                "response_time_sum": 52740000,
                "response_time": 17781.52,
                "ip_comment": null
            },
            {
                "ip": "229.150.209.187",
                "session": "cb56b",
                "domain": null,
                "urlpath": null,
                "count_sum": 2961,
                "count": 98.7,
                "response_time_sum": 68760000,
                "response_time": 23221.88,
                "ip_comment": null
            },
            {
                "ip": "49.107.221.49",
                "session": "8dc99",
                "domain": null,
                "urlpath": null,
                "count_sum": 2961,
                "count": 98.7,
                "response_time_sum": 15870000,
                "response_time": 5359.68,
                "ip_comment": null
            },
            {
                "ip": "83.123.135.94",
                "session": "c238c",
                "domain": null,
                "urlpath": null,
                "count_sum": 2959,
                "count": 98.63,
                "response_time_sum": 18660000,
                "response_time": 6306.18,
                "ip_comment": null
            },
            {
                "ip": "29.2.223.245",
                "session": "b16b6",
                "domain": null,
                "urlpath": null,
                "count_sum": 2954,
                "count": 98.47,
                "response_time_sum": 85290000,
                "response_time": 28872.71,
                "ip_comment": null
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session",
    "order_by": "count",
    "top": 10,
    "db": false
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
                "session": "86b09",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 89400,
                "count": 2980.0,
                "response_time_sum": 841000,
                "response_time": 9.41
            },
            {
                "session": "4d829",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 89250,
                "count": 2975.0,
                "response_time_sum": 2228000,
                "response_time": 24.96
            },
            {
                "session": "38306",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 89160,
                "count": 2972.0,
                "response_time_sum": 261000,
                "response_time": 2.93
            },
            {
                "session": "c64e7",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 89100,
                "count": 2970.0,
                "response_time_sum": 667000,
                "response_time": 7.49
            },
            {
                "session": "a5e35",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 88440,
                "count": 2948.0,
                "response_time_sum": 2685000,
                "response_time": 30.36
            },
            {
                "session": "6b06d",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 87930,
                "count": 2931.0,
                "response_time_sum": 2875000,
                "response_time": 32.7
            },
            {
                "session": "ca8d4",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 87870,
                "count": 2929.0,
                "response_time_sum": 2416000,
                "response_time": 27.5
            },
            {
                "session": "b5e77",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 87810,
                "count": 2927.0,
                "response_time_sum": 2992000,
                "response_time": 34.07
            },
            {
                "session": "d5341",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 87810,
                "count": 2927.0,
                "response_time_sum": 726000,
                "response_time": 8.27
            },
            {
                "session": "2b71d",
                "ip": null,
                "domain": null,
                "urlpath": null,
                "count_sum": 87540,
                "count": 2918.0,
                "response_time_sum": 1745000,
                "response_time": 19.93
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain",
    "order_by": "count",
    "top": 10,
    "db": false
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
                "session": "bb21a",
                "domain": "178d7",
                "ip": null,
                "urlpath": null,
                "count_sum": 89970,
                "count": 2999.0,
                "response_time_sum": 2552000,
                "response_time": 28.37
            },
            {
                "session": "400a7",
                "domain": "489d1",
                "ip": null,
                "urlpath": null,
                "count_sum": 89880,
                "count": 2996.0,
                "response_time_sum": 2679000,
                "response_time": 29.81
            },
            {
                "session": "e5657",
                "domain": "32609",
                "ip": null,
                "urlpath": null,
                "count_sum": 89820,
                "count": 2994.0,
                "response_time_sum": 2775000,
                "response_time": 30.9
            },
            {
                "session": "26f07",
                "domain": "90414",
                "ip": null,
                "urlpath": null,
                "count_sum": 89580,
                "count": 2986.0,
                "response_time_sum": 45000,
                "response_time": 0.5
            },
            {
                "session": "55fec",
                "domain": "bc51d",
                "ip": null,
                "urlpath": null,
                "count_sum": 89370,
                "count": 2979.0,
                "response_time_sum": 1936000,
                "response_time": 21.66
            },
            {
                "session": "1e5e9",
                "domain": "aeafd",
                "ip": null,
                "urlpath": null,
                "count_sum": 88140,
                "count": 2938.0,
                "response_time_sum": 607000,
                "response_time": 6.89
            },
            {
                "session": "a4a18",
                "domain": "36971",
                "ip": null,
                "urlpath": null,
                "count_sum": 87900,
                "count": 2930.0,
                "response_time_sum": 1129000,
                "response_time": 12.84
            },
            {
                "session": "461dd",
                "domain": "87fd8",
                "ip": null,
                "urlpath": null,
                "count_sum": 87780,
                "count": 2926.0,
                "response_time_sum": 841000,
                "response_time": 9.58
            },
            {
                "session": "c1844",
                "domain": "ee189",
                "ip": null,
                "urlpath": null,
                "count_sum": 87720,
                "count": 2924.0,
                "response_time_sum": 2505000,
                "response_time": 28.56
            },
            {
                "session": "70c0a",
                "domain": "8449e",
                "ip": null,
                "urlpath": null,
                "count_sum": 87360,
                "count": 2912.0,
                "response_time_sum": 2814000,
                "response_time": 32.21
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false
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
                "session": "e8de6",
                "domain": "5722b",
                "urlpath": "/e67f6e",
                "ip": null,
                "count_sum": 89640,
                "count": 2988.0,
                "response_time_sum": 1904000,
                "response_time": 21.24
            },
            {
                "session": "1b6c0",
                "domain": "10b50",
                "urlpath": "/be0cd4",
                "ip": null,
                "count_sum": 89460,
                "count": 2982.0,
                "response_time_sum": 646000,
                "response_time": 7.22
            },
            {
                "session": "b2db3",
                "domain": "37e93",
                "urlpath": "/f03e1e",
                "ip": null,
                "count_sum": 89190,
                "count": 2973.0,
                "response_time_sum": 46000,
                "response_time": 0.52
            },
            {
                "session": "8d985",
                "domain": "6fac0",
                "urlpath": "/9db909",
                "ip": null,
                "count_sum": 88920,
                "count": 2964.0,
                "response_time_sum": 1894000,
                "response_time": 21.3
            },
            {
                "session": "f8a12",
                "domain": "c4fa4",
                "urlpath": "/111099",
                "ip": null,
                "count_sum": 88920,
                "count": 2964.0,
                "response_time_sum": 36000,
                "response_time": 0.4
            },
            {
                "session": "ed8a8",
                "domain": "d2363",
                "urlpath": "/df0100",
                "ip": null,
                "count_sum": 88860,
                "count": 2962.0,
                "response_time_sum": 1919000,
                "response_time": 21.6
            },
            {
                "session": "6cc27",
                "domain": "46685",
                "urlpath": "/32d792",
                "ip": null,
                "count_sum": 88620,
                "count": 2954.0,
                "response_time_sum": 1673000,
                "response_time": 18.88
            },
            {
                "session": "fcf8e",
                "domain": "80744",
                "urlpath": "/161734",
                "ip": null,
                "count_sum": 88620,
                "count": 2954.0,
                "response_time_sum": 1094000,
                "response_time": 12.34
            },
            {
                "session": "d220b",
                "domain": "91be0",
                "urlpath": "/3d6e09",
                "ip": null,
                "count_sum": 88320,
                "count": 2944.0,
                "response_time_sum": 805000,
                "response_time": 9.11
            },
            {
                "session": "4a899",
                "domain": "93035",
                "urlpath": "/317f5a",
                "ip": null,
                "count_sum": 87990,
                "count": 2933.0,
                "response_time_sum": 1260000,
                "response_time": 14.32
            }
        ],
        "total": 300
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "domain": "db0dc"
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
                "session": "3c0a3",
                "domain": "db0dc",
                "urlpath": "/4aa3d0",
                "ip": null,
                "count_sum": 5520,
                "count": 184.0,
                "response_time_sum": 2298000,
                "response_time": 416.3
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "urlpath": "/4aa3d0"
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
                "session": "3c0a3",
                "domain": "db0dc",
                "urlpath": "/4aa3d0",
                "ip": null,
                "count_sum": 5520,
                "count": 184.0,
                "response_time_sum": 2298000,
                "response_time": 416.3
            }
        ],
        "total": 1
    }
}
```

### 



请求

```js
{
    "group_by": "session,domain,urlpath",
    "order_by": "count",
    "top": 10,
    "db": false,
    "domain": "db0dc",
    "urlpath": "/4aa3d0"
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
                "session": "3c0a3",
                "domain": "db0dc",
                "urlpath": "/4aa3d0",
                "ip": null,
                "count_sum": 5520,
                "count": 184.0,
                "response_time_sum": 2298000,
                "response_time": 416.3
            }
        ],
        "total": 1
    }
}
```

# /api/v1/acl/log/delete

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 
|cidr | 字符串 | 非必填/无默认值 | False |  -  | 
|domain | 字符串 | 非必填/无默认值 | False |  -  | 
|urlpath | 字符串 | 非必填/无默认值 | False |  -  | 
|rule_id | 整型数字 | 非必填/无默认值 | False |  -  | 



### 删除 acl 日志



请求

```js
{}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": null
}
```

# /api/v1/acl/log/download

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_after | 浮点数字 | 非必填/无默认值 | False | 开始时间; 最小值: 0;  | 
|time_before | 浮点数字 | 非必填/无默认值 | False | 结束时间; 最小值: 0;  | 
|cidr | 字符串 | 非必填/无默认值 | False |  -  | 
|domain | 字符串 | 非必填/无默认值 | False |  -  | 
|urlpath | 字符串 | 非必填/无默认值 | False |  -  | 
|rule_id | 整型数字 | 非必填/无默认值 | False |  -  | 



### 下载 acl 日志



响应

```js
"不支持展示的数据类型，如文件下载等"
```

# /api/v1/acl/ip_comment

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|ip | 字符串 | 必填 | False |  -  | 
|comment | 字符串 | 必填 | True | 最大长度: 128; 最小长度: 0；  | 



### 给 ip 增加备注



请求

```js
{
    "ip": "2.3.3.3",
    "comment": "66666"
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

# /api/v1/acl/white_list

## GET



### 获取 acl ip 白名单列表



本 API 支持翻页参数

响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": 7,
            "create_time": 1545297393.384932,
            "cidr": "1.2.3.4/8",
            "comment": "comment"
        }
    ]
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|cidr | 字符串 | 必填 | False | IPv4的 IP 或者子网形式字符串;  | 
|comment | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 



### 创建 acl ip 白名单



请求

```js
{
    "cidr": "1.2.3.4/8",
    "comment": "comment"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 3,
        "create_time": 1545297393.06278,
        "cidr": "1.2.3.4/8",
        "comment": "comment"
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|cidr | 字符串 | 必填 | False | IPv4的 IP 或者子网形式字符串;  | 
|comment | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|id | 整型数字 | 必填 | False |  -  | 



### 编辑 acl ip 白名单



请求

```js
{
    "id": 8,
    "cidr": "192.168.1.0",
    "comment": "put"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 8,
        "create_time": 1545297393.502852,
        "cidr": "192.168.1.0",
        "comment": "put"
    }
}
```

## DELETE

数据格式

> 只需要传递 ID

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 



### 删除 acl ip 白名单项目



请求

```js
{
    "id": 4
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

