# /api/PolicyRuleAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|pattern | JSON类型 | 必填 | False | JSON | 
|action | 指定选项 | 必填 | False | 选项是: ['allow', 'dry_run', 'deny'] | 
|comment | 字符串 | 必填 | False |  -  | 
|attack_type | 指定选项 | 必填 | False | 选项是: [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 61, 62] | 
|log_option | 指定选项 | 必填 | False | 选项是: ['Non-Persistence', 'Drop', 'Persistence'] | 
|expire_time | 浮点数字 | 必填 | True |  -  | 
|is_global | 布尔 | 必填 | False |  -  | 
|websites | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#wsdsfpshstqxtawhdgxcsubtuzfmhvyo) | 
|forbidden_page_config | OneOf 类型 | - | - | [详见下方表格](#ghogagtwkpnvocdfpoznlmentyiiddjt) | 

<a id="wsdsfpshstqxtawhdgxcsubtuzfmhvyo">websites</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="ghogagtwkpnvocdfpoznlmentyiiddjt">1. forbidden_page_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#drxgimyctpfydzhlbgsrqaciqpasamlf) | 

<a id="drxgimyctpfydzhlbgsrqaciqpasamlf">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['response'] | 
|status_code | 整型数字 | 必填 | False | 最小值: 101; 最大值: 599 | 
|path | 字符串 | 必填 | False | 大小写字母和数字; 最小长度: 0；  | 


<a id="ghogagtwkpnvocdfpoznlmentyiiddjt">2. forbidden_page_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#nrbczjzvyqpzlxxyzjgtazvazbfoindw) | 

<a id="nrbczjzvyqpzlxxyzjgtazvazbfoindw">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['redirect'] | 
|status_code | 指定选项 | 必填 | False | 选项是: [301, 302, 307] | 
|path | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 创建全局自定义策略



请求

```js
{
    "pattern": {
        "$AND": [
            {
                "infix": {
                    "urlpath": "a"
                }
            }
        ]
    },
    "action": "allow",
    "comment": "test",
    "attack_type": 0,
    "log_option": "Persistence",
    "is_global": true,
    "websites": [],
    "expire_time": null
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 7,
        "version": "7@time-1544513545",
        "websites": [],
        "target": "logic_expr",
        "pattern": {
            "$AND": [
                {
                    "infix": {
                        "urlpath": "a"
                    }
                }
            ]
        },
        "action": "allow",
        "is_enabled": true,
        "comment": "test",
        "attack_type": 0,
        "log_option": "Persistence",
        "create_time": "1544513545",
        "last_update_time": "1544513545",
        "expire_time": null,
        "is_global": true,
        "forbidden_page_config": null,
        "priority": 0
    },
    "msg": null
}
```

### - 创建绑定站点的自定义策略



请求

```js
{
    "pattern": {
        "$AND": [
            {
                "infix": {
                    "urlpath": "a"
                }
            }
        ]
    },
    "action": "allow",
    "comment": "test",
    "attack_type": 0,
    "log_option": "Persistence",
    "is_global": false,
    "websites": [
        5,
        4,
        3,
        2,
        1
    ],
    "expire_time": null
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 8,
        "version": "8@time-1544513546",
        "websites": [
            5,
            4,
            3,
            2,
            1
        ],
        "target": "logic_expr",
        "pattern": {
            "$AND": [
                {
                    "infix": {
                        "urlpath": "a"
                    }
                }
            ]
        },
        "action": "allow",
        "is_enabled": true,
        "comment": "test",
        "attack_type": 0,
        "log_option": "Persistence",
        "create_time": "1544513546",
        "last_update_time": "1544513546",
        "expire_time": null,
        "is_global": false,
        "forbidden_page_config": null,
        "priority": 0
    },
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|pattern | JSON类型 | 必填 | False | JSON | 
|action | 指定选项 | 必填 | False | 选项是: ['allow', 'dry_run', 'deny'] | 
|comment | 字符串 | 必填 | False |  -  | 
|attack_type | 指定选项 | 必填 | False | 选项是: [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 61, 62] | 
|log_option | 指定选项 | 必填 | False | 选项是: ['Non-Persistence', 'Drop', 'Persistence'] | 
|expire_time | 浮点数字 | 必填 | True |  -  | 
|is_global | 布尔 | 必填 | False |  -  | 
|websites | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#fmapcgeootdklulxgdknwtlamghantqh) | 
|forbidden_page_config | OneOf 类型 | - | - | [详见下方表格](#ruhgcsvmdbsutqsugwdwsoryxdungvvl) | 
|id | 整型数字 | 必填 | False |  -  | 
|is_enabled | 布尔 | 必填 | False |  -  | 

<a id="fmapcgeootdklulxgdknwtlamghantqh">websites</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="ruhgcsvmdbsutqsugwdwsoryxdungvvl">1. forbidden_page_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#jfjwvtjfkwdiutmihsorqfiyvayfbdbn) | 

<a id="jfjwvtjfkwdiutmihsorqfiyvayfbdbn">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['response'] | 
|status_code | 整型数字 | 必填 | False | 最小值: 101; 最大值: 599 | 
|path | 字符串 | 必填 | False | 大小写字母和数字; 最小长度: 0；  | 


<a id="ruhgcsvmdbsutqsugwdwsoryxdungvvl">2. forbidden_page_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#cxmjipcdrqdkpirbkeotnxrgrqfstdpf) | 

<a id="cxmjipcdrqdkpirbkeotnxrgrqfstdpf">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['redirect'] | 
|status_code | 指定选项 | 必填 | False | 选项是: [301, 302, 307] | 
|path | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 编辑自定义策略



请求

```js
{
    "pattern": {
        "$AND": [
            {
                "infix": {
                    "urlpath": "a"
                }
            }
        ]
    },
    "action": "allow",
    "comment": "test",
    "attack_type": 0,
    "log_option": "Persistence",
    "is_global": false,
    "websites": [
        5
    ],
    "expire_time": null,
    "is_enabled": false,
    "id": 10
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 10,
        "version": "10@time-1544513547",
        "websites": [
            5
        ],
        "target": "logic_expr",
        "pattern": {
            "$AND": [
                {
                    "infix": {
                        "urlpath": "a"
                    }
                }
            ]
        },
        "action": "allow",
        "is_enabled": false,
        "comment": "test",
        "attack_type": 0,
        "log_option": "Persistence",
        "create_time": "1544513547",
        "last_update_time": "1544513547",
        "expire_time": null,
        "is_global": false,
        "forbidden_page_config": null,
        "priority": 0
    },
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#ncewyilernjuptojkcubehfpupdardcc) | 

<a id="ncewyilernjuptojkcubehfpupdardcc">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除策略



请求

```js
{
    "id": [
        9
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

# /api/PolicyRuleSoftwarePortMirroringAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|pattern | JSON类型 | 必填 | False | JSON | 
|action | 指定选项 | 必填 | False | 选项是: ['allow', 'dry_run', 'deny'] | 
|comment | 字符串 | 必填 | False |  -  | 
|attack_type | 指定选项 | 必填 | False | 选项是: [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 61, 62] | 
|log_option | 指定选项 | 必填 | False | 选项是: ['Non-Persistence', 'Drop', 'Persistence'] | 
|expire_time | 浮点数字 | 必填 | True |  -  | 
|is_global | 布尔 | 必填 | False |  -  | 
|websites | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#cpneplmcbefcnheoaeyvgktgmocmrjzk) | 

<a id="cpneplmcbefcnheoaeyvgktgmocmrjzk">websites</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 创建全局自定义策略



请求

```js
{
    "pattern": {
        "$AND": [
            {
                "infix": {
                    "urlpath": "a"
                }
            }
        ]
    },
    "action": "allow",
    "comment": "test",
    "attack_type": 0,
    "log_option": "Persistence",
    "is_global": true,
    "websites": [],
    "expire_time": null
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 18,
        "version": "18@time-1544513549",
        "websites": [],
        "target": "logic_expr",
        "pattern": {
            "$AND": [
                {
                    "infix": {
                        "urlpath": "a"
                    }
                }
            ]
        },
        "action": "allow",
        "is_enabled": true,
        "comment": "test",
        "attack_type": 0,
        "log_option": "Persistence",
        "create_time": "1544513549",
        "last_update_time": "1544513549",
        "expire_time": null,
        "is_global": true,
        "forbidden_page_config": null,
        "priority": 0
    },
    "msg": null
}
```

### - 创建绑定站点的自定义策略



请求

```js
{
    "pattern": {
        "$AND": [
            {
                "infix": {
                    "urlpath": "a"
                }
            }
        ]
    },
    "action": "allow",
    "comment": "test",
    "attack_type": 0,
    "log_option": "Persistence",
    "is_global": false,
    "websites": [
        5,
        4,
        3,
        2,
        1
    ],
    "expire_time": null
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 19,
        "version": "19@time-1544513550",
        "websites": [
            5,
            4,
            3,
            2,
            1
        ],
        "target": "logic_expr",
        "pattern": {
            "$AND": [
                {
                    "infix": {
                        "urlpath": "a"
                    }
                }
            ]
        },
        "action": "allow",
        "is_enabled": true,
        "comment": "test",
        "attack_type": 0,
        "log_option": "Persistence",
        "create_time": "1544513550",
        "last_update_time": "1544513550",
        "expire_time": null,
        "is_global": false,
        "forbidden_page_config": null,
        "priority": 0
    },
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|pattern | JSON类型 | 必填 | False | JSON | 
|action | 指定选项 | 必填 | False | 选项是: ['allow', 'dry_run', 'deny'] | 
|comment | 字符串 | 必填 | False |  -  | 
|attack_type | 指定选项 | 必填 | False | 选项是: [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 61, 62] | 
|log_option | 指定选项 | 必填 | False | 选项是: ['Non-Persistence', 'Drop', 'Persistence'] | 
|expire_time | 浮点数字 | 必填 | True |  -  | 
|is_global | 布尔 | 必填 | False |  -  | 
|websites | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#rexxmrihshfvnagqqgrtnposslqihxoi) | 
|id | 整型数字 | 必填 | False |  -  | 
|is_enabled | 布尔 | 必填 | False |  -  | 

