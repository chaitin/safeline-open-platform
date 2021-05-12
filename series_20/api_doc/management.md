# /api/SMTPConfigAPI

## GET

### 权限
 - System Management

### - 获取 smtp 配置



响应

```js
{
    "err": null,
    "data": {
        "ssl": false,
        "tls": true,
        "port": 25,
        "server": "smtp.qq.com",
        "account": "foobar@qq.com",
        "comment": "foobar"
    },
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|server | 字符串 | 必填 | False | IP 或者域名;  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|account | 字符串 | 必填 | False |  -  | 
|password | 字符串 | 非必填/'' | False |  -  | 
|tls | 布尔 | 必填 | False |  -  | 
|ssl | 布尔 | 必填 | False |  -  | 
|comment | 字符串 | 必填 | False | 最小长度: 0；  | 

### 权限
 - System Management

### - 编辑 smtp 配置



请求

```js
{
    "server": "smtp.qq.com",
    "account": "foobar@qq.com",
    "port": 25,
    "tls": true,
    "ssl": false,
    "password": "foobar",
    "comment": "foobar"
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

### - 已经配置过 smtp 密码的情况下，编辑可以不再次输入密码



请求

```js
{
    "server": "smtp.gmail.com",
    "account": "foobar@gmail.com",
    "port": 25,
    "tls": true,
    "ssl": false,
    "comment": "foobar"
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

# /api/SMTPTestAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|email | 字符串 | 必填 | False |  -  | 

### 权限
 - System Management

### - 测试 smtp 配置



请求

```js
{
    "email": "foobar@gmail.com"
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

# /api/AlarmSubscriptionAPI

## GET

### 权限
 - System Management

### - 获取告警订阅列表



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 3,
            "receiver": {
                "type": "email",
                "email": "foobar@gmail.com"
            },
            "alarm_type": [
                "System Management"
            ],
            "create_time": "1544513518",
            "comment": "foobar"
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
|receiver | OneOf 类型 | - | - | [详见下方表格](#cnklghcelpacwpklkaqqqnvetmyfbfns) | 
|alarm_type | 指定选项 | 必填 | False | 选项是: ['Plugin Management', 'System Management', 'ACL Management', 'Security Policy Management', 'Account Security', 'Request Log', 'Website Management', 'System Monitor And Alarm'] | 
|comment | 字符串 | 非必填/'' | False | 最小长度: 0；  | 

<a id="cnklghcelpacwpklkaqqqnvetmyfbfns">1. receiver</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#cvqlchuabxlsxsccjiyzkyzlkpeuxuor) | 

<a id="cvqlchuabxlsxsccjiyzkyzlkpeuxuor">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['email'] | 
|email | 字符串 | 必填 | False |  -  | 


<a id="cnklghcelpacwpklkaqqqnvetmyfbfns">2. receiver</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#idwkqzhiszjifgbghteieroajivvsymr) | 

<a id="idwkqzhiszjifgbghteieroajivvsymr">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['Webhook'] | 
|url | 字符串 | 必填 | False |  -  | 


<a id="cnklghcelpacwpklkaqqqnvetmyfbfns">3. receiver</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#xuaugnumnxlfmafzzwowrzfmolqnquas) | 

<a id="xuaugnumnxlfmafzzwowrzfmolqnquas">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['Syslog'] | 
|host | 字符串 | 必填 | False | IP 或者域名;  | 
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|protocol | 指定选项 | 必填 | False | 选项是: ['TCP', 'UDP'] | 
|rfc | 指定选项 | 必填 | False | 选项是: ['RFC3164', 'RFC5424'] | 

### 权限
 - System Management

### - 创建一个告警订阅



请求

```js
{
    "receiver": {
        "type": "email",
        "email": "foobar@gmail.com"
    },
    "alarm_type": [
        "System Management"
    ],
    "comment": "foobar"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 1,
        "receiver": {
            "type": "email",
            "email": "foobar@gmail.com"
        },
        "alarm_type": [
            "System Management"
        ],
        "create_time": "1544513517",
        "comment": "foobar"
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
|receiver | OneOf 类型 | - | - | [详见下方表格](#kecdfsgmtsdgvrzuavumcqvawetjkwsg) | 
|alarm_type | 指定选项 | 必填 | False | 选项是: ['Plugin Management', 'System Management', 'ACL Management', 'Security Policy Management', 'Account Security', 'Request Log', 'Website Management', 'System Monitor And Alarm'] | 
|comment | 字符串 | 非必填/'' | False | 最小长度: 0；  | 

<a id="kecdfsgmtsdgvrzuavumcqvawetjkwsg">1. receiver</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#tozjpzeeezkfoeempernwjinqfmdbuei) | 

<a id="tozjpzeeezkfoeempernwjinqfmdbuei">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['email'] | 
|email | 字符串 | 必填 | False |  -  | 


<a id="kecdfsgmtsdgvrzuavumcqvawetjkwsg">2. receiver</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#kwzvugndbgmtlemcvmfauoxtonhxlvqz) | 

<a id="kwzvugndbgmtlemcvmfauoxtonhxlvqz">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['Webhook'] | 
|url | 字符串 | 必填 | False |  -  | 


<a id="kecdfsgmtsdgvrzuavumcqvawetjkwsg">3. receiver</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#wujhvfrfzxsbdqegujldmkogeeixuwov) | 

<a id="wujhvfrfzxsbdqegujldmkogeeixuwov">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['Syslog'] | 
|host | 字符串 | 必填 | False | IP 或者域名;  | 
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|protocol | 指定选项 | 必填 | False | 选项是: ['TCP', 'UDP'] | 
|rfc | 指定选项 | 必填 | False | 选项是: ['RFC3164', 'RFC5424'] | 

### 权限
 - System Management

### - 编辑告警订阅



请求

```js
{
    "id": 2,
    "receiver": {
        "type": "Syslog",
        "host": "2607:f8b0:4000:800::1005",
        "port": 1234,
        "protocol": "TCP",
        "rfc": "RFC5424"
    },
    "alarm_type": [
        "Account Security"
    ],
    "comment": "foobar"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 2,
        "receiver": {
            "type": "Syslog",
            "host": "2607:f8b0:4000:800::1005",
            "port": 1234,
            "protocol": "TCP",
            "rfc": "RFC5424"
        },
        "alarm_type": [
            "Account Security"
        ],
        "create_time": "1544513518",
        "comment": "foobar"
    },
    "msg": null
}
```

# /api/AlarmThresholdAPI

## GET

### 权限
 - System Management

### - get_alarm_threshold



响应

```js
{
    "err": null,
    "data": {
        "cpu_usage": {
            "duration": 1,
            "threshold": 80
        },
        "disk_usage": {
            "threshold": 80
        },
        "memory_usage": {
            "duration": 1,
            "threshold": 80
        },
        "request_number": {
            "duration": 1,
            "threshold": 0
        },
        "attack_request_number": {
            "duration": 1,
            "threshold": 0
        },
        "denied_request_number": {
            "duration": 1,
            "threshold": 0
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
|cpu_usage | 字典 | - | - | [详见下方表格](#yehrrvwbxlicabudhesotzyneluvmggj) | 
|memory_usage | 字典 | - | - | [详见下方表格](#zjepvtogjytoxailrgormeumtzkakscn) | 
|disk_usage | 字典 | - | - | [详见下方表格](#pmjsyuczqwxkkrpbmnwdhuzirsnyzcfe) | 
|denied_request_number | 字典 | - | - | [详见下方表格](#xuwgyemqklijsnggztuaslqjrhvowiha) | 
|request_number | 字典 | - | - | [详见下方表格](#eshhzqzxxogglqmsxizqhkqudrriqljl) | 
|attack_request_number | 字典 | - | - | [详见下方表格](#oqhmbxkcntbsbpihfvobitzsyivbyvcr) | 

<a id="yehrrvwbxlicabudhesotzyneluvmggj">cpu_usage</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|threshold | 整型数字 | 必填 | False | 最小值: 0; 最大值: 100 | 
|duration | 指定选项 | 必填 | False | 选项是: [1, 2, 5] | 


<a id="zjepvtogjytoxailrgormeumtzkakscn">memory_usage</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|threshold | 整型数字 | 必填 | False | 最小值: 0; 最大值: 100 | 
|duration | 指定选项 | 必填 | False | 选项是: [1, 2, 5] | 


<a id="pmjsyuczqwxkkrpbmnwdhuzirsnyzcfe">disk_usage</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|threshold | 整型数字 | 必填 | False | 最小值: 0; 最大值: 100 | 


<a id="xuwgyemqklijsnggztuaslqjrhvowiha">denied_request_number</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|threshold | 整型数字 | 必填 | False | 最小值: 0;  | 
|duration | 指定选项 | 必填 | False | 选项是: [1, 2, 5] | 


<a id="eshhzqzxxogglqmsxizqhkqudrriqljl">request_number</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|threshold | 整型数字 | 必填 | False | 最小值: 0;  | 
|duration | 指定选项 | 必填 | False | 选项是: [1, 2, 5] | 


<a id="oqhmbxkcntbsbpihfvobitzsyivbyvcr">attack_request_number</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|threshold | 整型数字 | 必填 | False | 最小值: 0;  | 
|duration | 指定选项 | 必填 | False | 选项是: [1, 2, 5] | 

### 权限
 - System Management

### - set_alarm_threshold



请求

```js
{
    "cpu_usage": {
        "threshold": 10,
        "duration": 2
    },
    "memory_usage": {
        "threshold": 10,
        "duration": 2
    },
    "disk_usage": {
        "threshold": 10
    },
    "denied_request_number": {
        "threshold": 100000,
        "duration": 5
    },
    "request_number": {
        "threshold": 100000,
        "duration": 5
    },
    "attack_request_number": {
        "threshold": 100000,
        "duration": 5
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

# /api/MgtAPIIPSourceAPI

## GET

### 权限
 - System Management

### - 获取管理服务器 ip 来源



响应

```js
{
    "err": null,
    "data": {
        "value": [
            "Socket"
        ]
    },
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|value | 列表 | 必填 | False | [ -  详见下方表格](#kmdxcyghlyshbgwmziabklemnbupslmg) | 

<a id="kmdxcyghlyshbgwmziabklemnbupslmg">value</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - System Management

### - 设置管理服务器 ip 来源

对于 x-forwarded-for，还可以添加 :-1 :-2 等后缀表示取第几个ip

请求

```js
{
    "value": [
        "Socket",
        "X-Forwarded-For",
        "My-Header",
        "X-Forwarded-For:-1"
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "value": [
            "Socket",
            "X-Forwarded-For",
            "My-Header",
            "X-Forwarded-For:-1"
        ]
    },
    "msg": null
}
```

# /api/SystemLanguageAPI

## GET

### 权限
 - System Management

### - 获取语言设置



响应

```js
{
    "err": null,
    "data": {
        "value": "zh-Hans"
    },
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|value | 指定选项 | 必填 | False | 选项是: ['zh-Hans', 'en-us'] | 

### 权限
 - System Management

### - 设置语言



请求

```js
{
    "value": "zh-Hans"
}
```

响应

```js
{
    "err": null,
    "data": {
        "value": "zh-Hans"
    },
    "msg": null
}
```

# /api/MgtAPIListenConfigAPI

## GET

### 权限
 - System Management

### - 获取管理服务器端口和证书



响应

```js
{
    "err": null,
    "data": {
        "ssl_cert": 1,
        "ports": {
            "port": 9443,
            "ssl": true
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
|ports | 列表 | 必填 | False | [ -  详见下方表格](#axscnstmroueikfamlrfmtiqqxnpzxjm) | 
|ssl_cert | 整型数字 | 非必填/None | True |  -  | 

<a id="axscnstmroueikfamlrfmtiqqxnpzxjm">ports</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#uvistjcqwatnycdsdpbflvecpshtkrpx) | 

<a id="uvistjcqwatnycdsdpbflvecpshtkrpx">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|ssl | 布尔 | 必填 | False |  -  | 

### 权限
 - System Management

### - 设置管理服务器端口和证书



请求

```js
{
    "ports": [
        {
            "port": 9443,
            "ssl": true
        }
    ],
    "ssl_cert": 1
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

# /api/PartitionConfigAPI

## GET

### 权限
 - System Management

### - 获取归档配置列表



响应

```js
{
    "err": null,
    "data": [
        {
            "id": 1,
            "logs": [
                {
                    "id": 39,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "metrics_requestlogdetail_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 18,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "metrics_requestlogdetail_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 1,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "metrics_requestlogdetail_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "metrics.requestlogdetail",
            "period": "Month",
            "interval": 6,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 2,
            "logs": [
                {
                    "id": 40,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "metrics_requestlogbasic_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 19,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "metrics_requestlogbasic_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 2,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "metrics_requestlogbasic_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "metrics.requestlogbasic",
            "period": "Month",
            "interval": 6,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 3,
            "logs": [
                {
                    "id": 41,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "metrics_requestnumbertrend_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 20,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "metrics_requestnumbertrend_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 3,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "metrics_requestnumbertrend_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "metrics.requestnumbertrend",
            "period": "Month",
            "interval": null,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 4,
            "logs": [
                {
                    "id": 42,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "metrics_requestlogoverviewsnapshot_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 21,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "metrics_requestlogoverviewsnapshot_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 4,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "metrics_requestlogoverviewsnapshot_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": false,
                    "detach_time": null
                }
            ],
            "model_label": "metrics.requestlogoverviewsnapshot",
            "period": "Month",
            "interval": 1,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 5,
            "logs": [
                {
                    "id": 43,
                    "pg_total_relation_size": 24576,
                    "count": 0,
                    "table_name": "management_auditlog_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 22,
                    "pg_total_relation_size": 24576,
                    "count": 0,
                    "table_name": "management_auditlog_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 5,
                    "pg_total_relation_size": 24576,
                    "count": 0,
                    "table_name": "management_auditlog_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "management.auditlog",
            "period": "Month",
            "interval": 3,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 6,
            "logs": [
                {
                    "id": 54,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "management_schedulerlog_2018-12-10_2018-12-17",
                    "start": "1544371200",
                    "end": "1544976000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 52,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "management_schedulerlog_2018-12-03_2018-12-10",
                    "start": "1543766400",
                    "end": "1544371200",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "management.schedulerlog",
            "period": "Week",
            "interval": 1,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 7,
            "logs": [
                {
                    "id": 44,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclruleexecutionlog_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 23,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclruleexecutionlog_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 7,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclruleexecutionlog_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": false,
                    "detach_time": null
                }
            ],
            "model_label": "acl.aclruleexecutionlog",
            "period": "Month",
            "interval": 1,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 8,
            "logs": [
                {
                    "id": 45,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipdata_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 24,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipdata_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 8,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipdata_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "acl.aclipdata",
            "period": "Month",
            "interval": 3,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 9,
            "logs": [
                {
                    "id": 46,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessiondata_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 25,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessiondata_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 9,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessiondata_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "acl.aclsessiondata",
            "period": "Month",
            "interval": 3,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 10,
            "logs": [
                {
                    "id": 47,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipwebsitedata_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 26,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipwebsitedata_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 10,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipwebsitedata_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "acl.aclipwebsitedata",
            "period": "Month",
            "interval": 3,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 11,
            "logs": [
                {
                    "id": 48,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessionwebsitedata_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 27,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessionwebsitedata_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 11,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessionwebsitedata_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "acl.aclsessionwebsitedata",
            "period": "Month",
            "interval": 3,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 12,
            "logs": [
                {
                    "id": 49,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipurldata_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 28,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipurldata_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 12,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclipurldata_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "acl.aclipurldata",
            "period": "Month",
            "interval": 3,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 13,
            "logs": [
                {
                    "id": 50,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessionurldata_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 29,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessionurldata_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 13,
                    "pg_total_relation_size": 8192,
                    "count": 0,
                    "table_name": "acl_aclsessionurldata_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "acl.aclsessionurldata",
            "period": "Month",
            "interval": 3,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 14,
            "logs": [
                {
                    "id": 55,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-12-10_2018-12-17",
                    "start": "1544371200",
                    "end": "1544976000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 53,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-12-03_2018-12-10",
                    "start": "1543766400",
                    "end": "1544371200",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 38,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-11-26_2018-12-03",
                    "start": "1543161600",
                    "end": "1543766400",
                    "is_attached": false,
                    "detach_time": null
                },
                {
                    "id": 36,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-11-19_2018-11-26",
                    "start": "1542556800",
                    "end": "1543161600",
                    "is_attached": false,
                    "detach_time": null
                },
                {
                    "id": 34,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-11-12_2018-11-19",
                    "start": "1541952000",
                    "end": "1542556800",
                    "is_attached": false,
                    "detach_time": null
                },
                {
                    "id": 32,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-11-05_2018-11-12",
                    "start": "1541347200",
                    "end": "1541952000",
                    "is_attached": false,
                    "detach_time": null
                },
                {
                    "id": 17,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-10-29_2018-11-05",
                    "start": "1540742400",
                    "end": "1541347200",
                    "is_attached": false,
                    "detach_time": null
                },
                {
                    "id": 14,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "mario_pluginlog_2018-10-22_2018-10-29",
                    "start": "1540137600",
                    "end": "1540742400",
                    "is_attached": false,
                    "detach_time": null
                }
            ],
            "model_label": "mario.pluginlog",
            "period": "Week",
            "interval": 1,
            "attach_tablespace": null,
            "detach_tablespace": null
        },
        {
            "id": 15,
            "logs": [
                {
                    "id": 51,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "node_nodemonitordata_2018-12-01_2019-01-01",
                    "start": "1543593600",
                    "end": "1546272000",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 30,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "node_nodemonitordata_2018-11-01_2018-12-01",
                    "start": "1541001600",
                    "end": "1543593600",
                    "is_attached": true,
                    "detach_time": null
                },
                {
                    "id": 15,
                    "pg_total_relation_size": 16384,
                    "count": 0,
                    "table_name": "node_nodemonitordata_2018-10-01_2018-11-01",
                    "start": "1538323200",
                    "end": "1541001600",
                    "is_attached": true,
                    "detach_time": null
                }
            ],
            "model_label": "node.nodemonitordata",
            "period": "Month",
            "interval": null,
            "attach_tablespace": null,
            "detach_tablespace": null
        }
    ],
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|period | 指定选项 | 必填 | False | 选项是: ['Day', 'Month', 'Week'] | 
|interval | 整型数字 | 必填 | False | 最小值: 1;  | 
|attach_tablespace | 字符串 | 非必填/无默认值 | False |  -  | 
|detach_tablespace | 字符串 | 非必填/无默认值 | False |  -  | 

### 权限
 - System Management

### - 编辑归档设置



请求

```js
{
    "id": 14,
    "period": "Week",
    "interval": 10
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 14,
        "logs": [
            {
                "id": 55,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-12-10_2018-12-17",
                "start": "1544371200",
                "end": "1544976000",
                "is_attached": true,
                "detach_time": null
            },
            {
                "id": 53,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-12-03_2018-12-10",
                "start": "1543766400",
                "end": "1544371200",
                "is_attached": true,
                "detach_time": null
            },
            {
                "id": 38,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-11-26_2018-12-03",
                "start": "1543161600",
                "end": "1543766400",
                "is_attached": false,
                "detach_time": null
            },
            {
                "id": 36,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-11-19_2018-11-26",
                "start": "1542556800",
                "end": "1543161600",
                "is_attached": false,
                "detach_time": null
            },
            {
                "id": 34,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-11-12_2018-11-19",
                "start": "1541952000",
                "end": "1542556800",
                "is_attached": false,
                "detach_time": null
            },
            {
                "id": 32,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-11-05_2018-11-12",
                "start": "1541347200",
                "end": "1541952000",
                "is_attached": false,
                "detach_time": null
            },
            {
                "id": 17,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-10-29_2018-11-05",
                "start": "1540742400",
                "end": "1541347200",
                "is_attached": false,
                "detach_time": null
            },
            {
                "id": 14,
                "pg_total_relation_size": 16384,
                "count": 0,
                "table_name": "mario_pluginlog_2018-10-22_2018-10-29",
                "start": "1540137600",
                "end": "1540742400",
                "is_attached": false,
                "detach_time": null
            }
        ],
        "model_label": "mario.pluginlog",
        "period": "Week",
        "interval": 10,
        "attach_tablespace": null,
        "detach_tablespace": null
    },
    "msg": null
}
```

# /api/DownloadPartitionLogAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#zlprbzlgyycoadycouwvupqckjenmtcr) | 

<a id="zlprbzlgyycoadycouwvupqckjenmtcr">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - System Management

### - 下载归档



请求

```js
{
    "id__in": [
        1
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

# /api/PartitionTablespaceAPI

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|tablespace | 字符串 | 必填 | False |  -  | 

### 权限
 - System Management

### - 修改数据表的 tablespace



请求

```js
{
    "id": 1,
    "tablespace": "pg_default"
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

# /api/UploadSystemUpgradePackageAPI

## POST

### 权限
 - System Management

### - 上传 upd 文件，获取 meta 信息



请求

```js
{
    "file": "<文件上传>"
}
```

响应

```js
{
    "err": null,
    "data": {
        "token": "26e935ee27cbf07a310611226e96e321:1gWcWd:RhIWHvIYRQnmRpv3bml9eCKsyo4",
        "meta": [
            {
                "type": "detector",
                "version": "4.0.0-fe8ceaa9",
                "changelog": ""
            }
        ]
    },
    "msg": null
}
```

# /api/SystemUpgradeAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|token | 字符串 | 必填 | False |  -  | 

### 权限
 - Minion

### - minion 获取更新包



请求

```js
{
    "token": "2d8b9e26ccbfbb029dae2ee6fbbccae4:1gWcWd:M6NHe0lwXXrfXvGO35PQC1lDGoY"
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

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|token | 字符串 | 必填 | False |  -  | 

### 权限
 - System Management

### - 确认升级



请求

```js
{
    "token": "9e47300ae430ec4f1f9030dce07e60f1:1gWcWc:0YANQFNSSBEtk9_VQ_9FwRjPM7M"
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

# /api/ConfigBackupAPI

## GET

### 权限
 - System Management

### - 获取备份列表



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 4,
            "state": "Done",
            "create_time": "1544513523",
            "message_id": "",
            "end_time": null,
            "comment": "导出测试",
            "options": [
                "Alarm Subscription",
                "Mario Plugin",
                "Report Subscription",
                "SMTP Config",
                "Syslog Template",
                "Alarm Threshold",
                "User"
            ]
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
|options | 指定选项 | 必填 | False | 选项是: ['Alarm Subscription', 'Mario Plugin', 'SMTP Config', 'Report Subscription', 'Syslog Template', 'Alarm Threshold', 'User'] | 
|comment | 字符串 | 非必填/'' | False | 最小长度: 0；  | 
|sync | 布尔 | 非必填/False | False |  -  | 

### 权限
 - System Management

### - 创建备份



请求

```js
{
    "options": [
        "Alarm Subscription",
        "Mario Plugin",
        "SMTP Config",
        "Report Subscription",
        "Syslog Template",
        "Alarm Threshold",
        "User"
    ],
    "comment": "导出测试",
    "sync": true
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 2,
        "state": "Pending",
        "create_time": "1544513522",
        "message_id": "",
        "end_time": null,
        "comment": "导出测试",
        "options": [
            "Alarm Subscription",
            "Mario Plugin",
            "Report Subscription",
            "SMTP Config",
            "Syslog Template",
            "Alarm Threshold",
            "User"
        ]
    },
    "msg": null
}
```

# /api/DownloadConfigBackupAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#nkbzqfqrkxlclnvvuldkxkkzptrdqbzt) | 

<a id="nkbzqfqrkxlclnvvuldkxkkzptrdqbzt">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - System Management

### - 下载配置备份



请求

```js
{
    "id__in": [
        3
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

# /api/ConfigImportFromFileAPI

## POST

### 权限
 - System Management

### - 上传备份文件读取备份信息



请求

```js
{
    "file": "<文件上传>",
    "action": "read",
    "options": [
        "Alarm Subscription"
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "meta": {
            "comment": "导出测试",
            "options": [
                "Alarm Subscription",
                "Mario Plugin",
                "Report Subscription",
                "SMTP Config",
                "Syslog Template",
                "Alarm Threshold",
                "User"
            ],
            "version": 1538038361,
            "create_time": 1544513523
        }
    },
    "msg": null
}
```

### - 上传备份文件恢复数据



请求

```js
{
    "file": "<文件上传>",
    "action": "write",
    "options": [
        "Alarm Subscription"
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

### - 上传的文件的版本与当前不一致



请求

```js
{
    "file": "<文件上传>",
    "action": "write",
    "options": [
        "Alarm Subscription"
    ]
}
```

响应

```js
{
    "err": "error",
    "msg": "The imported file corresponds to a version 1538038351 earlier than the current version 1538038361"
}
```

# /api/ConfigImportOnlineAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|options | 指定选项 | 必填 | False | 选项是: ['Alarm Subscription', 'Mario Plugin', 'SMTP Config', 'Report Subscription', 'Syslog Template', 'Alarm Threshold', 'User'] | 

### 权限
 - System Management

### - 在线恢复备份



请求

```js
{
    "options": [
        "Alarm Subscription"
    ],
    "id": 7
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

### - 在线恢复的版本与当前不一致



请求

```js
{
    "id": 8,
    "options": [
        "Alarm Subscription"
    ]
}
```

响应

```js
{
    "err": "error",
    "msg": "The imported file corresponds to a version 1538038351 earlier than the current version 1538038361"
}
```

# /api/UploadLicenseAPI

## POST

?> 不需要登录

### - 读取 license 信息



请求

```js
{
    "action": "read",
    "file": "<文件上传>"
}
```

响应

```js
{
    "err": null,
    "data": {
        "client_id": "0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "client_name": "长亭科技测试",
        "license_id": "0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
        "not_valid_before": 1532674261,
        "not_valid_after": 1848034261,
        "max_minion_num": 1000,
        "initial_password": "admin"
    },
    "msg": null
}
```

### - 保存 license 文件



请求

```js
{
    "action": "write",
    "file": "<文件上传>"
}
```

响应

```js
{
    "err": null,
    "data": {
        "client_id": "0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "client_name": "长亭科技测试",
        "license_id": "0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
        "not_valid_before": 1532674261,
        "not_valid_after": 1848034261,
        "max_minion_num": 1000,
        "initial_password": "admin"
    },
    "msg": null
}
```

# /api/LicenseAPI

## GET



### - 查看已经上传的 license 信息



响应

```js
{
    "err": null,
    "data": {
        "client_id": "0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "client_name": "长亭科技测试",
        "license_id": "0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
        "not_valid_before": 1532674261,
        "not_valid_after": 1848034261,
        "max_minion_num": 1000
    },
    "msg": null
}
```

# /api/FlashMessageAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|timestamp | 浮点数字 | 必填 | False |  -  | 



### - 获取系统提醒信息

level取值为 `info` `warning` 和 `error`

请求

```js
{
    "timestamp": -8455486470,
    "timezone": 8
}
```

响应

```js
{
    "err": null,
    "data": [
        {
            "level": "warning",
            "title": "Warning",
            "msg": "Time is different between your computer and server, which may cause some issues. Server time is 2018-12-11 15:32:09 CST",
            "duration": 0
        }
    ],
    "msg": null
}
```

# /api/LDAPConfigAPI

## GET

### 权限
 - System Management

### - 获取 ldap 配置



响应

```js
{
    "err": null,
    "data": {
        "base_dn": "dc=example,dc=org",
        "bind_dn": "cn=admin,dc=example,dc=org",
        "ldap_uri": "ldap://foobar",
        "user_key": "cn"
    },
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|ldap_uri | 字符串 | 必填 | False |  -  | 
|bind_dn | 字符串 | 必填 | False |  -  | 
|bind_password | 字符串 | 非必填/'' | False |  -  | 
|base_dn | 字符串 | 必填 | False |  -  | 
|user_key | 字符串 | 必填 | False |  -  | 

### 权限
 - System Management

### - 编辑 ldap 配置



请求

```js
{
    "ldap_uri": "ldap://foobar",
    "bind_dn": "cn=admin,dc=example,dc=org",
    "bind_password": "foobar",
    "base_dn": "dc=example,dc=org",
    "user_key": "cn"
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

### - 已经配置过 bind_password 的情况下，编辑可以不再次输入密码



请求

```js
{
    "ldap_uri": "ldap://foobar",
    "bind_dn": "cn=admin,dc=example,dc=org",
    "base_dn": "dc=example,dc=org",
    "user_key": "cn"
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

# /api/SyslogTemplateAPI

## GET

### 权限
 - System Management

### - 获取 syslog 格式



响应

```js
{
    "err": null,
    "data": {
        "audit_log": {
            "type": "json"
        },
        "request_log": {
            "type": "json"
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
|audit_log | 字典 | - | - | [详见下方表格](#jnlzlvaczuwmjevvjafxgrrlpiqcjlpy) | 
|request_log | 字典 | - | - | [详见下方表格](#ycqayxquadrgavswzfctlyajfqrmqrab) | 

<a id="jnlzlvaczuwmjevvjafxgrrlpiqcjlpy">audit_log</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['json', 'custom_fmt'] | 
|fmt | 字符串 | 非必填/'' | False | 最小长度: 0；  | 


<a id="ycqayxquadrgavswzfctlyajfqrmqrab">request_log</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['json', 'custom_fmt'] | 
|fmt | 字符串 | 非必填/'' | False | 最小长度: 0；  | 

### 权限
 - System Management

### - 修改 syslog 格式

用户由 json 改为 自定义的时候，需要使用 `ServerControlledConfigAPI?type=default_audit_log_syslog_template` 作为默认值

请求

```js
{
    "audit_log": {
        "type": "custom_fmt",
        "fmt": "TYPE:$type CONTENT:\"$content\" USER:$user IP:$ip USER-AGENT:$user_agent"
    },
    "request_log": {
        "type": "json"
    }
}
```

响应

```js
{
    "err": null,
    "data": {
        "audit_log": {
            "type": "custom_fmt",
            "fmt": "TYPE:$type CONTENT:\"$content\" USER:$user IP:$ip USER-AGENT:$user_agent"
        },
        "request_log": {
            "type": "json",
            "fmt": ""
        }
    },
    "msg": null
}
```

# /api/TaskLogAPI

## GET



### - 查询 task log



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 4,
            "name": "task log name",
            "state": "Pending",
            "create_time": "1544513532",
            "message_id": "",
            "end_time": null,
            "data": {
                "msg": "",
                "file": ""
            },
            "user": 132
        }
    ],
    "msg": null
}
```

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#ofsxubfmlveheftyoijrsfullboxqrmy) | 

<a id="ofsxubfmlveheftyoijrsfullboxqrmy">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 



### - 取消任务



请求

```js
{
    "id__in": [
        2
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

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#yvoixbwyxfnxwdzfbhkaznzwczelmbve) | 

<a id="yvoixbwyxfnxwdzfbhkaznzwczelmbve">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 



### - 删除任务



请求

```js
{
    "id__in": [
        3
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

# /api/HARoleAPI

## GET

### 权限
 - Minion

### - 获取 mgt-api 的身份



响应

```js
{
    "err": null,
    "data": {
        "role": "slave"
    },
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['demote', 'promote'] | 

### 权限
 - Minion

### - 设置 mgt-api 的身份



请求

```js
{
    "action": "demote"
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