<a id="rexxmrihshfvnagqqgrtnposslqihxoi">websites</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 编辑自定义策略



请求

```js
{
    "pattern": {
        "$AND": [
            {
                "infix": {
                    "urlpath": "a"
                }
            }
        ]
    },
    "action": "allow",
    "comment": "test",
    "attack_type": 0,
    "log_option": "Persistence",
    "is_global": false,
    "websites": [
        5
    ],
    "expire_time": null,
    "is_enabled": false,
    "id": 21
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 21,
        "version": "21@time-1544513550",
        "websites": [
            5
        ],
        "target": "logic_expr",
        "pattern": {
            "$AND": [
                {
                    "infix": {
                        "urlpath": "a"
                    }
                }
            ]
        },
        "action": "allow",
        "is_enabled": false,
        "comment": "test",
        "attack_type": 0,
        "log_option": "Persistence",
        "create_time": "1544513550",
        "last_update_time": "1544513550",
        "expire_time": null,
        "is_global": false,
        "forbidden_page_config": null,
        "priority": 0
    },
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#xmeqijvaginotnucsbptjninjeiilqnx) | 

<a id="xmeqijvaginotnucsbptjninjeiilqnx">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除策略



请求

```js
{
    "id": [
        20
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

# /api/PolicyRulePriorityAPI

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|website | 整型数字 | 非必填/None | True |  -  | 
|policy_rule_ids | 列表 | 必填 | False | [ -  详见下方表格](#fyxztfohxjmrotxalqiknolhinsfncyp) | 

<a id="fyxztfohxjmrotxalqiknolhinsfncyp">policy_rule_ids</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 修改全局策略的优先级



请求

```js
{
    "policy_rule_ids": [
        3,
        2,
        1
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "website": null,
        "policy_rule_ids": [
            3,
            2,
            1
        ]
    },
    "msg": null
}
```

### - 修改策略的优先级



请求

```js
{
    "website": 5,
    "policy_rule_ids": [
        6,
        5,
        4
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "website": 5,
        "policy_rule_ids": [
            6,
            5,
            4
        ]
    },
    "msg": null
}
```

### - 修改全局策略的优先级



请求

```js
{
    "policy_rule_ids": [
        14,
        13,
        12
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "website": null,
        "policy_rule_ids": [
            14,
            13,
            12
        ]
    },
    "msg": null
}
```

### - 修改策略的优先级



请求

```js
{
    "website": 5,
    "policy_rule_ids": [
        17,
        16,
        15
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "website": 5,
        "policy_rule_ids": [
            17,
            16,
            15
        ]
    },
    "msg": null
}
```

# /api/PolicyGroupAPI

## GET

### 权限
 - Website And Security Policy Management

### - 获取策略组



请求

```js
{
    "id": 1
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 1,
        "websites": [],
        "is_timeout_enabled": true,
        "name": "默认防护策略",
        "create_time": "1531270711",
        "last_update_time": "1531270711",
        "is_default": true,
        "modules_state": true,
        "response_detection_state": true,
        "response_detection_max_body_size": 1024,
        "request_detection_max_body_size": 1024,
        "detection_timeout_threshold": 1000,
        "log_detection_timeout_event": true,
        "forbidden_page_config": {
            "path": "",
            "action": "response",
            "status_code": 403
        },
        "modules_detection_config": {
            "m_xss": {
                "state": "enabled",
                "detect_config": {
                    "detect_complete_html": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_csrf": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_java": {
                "state": "enabled",
                "detect_config": {
                    "detect_upload_file": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_rule": {
                "state": "enabled",
                "detect_config": {
                    "info_leak_types": [
                        "test file",
                        "backup file",
                        "code repository",
                        "server sensitive file"
                    ],
                    "check_info_leak_by_rsp": false
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_sqli": {
                "state": "enabled",
                "detect_config": {
                    "detect_non_injection_sql": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_ssrf": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_scanner": {
                "state": "disabled",
                "detect_config": {
                    "robot_types": [
                        "scanner"
                    ]
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_response": {
                "state": "disabled",
                "detect_config": {
                    "error_types": [
                        "directory indexing",
                        "SQL execution error",
                        "server exception"
                    ]
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_file_upload": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_file_include": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_cmd_injection": {
                "state": "disabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_php_unserialize": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_java_unserialize": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_php_code_injection": {
                "state": "enabled",
                "detect_config": {
                    "detect_upload_file": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            }
        },
        "misc_detection_config": {
            "decode_config": {
                "decode_methods": [
                    "url decode",
                    "JSON",
                    "base64",
                    "hex",
                    "eval",
                    "XML",
                    "PHP deserialize",
                    "utf7"
                ]
            }
        }
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
|modules_state | 布尔 | 必填 | False |  -  | 
|response_detection_state | 布尔 | 必填 | False |  -  | 
|response_detection_max_body_size | 整型数字 | 必填 | False | 最小值: 1;  | 
|request_detection_max_body_size | 整型数字 | 必填 | False | 最小值: 1;  | 
|is_timeout_enabled | 布尔 | 必填 | False |  -  | 
|detection_timeout_threshold | 整型数字 | 必填 | False | 最小值: 0;  | 
|log_detection_timeout_event | 布尔 | 必填 | False |  -  | 
|modules_detection_config | JSON类型 | 必填 | False | JSON | 
|misc_detection_config | JSON类型 | 必填 | False | JSON | 
|forbidden_page_config | OneOf 类型 | - | - | [详见下方表格](#maguzfzxbkuwprstivqjyivqeyuavwch) | 

<a id="maguzfzxbkuwprstivqjyivqeyuavwch">1. forbidden_page_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#egfprzggeqtpzjseqiihfgafflpqoone) | 

<a id="egfprzggeqtpzjseqiihfgafflpqoone">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['response'] | 
|status_code | 整型数字 | 必填 | False | 最小值: 101; 最大值: 599 | 
|path | 字符串 | 必填 | False | 大小写字母和数字; 最小长度: 0；  | 


<a id="maguzfzxbkuwprstivqjyivqeyuavwch">2. forbidden_page_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#sbcbsnohkbpukoabldmddmuespruwwvl) | 

<a id="sbcbsnohkbpukoabldmddmuespruwwvl">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['redirect'] | 
|status_code | 指定选项 | 必填 | False | 选项是: [301, 302, 307] | 
|path | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 编辑策略组



请求

```js
{
    "id": 7,
    "name": "互联网客户",
    "modules_state": true,
    "response_detection_state": true,
    "response_detection_max_body_size": 1024,
    "request_detection_max_body_size": 1024,
    "is_timeout_enabled": true,
    "detection_timeout_threshold": 1000,
    "log_detection_timeout_event": true,
    "forbidden_page_config": {
        "path": "",
        "action": "response",
        "status_code": 403
    },
    "modules_detection_config": {
        "m_xss": {
            "state": "enabled",
            "detect_config": {
                "detect_complete_html": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_csrf": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_java": {
            "state": "enabled",
            "detect_config": {
                "detect_upload_file": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_rule": {
            "state": "enabled",
            "detect_config": {
                "info_leak_types": [
                    "test file",
                    "backup file",
                    "code repository",
                    "server sensitive file"
                ],
                "check_info_leak_by_rsp": false
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_sqli": {
            "state": "enabled",
            "detect_config": {
                "detect_non_injection_sql": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_ssrf": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_scanner": {
            "state": "enabled",
            "detect_config": {
                "robot_types": [
                    "scanner"
                ]
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_response": {
            "state": "enabled",
            "detect_config": {
                "error_types": [
                    "directory indexing",
                    "SQL execution error",
                    "server exception"
                ]
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_file_upload": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_file_include": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_cmd_injection": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_php_unserialize": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_java_unserialize": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_php_code_injection": {
            "state": "enabled",
            "detect_config": {
                "detect_upload_file": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        }
    },
    "misc_detection_config": {
        "decode_config": {
            "decode_methods": [
                "url decode",
                "JSON",
                "base64",
                "hex",
                "eval",
                "XML",
                "PHP deserialize",
                "utf7"
            ]
        }
    }
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

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#zpbboomdzyvdyjaklycxhgstgqqwupoc) | 

<a id="zpbboomdzyvdyjaklycxhgstgqqwupoc">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除策略组



请求

```js
{
    "id__in": [
        6
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

# /api/PolicyGroupSoftwarePortMirroringAPI

## GET

### 权限
 - Website And Security Policy Management

### - 获取策略组



请求

```js
{
    "id": 1
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 1,
        "websites": [],
        "is_timeout_enabled": true,
        "name": "默认防护策略",
        "create_time": "1531270711",
        "last_update_time": "1531270711",
        "is_default": true,
        "modules_state": true,
        "response_detection_state": true,
        "response_detection_max_body_size": 1024,
        "request_detection_max_body_size": 1024,
        "detection_timeout_threshold": 1000,
        "log_detection_timeout_event": true,
        "modules_detection_config": {
            "m_xss": {
                "state": "enabled",
                "detect_config": {
                    "detect_complete_html": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_csrf": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_java": {
                "state": "enabled",
                "detect_config": {
                    "detect_upload_file": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_rule": {
                "state": "enabled",
                "detect_config": {
                    "info_leak_types": [
                        "test file",
                        "backup file",
                        "code repository",
                        "server sensitive file"
                    ],
                    "check_info_leak_by_rsp": false
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_sqli": {
                "state": "enabled",
                "detect_config": {
                    "detect_non_injection_sql": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_ssrf": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_scanner": {
                "state": "disabled",
                "detect_config": {
                    "robot_types": [
                        "scanner"
                    ]
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_response": {
                "state": "disabled",
                "detect_config": {
                    "error_types": [
                        "directory indexing",
                        "SQL execution error",
                        "server exception"
                    ]
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_file_upload": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_file_include": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_cmd_injection": {
                "state": "disabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_php_unserialize": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_java_unserialize": {
                "state": "enabled",
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            },
            "m_php_code_injection": {
                "state": "enabled",
                "detect_config": {
                    "detect_upload_file": true
                },
                "low_risk_action": "continue",
                "high_risk_action": "continue",
                "medium_risk_action": "continue",
                "low_risk_enable_log": 1,
                "high_risk_enable_log": 1,
                "medium_risk_enable_log": 1
            }
        },
        "misc_detection_config": {
            "decode_config": {
                "decode_methods": [
                    "url decode",
                    "JSON",
                    "base64",
                    "hex",
                    "eval",
                    "XML",
                    "PHP deserialize",
                    "utf7"
                ]
            }
        }
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
|modules_state | 布尔 | 必填 | False |  -  | 
|response_detection_state | 布尔 | 必填 | False |  -  | 
|response_detection_max_body_size | 整型数字 | 必填 | False | 最小值: 1;  | 
|request_detection_max_body_size | 整型数字 | 必填 | False | 最小值: 1;  | 
|is_timeout_enabled | 布尔 | 必填 | False |  -  | 
|detection_timeout_threshold | 整型数字 | 必填 | False | 最小值: 0;  | 
|log_detection_timeout_event | 布尔 | 必填 | False |  -  | 
|modules_detection_config | JSON类型 | 必填 | False | JSON | 
|misc_detection_config | JSON类型 | 必填 | False | JSON | 

### 权限
 - Website And Security Policy Management

### - 编辑策略组



请求

```js
{
    "id": 7,
    "name": "互联网客户",
    "modules_state": true,
    "response_detection_state": true,
    "response_detection_max_body_size": 1024,
    "request_detection_max_body_size": 1024,
    "is_timeout_enabled": true,
    "detection_timeout_threshold": 1000,
    "log_detection_timeout_event": true,
    "modules_detection_config": {
        "m_xss": {
            "state": "enabled",
            "detect_config": {
                "detect_complete_html": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_csrf": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_java": {
            "state": "enabled",
            "detect_config": {
                "detect_upload_file": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_rule": {
            "state": "enabled",
            "detect_config": {
                "info_leak_types": [
                    "test file",
                    "backup file",
                    "code repository",
                    "server sensitive file"
                ],
                "check_info_leak_by_rsp": false
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_sqli": {
            "state": "enabled",
            "detect_config": {
                "detect_non_injection_sql": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_ssrf": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_scanner": {
            "state": "enabled",
            "detect_config": {
                "robot_types": [
                    "scanner"
                ]
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_response": {
            "state": "enabled",
            "detect_config": {
                "error_types": [
                    "directory indexing",
                    "SQL execution error",
                    "server exception"
                ]
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_file_upload": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_file_include": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_cmd_injection": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_php_unserialize": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_java_unserialize": {
            "state": "enabled",
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        },
        "m_php_code_injection": {
            "state": "enabled",
            "detect_config": {
                "detect_upload_file": true
            },
            "low_risk_action": "continue",
            "high_risk_action": "continue",
            "medium_risk_action": "continue",
            "low_risk_enable_log": 1,
            "high_risk_enable_log": 1,
            "medium_risk_enable_log": 1
        }
    },
    "misc_detection_config": {
        "decode_config": {
            "decode_methods": [
                "url decode",
                "JSON",
                "base64",
                "hex",
                "eval",
                "XML",
                "PHP deserialize",
                "utf7"
            ]
        }
    }
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

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#aaqnvgazvileawtzwlcadbubiertiluh) | 

<a id="aaqnvgazvileawtzwlcadbubiertiluh">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除策略组



请求

```js
{
    "id__in": [
        6
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

