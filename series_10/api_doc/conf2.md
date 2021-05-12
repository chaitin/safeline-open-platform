# /api/v1/conf2/cert/upload

## POST



### 上传证书和私钥



请求

```js
{
    "name": "test",
    "crt_file": "<文件上传>",
    "key_file": "<文件上传>"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 11,
        "name": "test",
        "create_time": 1545297413.716356,
        "sites": [],
        "cert_info": {
            "serial": "0x915173ceebcf4937",
            "issuer": "Example Intermediate CA",
            "not_valid_before": "2017-12-14",
            "not_valid_after": "2022-12-13",
            "domains": [
                "example.com",
                "www.example.com"
            ]
        }
    }
}
```

# /api/v1/conf2/cert

## GET



### 获取正在使用的证书



本 API 支持翻页参数

请求

```js
{
    "type": "in_use"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": 7,
            "name": "test",
            "create_time": 1545297413.174914,
            "sites": [
                {
                    "id": 29,
                    "hostname": "test.com"
                }
            ],
            "cert_info": {
                "issuer": "Example Intermediate CA",
                "serial": "0x915173ceebcf4937",
                "domains": [
                    "example.com",
                    "www.example.com"
                ],
                "not_valid_after": "2022-12-13",
                "not_valid_before": "2017-12-14"
            }
        }
    ]
}
```

### 获取证书列表



本 API 支持翻页参数

响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": 8,
            "name": "test",
            "create_time": 1545297413.325624,
            "sites": [],
            "cert_info": {
                "issuer": "Example Intermediate CA",
                "serial": "0x915173ceebcf4937",
                "domains": [
                    "example.com",
                    "www.example.com"
                ],
                "not_valid_after": "2022-12-13",
                "not_valid_before": "2017-12-14"
            }
        }
    ]
}
```

### 获取未使用的证书



本 API 支持翻页参数

请求

```js
{
    "type": "not_use"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": []
}
```

## DELETE

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|force | 布尔 | 非必填/False | False |  -  | 



### 删除证书



请求

```js
{
    "id": 5
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

### 证书绑定站点之后强制删除



请求

```js
{
    "id": 6,
    "force": true
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

### 证书绑定站点之后无法删除



请求

```js
{
    "id": 4
}
```

响应

```js
{
    "err": "delete-failed",
    "msg": "尚未解绑站点"
}
```

# /api/v1/conf2/backend

## GET



### 获取所有的后端



本 API 支持翻页参数

响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": 7,
            "name": "test",
            "create_time": 1545297405.827927,
            "protocol": "http",
            "hostname": "test.com",
            "port": 80,
            "sites": []
        }
    ]
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 
|hostname | 字符串 | 必填 | False |  -  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 



### 创建后端



请求

```js
{
    "name": "test",
    "protocol": "http",
    "hostname": "test.com",
    "port": 80
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 1,
        "name": "test",
        "create_time": 1545297405.220543,
        "protocol": "http",
        "hostname": "test.com",
        "port": 80,
        "sites": []
    }
}
```

## DELETE

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|force | 布尔 | 非必填/False | False |  -  | 



### 强制删除绑定了站点的后端



请求

```js
{
    "id": 6,
    "force": true
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

### 后端绑定站点后无法删除



请求

```js
{
    "id": 4
}
```

响应

```js
{
    "err": "delete-failed",
    "msg": "尚未解绑站点"
}
```

# /api/v1/conf2/listener

## GET



### 获取虚拟服务器列表



响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": 17,
            "name": "http://any.com:9999",
            "sites": [],
            "create_time": 1545297408.968464,
            "interface": "br0",
            "protocol": "http",
            "hostname": "any.com",
            "port": 9999,
            "operation_mode": "transparent_proxy",
            "is_disabled": false
        }
    ]
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|interface | 字符串 | 必填 | False |  -  | 
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 
|hostname | 字符串 | 必填 | False |  -  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 



### 创建虚拟服务器



请求

```js
{
    "name": "test",
    "interface": "interface1",
    "protocol": "http",
    "hostname": "1.2.3.4",
    "port": 9999
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 13,
        "name": "test",
        "sites": [
            {
                "id": 25,
                "create_time": 1545297408.345035,
                "cert": null,
                "backends": [],
                "listener_id": 13,
                "url_prefixes": [
                    {
                        "id": 9,
                        "is_default": true,
                        "create_time": 1545297408.349041,
                        "last_update_time": 1545297408.349064,
                        "session_method": [],
                        "url_prefix": "/",
                        "site": 25,
                        "policy_group": 1
                    }
                ],
                "forbidden_page": false,
                "health_check_options": {
                    "id": 25,
                    "is_enabled": false,
                    "check_type": "http",
                    "interval": 30000,
                    "fall": 5,
                    "rise": 2,
                    "timeout": 1000,
                    "port": 0,
                    "http_send": "GET / HTTP/1.0\r\nUser-Agent: SafeLine Health Check\r\n\r\n",
                    "check_http_expect_alive": [
                        "http_2xx",
                        "http_3xx",
                        "http_4xx",
                        "http_5xx"
                    ]
                },
                "status": "UNKNOWN",
                "is_default": true,
                "hostname": "*",
                "proxy_headers": {
                    "x_real_ip": false,
                    "x_forwarded_port": false,
                    "x_forwarded_proto": false
                },
                "x_forwarded_for_option": "append",
                "is_disabled": false,
                "forbidden_page_status_code": 403,
                "load_balance_policy": "round_bin",
                "keepalive": 0,
                "ssl_protocols": [],
                "ssl_ciphers": "",
                "proxy_ssl_protocols": [],
                "proxy_ssl_ciphers": ""
            }
        ],
        "create_time": 1545297408.343551,
        "interface": "interface1",
        "protocol": "http",
        "hostname": "1.2.3.4",
        "port": 9999,
        "operation_mode": "transparent_proxy",
        "is_disabled": false
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|interface | 字符串 | 必填 | False |  -  | 
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 
|hostname | 字符串 | 必填 | False |  -  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|id | 整型数字 | 必填 | False |  -  | 
|is_disabled | 布尔 | 非必填/False | False |  -  | 



### 修改虚拟服务器



请求

```js
{
    "id": 19,
    "name": "",
    "interface": "interface2",
    "protocol": "https",
    "hostname": "2.3.4.5",
    "port": 9998
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 19,
        "name": "https://2.3.4.5:9998",
        "sites": [],
        "create_time": 1545297409.20628,
        "interface": "interface2",
        "protocol": "https",
        "hostname": "2.3.4.5",
        "port": 9998,
        "operation_mode": "transparent_proxy",
        "is_disabled": false
    }
}
```

# /api/v1/conf2/site

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | IP 或域名或者泛域名;  | 
|listener_id | 整型数字 | 必填 | False |  -  | 
|cert_id | 整型数字 | 非必填/无默认值 | True |  -  | 



### 创建站点



请求

```js
{
    "hostname": "test.com",
    "listener_id": 22
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 35,
        "create_time": 1545297414.210361,
        "cert": null,
        "backends": [],
        "listener_id": 22,
        "url_prefixes": [
            {
                "id": 11,
                "is_default": true,
                "create_time": 1545297414.21399,
                "last_update_time": 1545297414.214013,
                "session_method": [],
                "url_prefix": "/",
                "site": 35,
                "policy_group": 1
            }
        ],
        "forbidden_page": false,
        "health_check_options": {
            "id": 35,
            "is_enabled": false,
            "check_type": "http",
            "interval": 30000,
            "fall": 5,
            "rise": 2,
            "timeout": 1000,
            "port": 0,
            "http_send": "GET / HTTP/1.0\r\nUser-Agent: SafeLine Health Check\r\n\r\n",
            "check_http_expect_alive": [
                "http_2xx",
                "http_3xx",
                "http_4xx",
                "http_5xx"
            ]
        },
        "status": "UNKNOWN",
        "is_default": false,
        "hostname": "test.com",
        "proxy_headers": {
            "x_forwarded_port": false,
            "x_forwarded_proto": false,
            "x_real_ip": false
        },
        "x_forwarded_for_option": "append",
        "is_disabled": false,
        "forbidden_page_status_code": 403,
        "load_balance_policy": "round_bin",
        "keepalive": 0,
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "proxy_ssl_protocols": [],
        "proxy_ssl_ciphers": ""
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|hostname | 字符串 | 必填 | False | IP 或域名或者泛域名;  | 
|cert_id | 整型数字 | 非必填/无默认值 | True |  -  | 
|is_disabled | 布尔 | 非必填/False | False |  -  | 
|load_balance_policy | 指定选项 | 非必填/无默认值 | False | 选项是: ['round_bin', 'least_conn', 'ip_hash'] | 
|keepalive | 整型数字 | 非必填/无默认值 | False | 最小值: 0;  | 
|forbidden_page_status_code | 整型数字 | 非必填/无默认值 | False | 最小值: 100; 最大值: 999 | 
|ssl_protocols | 列表 | 非必填/无默认值 | False |  - 详见下方表格 | 
|ssl_ciphers | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|proxy_ssl_protocols | 列表 | 非必填/无默认值 | False |  - 详见下方表格 | 
|proxy_ssl_ciphers | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|x_forwarded_for_option | 指定选项 | 非必填/无默认值 | False | 选项是: ['trust', 'cover', 'append'] | 

ssl_protocols

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 指定选项 | 必填 | False | 选项是: ['SSLv2', 'SSLv3', 'TLSv1', 'TLSv1.1', 'TLSv1.2'] | 


proxy_ssl_protocols

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 指定选项 | 必填 | False | 选项是: ['SSLv2', 'SSLv3', 'TLSv1', 'TLSv1.1', 'TLSv1.2'] | 



### 编辑默认站点



请求

```js
{
    "hostname": "*",
    "id": 40,
    "load_balance_policy": "ip_hash",
    "keepalive": 32
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 40,
        "create_time": 1545297414.638894,
        "cert": null,
        "backends": [],
        "listener_id": 25,
        "url_prefixes": [],
        "forbidden_page": false,
        "health_check_options": {
            "id": 40,
            "is_enabled": false,
            "check_type": "http",
            "interval": 30000,
            "fall": 5,
            "rise": 2,
            "timeout": 1000,
            "port": 0,
            "http_send": "GET / HTTP/1.0\r\nUser-Agent: SafeLine Health Check\r\n\r\n",
            "check_http_expect_alive": [
                "http_2xx",
                "http_3xx",
                "http_4xx",
                "http_5xx"
            ]
        },
        "status": "UNKNOWN",
        "is_default": true,
        "hostname": "*",
        "proxy_headers": {
            "x_real_ip": false,
            "x_forwarded_port": false,
            "x_forwarded_proto": false
        },
        "x_forwarded_for_option": "append",
        "is_disabled": false,
        "forbidden_page_status_code": 403,
        "load_balance_policy": "ip_hash",
        "keepalive": 32,
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "proxy_ssl_protocols": [],
        "proxy_ssl_ciphers": ""
    }
}
```

### 编辑站点



请求

```js
{
    "hostname": "new.com",
    "id": 46,
    "load_balance_policy": "ip_hash",
    "keepalive": 32
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 46,
        "create_time": 1545297415.138766,
        "cert": null,
        "backends": [],
        "listener_id": 29,
        "url_prefixes": [
            {
                "id": 14,
                "is_default": true,
                "create_time": 1545297415.142317,
                "last_update_time": 1545297415.142336,
                "session_method": [],
                "url_prefix": "/",
                "site": 46,
                "policy_group": 1
            }
        ],
        "forbidden_page": false,
        "health_check_options": {
            "id": 46,
            "is_enabled": false,
            "check_type": "http",
            "interval": 30000,
            "fall": 5,
            "rise": 2,
            "timeout": 1000,
            "port": 0,
            "http_send": "GET / HTTP/1.0\r\nUser-Agent: SafeLine Health Check\r\n\r\n",
            "check_http_expect_alive": [
                "http_2xx",
                "http_3xx",
                "http_4xx",
                "http_5xx"
            ]
        },
        "status": "UNKNOWN",
        "is_default": false,
        "hostname": "new.com",
        "proxy_headers": {
            "x_real_ip": false,
            "x_forwarded_port": false,
            "x_forwarded_proto": false
        },
        "x_forwarded_for_option": "append",
        "is_disabled": false,
        "forbidden_page_status_code": 403,
        "load_balance_policy": "ip_hash",
        "keepalive": 32,
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "proxy_ssl_protocols": [],
        "proxy_ssl_ciphers": ""
    }
}
```

# /api/v1/conf2/site?not_check_cert=true

## POST



### 跳过证书检查创建 https 站点



请求

```js
{
    "hostname": "test.com",
    "listener_id": 21
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 33,
        "create_time": 1545297414.024223,
        "cert": null,
        "backends": [],
        "listener_id": 21,
        "url_prefixes": [
            {
                "id": 10,
                "is_default": true,
                "create_time": 1545297414.027957,
                "last_update_time": 1545297414.027977,
                "session_method": [],
                "url_prefix": "/",
                "site": 33,
                "policy_group": 1
            }
        ],
        "forbidden_page": false,
        "health_check_options": {
            "id": 33,
            "is_enabled": false,
            "check_type": "http",
            "interval": 30000,
            "fall": 5,
            "rise": 2,
            "timeout": 1000,
            "port": 0,
            "http_send": "GET / HTTP/1.0\r\nUser-Agent: SafeLine Health Check\r\n\r\n",
            "check_http_expect_alive": [
                "http_2xx",
                "http_3xx",
                "http_4xx",
                "http_5xx"
            ]
        },
        "status": "UNKNOWN",
        "is_default": false,
        "hostname": "test.com",
        "proxy_headers": {
            "x_forwarded_port": false,
            "x_forwarded_proto": false,
            "x_real_ip": false
        },
        "x_forwarded_for_option": "append",
        "is_disabled": false,
        "forbidden_page_status_code": 403,
        "load_balance_policy": "round_bin",
        "keepalive": 0,
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "proxy_ssl_protocols": [],
        "proxy_ssl_ciphers": ""
    }
}
```

# /api/v1/conf2/site_backend

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|site_id | 整型数字 | 必填 | False |  -  | 
|backend_id | 整型数字 | 必填 | False |  -  | 
|weight | 整型数字 | 必填 | False | 最小值: 1;  | 
|is_backup | 布尔 | 非必填/False | False |  -  | 



### 给站点绑定后端



请求

```js
{
    "site_id": 4,
    "backend_id": 8,
    "weight": 1,
    "is_backup": false
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 8,
        "name": "test",
        "create_time": 1545297405.955395,
        "protocol": "http",
        "hostname": "1.2.3.4",
        "port": 80,
        "sites": [
            {
                "id": 4,
                "hostname": "test"
            }
        ]
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|site_id | 整型数字 | 必填 | False |  -  | 
|backend_id | 整型数字 | 必填 | False |  -  | 
|weight | 整型数字 | 必填 | False | 最小值: 1;  | 
|is_backup | 布尔 | 非必填/False | False |  -  | 



### 修改站点下后端的权重和backup属性



请求

```js
{
    "site_id": 12,
    "backend_id": 13,
    "weight": 1234,
    "is_backup": true
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

## DELETE

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|site_id | 整型数字 | 必填 | False |  -  | 
|backend_id | 整型数字 | 必填 | False |  -  | 



### 删除站点绑定的后端



请求

```js
{
    "site_id": 6,
    "backend_id": 9
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

# /api/v1/conf2/site_proxy_header

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|site_id | 整型数字 | 必填 | False |  -  | 
|x_forwarded_port | 布尔 | 非必填/无默认值 | False |  -  | 
|x_forwarded_proto | 布尔 | 非必填/无默认值 | False |  -  | 
|x_real_ip | 布尔 | 非必填/无默认值 | False |  -  | 



### 修改站点 HTTP 头设置



请求

```js
{
    "site_id": 53,
    "x_forwarded_port": true
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "x_real_ip": false,
        "x_forwarded_port": true,
        "x_forwarded_proto": false
    }
}
```

# /api/v1/conf2/site/url_prefix

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|session_method_type | 指定选项 | 非必填/无默认值 | False | 选项是: ['re', 'cookie', 'url_query', 'body_form', 'header', 'safeline_session'] | 
|session_method_param | 字符串 | 非必填/无默认值 | False |  -  | 
|session_method_pattern | 字符串 | 非必填/无默认值 | False |  -  | 
|url_prefix | 字符串 | 必填 | False | 最大长度: 128;  | 
|policy_group | 整型数字 | 必填 | False |  -  | 
|site_id | 整型数字 | 必填 | False |  -  | 



### 创建站点 url 前缀



请求

```js
{
    "url_prefix": "/",
    "site_id": 54,
    "policy_group": 1
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 17,
        "is_default": true,
        "create_time": 1545297415.986474,
        "last_update_time": 1545297415.986499,
        "session_method": [],
        "url_prefix": "/",
        "site": 54,
        "policy_group": 1
    }
}
```

### 合并 session 配置创建 url 前缀(session 正则类型，session_method==re)



请求

```js
{
    "url_prefix": "/",
    "site_id": 56,
    "policy_group": 1,
    "session_method_type": "re",
    "session_method_param": "header:xx-header",
    "session_method_pattern": ".*JSESSIONID=(?P<session>[0-9a-zA-Z]+).*"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 18,
        "is_default": true,
        "create_time": 1545297416.309722,
        "last_update_time": 1545297416.309747,
        "session_method": {
            "type": "re",
            "param": [
                {
                    "target": "header:xx-header",
                    "pattern": ".*JSESSIONID=(?P<session>[0-9a-zA-Z]+).*"
                }
            ]
        },
        "url_prefix": "/",
        "site": 56,
        "policy_group": 1
    }
}
```

### 合并 session 配置创建 url 前缀(session kv类型,session_method=!=re)



请求

```js
{
    "url_prefix": "/",
    "site_id": 57,
    "policy_group": 1,
    "session_method_type": "cookie",
    "session_method_param": "sessionid"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 19,
        "is_default": true,
        "create_time": 1545297416.482873,
        "last_update_time": 1545297416.482897,
        "session_method": [
            {
                "type": "cookie",
                "param": "sessionid"
            }
        ],
        "url_prefix": "/",
        "site": 57,
        "policy_group": 1
    }
}
```

### 合并 sesson 创建配置 url 前缀(safeline session)



请求

```js
{
    "url_prefix": "/",
    "site_id": 58,
    "policy_group": 1,
    "session_method_type": "safeline_session"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 20,
        "is_default": true,
        "create_time": 1545297416.656447,
        "last_update_time": 1545297416.656471,
        "session_method": [
            {
                "type": "safeline_session"
            }
        ],
        "url_prefix": "/",
        "site": 58,
        "policy_group": 1
    }
}
```

### 合并 sesson 创建配置 url 前缀(不配置 session)



请求

```js
{
    "url_prefix": "/",
    "site_id": 59,
    "policy_group": 1
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 21,
        "is_default": true,
        "create_time": 1545297416.826615,
        "last_update_time": 1545297416.826639,
        "session_method": [],
        "url_prefix": "/",
        "site": 59,
        "policy_group": 1
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|session_method_type | 指定选项 | 非必填/无默认值 | False | 选项是: ['re', 'cookie', 'url_query', 'body_form', 'header', 'safeline_session'] | 
|session_method_param | 字符串 | 非必填/无默认值 | False |  -  | 
|session_method_pattern | 字符串 | 非必填/无默认值 | False |  -  | 
|url_prefix | 字符串 | 必填 | False | 最大长度: 128;  | 
|policy_group | 整型数字 | 必填 | False |  -  | 
|id | 整型数字 | 必填 | False |  -  | 



### 修改站点 url 前缀



请求

```js
{
    "id": 26,
    "url_prefix": "/test",
    "policy_group": 1,
    "session_method_type": "re",
    "session_method_param": "header:xx-header",
    "session_method_pattern": ".*JSESSIONID=(?P<session>[0-9a-zA-Z]+).*"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 26,
        "is_default": false,
        "create_time": 1545297417.605367,
        "last_update_time": 1545297417.659413,
        "session_method": {
            "type": "re",
            "param": [
                {
                    "target": "header:xx-header",
                    "pattern": ".*JSESSIONID=(?P<session>[0-9a-zA-Z]+).*"
                }
            ]
        },
        "url_prefix": "/test",
        "site": 63,
        "policy_group": 1
    }
}
```

# /api/v1/conf2/policy/group

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False |  -  | 



### 创建策略组



请求

```js
{
    "name": "p1"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 7,
        "create_time": 1545297409.544726,
        "is_timeout_enabled": true,
        "name": "p1",
        "is_default": false,
        "modules_switch": "enabled",
        "detect_response_switch": "enabled",
        "emergencies_state": "enabled",
        "policies_state": "enabled",
        "modules_state": {
            "m_sqli": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "detect_non_injection_sql": true
                }
            },
            "m_xss": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "detect_complete_html": true
                }
            },
            "m_rule": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "info_leak_types": [
                        "test file",
                        "backup file",
                        "code repository",
                        "server sensitive file"
                    ],
                    "check_info_leak_by_rsp": false
                }
            },
            "m_csrf": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {}
            },
            "m_ssrf": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {}
            },
            "m_php_unserialize": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {}
            },
            "m_java_unserialize": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {}
            },
            "m_file_upload": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {}
            },
            "m_file_include": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {}
            },
            "m_php_code_injection": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "detect_upload_file": true
                }
            },
            "m_java": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "detect_upload_file": true
                }
            },
            "m_cmd_injection": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {}
            },
            "m_response": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "error_types": [
                        "directory indexing",
                        "SQL execution error",
                        "server exception"
                    ]
                }
            },
            "m_scanner": {
                "state": "enabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "robot_types": [
                        "scanner"
                    ]
                }
            }
        },
        "cc_state": "enabled",
        "misc_detect_config": {
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
        },
        "detection_timeout_threshold": 1000
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|name | 字符串 | 非必填/无默认值 | False |  -  | 
|modules_switch | 指定选项 | 非必填/'enabled' | False | 选项是: ['enabled', 'disabled'] | 
|detect_response_switch | 指定选项 | 非必填/'enabled' | False | 选项是: ['enabled', 'disabled'] | 
|modules_state | 字典类型 | - | - | 字典类型 | 
|policies_state | 指定选项 | 非必填/'enabled' | False | 选项是: ['enabled', 'disabled'] | 
|misc_detect_config | 字典类型 | - | - | 字典类型 | 
|is_timeout_enabled | 布尔 | 必填 | False |  -  | 
|detection_timeout_threshold | 整型数字 | 必填 | False | 最小值: 0; 最大值: 1000000 | 

modules_state

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|state | 指定选项 | 必填 | False | 选项是: ['enabled', 'disabled', 'dry_run'] | 
|high_risk_action | 指定选项 | 必填 | False | 选项是: ['deny', 'continue'] | 
|high_risk_enable_log | 指定选项 | 必填 | False | 选项是: [0, 1] | 
|medium_risk_action | 指定选项 | 必填 | False | 选项是: ['deny', 'continue'] | 
|medium_risk_enable_log | 指定选项 | 必填 | False | 选项是: [0, 1] | 
|low_risk_action | 指定选项 | 必填 | False | 选项是: ['deny', 'continue'] | 
|low_risk_enable_log | 指定选项 | 必填 | False | 选项是: [0, 1] | 
|detect_config | 字典类型 | - | - | 字典类型 | 

detect_config

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|


misc_detect_config

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|



### 修改策略组



请求

```js
{
    "id": 9,
    "modules_state": {
        "m_xss": {
            "state": "disabled",
            "high_risk_action": "continue",
            "high_risk_enable_log": 1,
            "medium_risk_action": "continue",
            "medium_risk_enable_log": 1,
            "low_risk_action": "continue",
            "low_risk_enable_log": 1,
            "detect_config": {
                "detect_complete_html": true
            }
        }
    },
    "policies_state": "disabled",
    "misc_detect_config": {
        "decode": [
            "base64"
        ]
    },
    "is_timeout_enabled": true,
    "detection_timeout_threshold": 10,
    "log_detection_timeout_event": true
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 9,
        "create_time": 1545297409.983561,
        "is_timeout_enabled": true,
        "name": "p1",
        "is_default": false,
        "modules_switch": "enabled",
        "detect_response_switch": "enabled",
        "emergencies_state": "enabled",
        "policies_state": "disabled",
        "modules_state": {
            "m_xss": {
                "state": "disabled",
                "high_risk_action": "continue",
                "high_risk_enable_log": 1,
                "medium_risk_action": "continue",
                "medium_risk_enable_log": 1,
                "low_risk_action": "continue",
                "low_risk_enable_log": 1,
                "detect_config": {
                    "detect_complete_html": true
                }
            }
        },
        "cc_state": "enabled",
        "misc_detect_config": {
            "decode": [
                "base64"
            ]
        },
        "detection_timeout_threshold": 10
    }
}
```

## DELETE

数据格式

> 只需要传递 ID

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 



### 删除策略组



请求

```js
{
    "id": 8
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

# /api/v1/conf2/policy/rule

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|pattern | 字符串 | 必填 | False |  -  | 
|state | 指定选项 | 必填 | False | 选项是: ['enabled', 'disabled', 'dry_run'] | 
|action | 指定选项 | 必填 | False | 选项是: ['deny', 'allow'] | 
|comment | 字符串 | 必填 | False | 最大长度: 48;  | 
|enable_log | 布尔 | 必填 | False |  -  | 
|expire_time | 整型数字 | 必填 | False |  -  | 
|attack_type | 指定选项 | 必填 | False | 选项是: ['none', 'sql_injection', 'xss', 'csrf', 'ssrf', 'dos', 'backdoor', 'deserialization', 'code_execution', 'code_injection', 'command_injection', 'file_upload', 'file_inclusion', 'redirect', 'weak_permission', 'info_leak', 'unauthorized_access', 'unsafe_config', 'xxe', 'xpath_injection', 'ldap_injection', 'directory_traversal', 'scanner', 'permission_bypass', 'acl_bypass', 'file_write', 'file_download', 'file_deletion', 'logic_error', 'crlf_injection', 'ssti', 'click_hijacking', 'buffer_overflow', 'integer_overflow', 'format_string', 'race_condition', 'timeout', 'unknown'] | 
|id | 字符串 | 必填 | False |  -  | 



### 修改策略



请求

```js
{
    "action": "deny",
    "pattern": "{\"re\": {\"urlpath\": \"/test\"}}",
    "state": "enabled",
    "comment": "test",
    "enable_log": true,
    "expire_time": 0,
    "policy_group_id": -1,
    "attack_type": "none",
    "id": "35fc3d3a41484fca8a22fcbd6daf08d0"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": "35fc3d3a41484fca8a22fcbd6daf08d0",
        "create_time": 1545297411.305957,
        "last_update_time": 1545297411.357199,
        "expire_time": null,
        "attack_type": "none",
        "pattern": "{\"re\": {\"urlpath\": \"/test\"}}",
        "state": "enabled",
        "action": "deny",
        "comment": "test",
        "target": "logic_expr",
        "enable_log": true,
        "auto_generate": false,
        "is_deleted": false,
        "priority": 0,
        "policy_group": 15
    }
}
```

## DELETE

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 字符串 | 必填 | False |  -  | 



### 删除策略



请求

```js
{
    "id": "f2f19356f75848c794576f786fea1587"
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

# /api/v1/conf2/policy/rule_priority

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|policy_group_id | 整型数字 | 必填 | False |  -  | 
|rule_id_list | 列表 | 必填 | False |  - 详见下方表格 | 

rule_id_list

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 最大长度: 48;  | 



### 修改策略优先级



请求

```js
{
    "policy_group_id": 16,
    "rule_id_list": [
        "0c26a8ebf19b4dbdb0ad628b78daf124",
        "61eecdb33f0749419e6772d09d47a63a"
    ]
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

# /api/v1/conf2/fast_config/s10

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|sites | 字典列表 | - | - | 详见下面表格 | 

sites

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | IP 或域名或者泛域名;  | 
|cert_id | 整型数字 | 非必填/无默认值 | False |  -  | 
|backends | 字典列表 | - | - | 详见下面表格 | 

backends

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | IP 或域名或者泛域名;  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 



### S10 快速配置



请求

```js
[
    {
        "port": 443,
        "protocol": "https",
        "sites": [
            {
                "hostname": "*",
                "cert_id": 1,
                "backends": [
                    {
                        "hostname": "1.2.3.4",
                        "port": "1115",
                        "protocol": "http"
                    }
                ]
            },
            {
                "hostname": "abc.11",
                "cert_id": 1,
                "backends": [
                    {
                        "hostname": "1.2.3.4",
                        "port": "1116",
                        "protocol": "http"
                    },
                    {
                        "hostname": "1.2.3.4",
                        "port": "1117",
                        "protocol": "http"
                    }
                ]
            }
        ]
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

# /api/v1/conf2/fast_config/w10

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|mode | 指定选项 | 必填 | False | 选项是: ['reverse_proxy', 'transparent_proxy', 'route_proxy'] | 
|inet_mode | 指定选项 | 必填 | False | 选项是: ['dhcp', 'static'] | 
|interface | 字符串 | 必填 | False |  -  | 
|listeners | 字典列表 | - | - | 详见下面表格 | 

listeners

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|sites | 字典列表 | - | - | 详见下面表格 | 
|hostname | 字符串 | 必填 | False |  -  | 

sites

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | IP 或域名或者泛域名;  | 
|cert_id | 整型数字 | 非必填/无默认值 | False |  -  | 
|backends | 字典列表 | - | - | 详见下面表格 | 

backends

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | IP 或域名或者泛域名;  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 



### W10 快速配置



请求

```js
{
    "mode": "reverse_proxy",
    "inet_mode": "static",
    "address": "127.0.0.1",
    "gateway": "127.0.0.1",
    "netmask": "127.0.0.1",
    "interface": "bonding_0",
    "listeners": [
        {
            "hostname": "192.168.1.2",
            "port": 1221,
            "protocol": "http",
            "sites": [
                {
                    "hostname": "abc.def",
                    "backends": [
                        {
                            "hostname": "1.2.3.4",
                            "port": "1115",
                            "protocol": "http"
                        }
                    ]
                },
                {
                    "hostname": "abc.11",
                    "cert_id": 2,
                    "backends": [
                        {
                            "hostname": "1.2.3.4",
                            "port": "1116",
                            "protocol": "http"
                        },
                        {
                            "hostname": "1.2.3.4",
                            "port": "1117",
                            "protocol": "http"
                        }
                    ]
                }
            ]
        }
    ]
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

# /api/v1/conf2/health_check_options

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 
|is_enabled | 布尔 | 必填 | False |  -  | 
|check_http_expect_alive | 指定选项 | 必填 | False | 选项是: ['http_2xx', 'http_3xx', 'http_4xx', 'http_5xx'] | 
|check_type | 指定选项 | 非必填/'http' | False | 选项是: ['tcp', 'http'] | 
|interval | 整型数字 | 非必填/30000 | False |  -  | 
|fall | 整型数字 | 非必填/5 | False |  -  | 
|rise | 整型数字 | 非必填/2 | False |  -  | 
|timeout | 整型数字 | 非必填/1000 | False |  -  | 
|port | 整型数字 | 非必填/0 | False |  -  | 
|http_send | 字符串 | 非必填/'GET / HTTP/1.0\r\nUser-Agent: SafeLine Health Check\r\n\r\n' | False |  -  | 



### 编辑健康检查配置的完整API，暂时不会用到



请求

```js
{
    "id": 21,
    "is_enabled": true,
    "check_http_expect_alive": [
        "http_2xx",
        "http_3xx"
    ],
    "check_type": "http",
    "interval": 1000,
    "fall": 5,
    "rise": 2,
    "timeout": 3000,
    "port": 9443,
    "http_send": "GET /hc HTTP/1.1\r\n\r\n"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 21,
        "is_enabled": true,
        "check_type": "http",
        "interval": 1000,
        "fall": 5,
        "rise": 2,
        "timeout": 3000,
        "port": 9443,
        "http_send": "GET /hc HTTP/1.1",
        "check_http_expect_alive": [
            "http_3xx",
            "http_2xx"
        ]
    }
}
```

### 简化版编辑健康检查配置



请求

```js
{
    "id": 23,
    "is_enabled": true,
    "check_http_expect_alive": [
        "http_2xx",
        "http_3xx"
    ]
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 23,
        "is_enabled": true,
        "check_type": "http",
        "interval": 30000,
        "fall": 5,
        "rise": 2,
        "timeout": 1000,
        "port": 0,
        "http_send": "GET / HTTP/1.0\r\nUser-Agent: SafeLine Health Check\r\n\r\n",
        "check_http_expect_alive": [
            "http_3xx",
            "http_2xx"
        ]
    }
}
```

# /api/v1/conf2/waf/detect_config

## GET



### 获取 detect_config



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "modules_detect_config": {
            "m_sqli": {
                "config": [
                    {
                        "type": "boolean",
                        "key": "detect_non_injection_sql",
                        "name": {
                            "cn": "检测非注入型攻击",
                            "en": "Detect non-injection type SQL"
                        },
                        "comment": "检测非注入型 SQL，如完整的 SQL 语句执行",
                        "default": true
                    }
                ],
                "name": {
                    "en": "m_sqli",
                    "cn": "SQL 注入检测模块"
                },
                "comment": ""
            },
            "m_xss": {
                "config": [
                    {
                        "type": "boolean",
                        "key": "detect_complete_html",
                        "name": {
                            "cn": "检测非注入型攻击",
                            "en": "Detect non-injection type XSS"
                        },
                        "comment": "检测非注入型 XSS，如完整的 HTML 文件",
                        "default": true
                    }
                ],
                "name": {
                    "en": "m_xss",
                    "cn": "XSS 检测模块"
                },
                "comment": ""
            },
            "m_rule": {
                "config": [
                    {
                        "type": "choices",
                        "key": "info_leak_types",
                        "name": {
                            "cn": "信息泄露需要检测的类型",
                            "en": "Info leak detect types"
                        },
                        "comment": "情报模块需要特殊检测的信息泄露类型",
                        "choices": [
                            {
                                "cn": "测试文件",
                                "en": "test file"
                            },
                            {
                                "cn": "备份文件",
                                "en": "backup file"
                            },
                            {
                                "cn": "代码仓库",
                                "en": "code repository"
                            },
                            {
                                "cn": "服务器敏感文件",
                                "en": "server sensitive file"
                            }
                        ],
                        "default": [
                            "test file",
                            "backup file",
                            "code repository",
                            "server sensitive file"
                        ]
                    },
                    {
                        "type": "boolean",
                        "key": "check_info_leak_by_rsp",
                        "name": {
                            "cn": "通过 response 检测信息泄露",
                            "en": "Check info leak by response"
                        },
                        "comment": "一定要结合 response  来判断信息泄露是否真的发生",
                        "default": false
                    }
                ],
                "name": {
                    "en": "m_rule",
                    "cn": "情报模块"
                },
                "comment": ""
            },
            "m_scanner": {
                "config": [
                    {
                        "type": "choices",
                        "key": "robot_types",
                        "name": {
                            "cn": "机器人类型",
                            "en": "Robot types"
                        },
                        "comment": "机器人检测模块需要检测的类型",
                        "choices": [
                            {
                                "cn": "扫描器检测",
                                "en": "scanner"
                            },
                            {
                                "cn": "爬虫检测",
                                "en": "spider"
                            }
                        ],
                        "default": [
                            "scanner"
                        ]
                    }
                ],
                "name": {
                    "en": "m_scanner",
                    "cn": "机器人检测模块"
                },
                "comment": ""
            },
            "m_php_code_injection": {
                "config": [
                    {
                        "type": "boolean",
                        "key": "detect_upload_file",
                        "name": {
                            "cn": "检测文件上传",
                            "en": "Detect uploading file"
                        },
                        "comment": "是否检测上传文件中的 php 代码注入",
                        "default": true
                    }
                ],
                "name": {
                    "en": "m_php_code_injection",
                    "cn": "PHP 代码注入检测模块"
                },
                "comment": ""
            },
            "m_java": {
                "config": [
                    {
                        "type": "boolean",
                        "key": "detect_upload_file",
                        "name": {
                            "cn": "检测文件上传",
                            "en": "Detect uploading file"
                        },
                        "comment": "是否检测上传文件中的 Java 代码注入",
                        "default": true
                    }
                ],
                "name": {
                    "en": "m_java",
                    "cn": "Java 代码注入检测模块"
                },
                "comment": ""
            },
            "m_response": {
                "config": [
                    {
                        "type": "choices",
                        "key": "error_types",
                        "name": {
                            "cn": "响应错误类型",
                            "en": "Server error types"
                        },
                        "comment": "检测哪些后端的错误类型",
                        "choices": [
                            {
                                "cn": "列目录",
                                "en": "directory indexing"
                            },
                            {
                                "cn": "SQL 报错",
                                "en": "SQL execution error"
                            },
                            {
                                "cn": "服务器异常",
                                "en": "server exception"
                            }
                        ],
                        "default": [
                            "directory indexing",
                            "SQL execution error",
                            "server exception"
                        ]
                    }
                ],
                "name": {
                    "en": "m_response",
                    "cn": "服务器响应检测模块"
                },
                "comment": ""
            }
        },
        "misc_detect_config": {
            "decode_config": {
                "config": [
                    {
                        "type": "choices",
                        "key": "decode_methods",
                        "name": {
                            "cn": "解码方式",
                            "en": "Decode methods"
                        },
                        "comment": "检测中可以使用的解码/解析方式",
                        "choices": [
                            {
                                "cn": "url 解码",
                                "en": "url decode"
                            },
                            {
                                "cn": "JSON 解析",
                                "en": "JSON"
                            },
                            {
                                "cn": "base64 解码",
                                "en": "base64"
                            },
                            {
                                "cn": "16进制转换",
                                "en": "hex"
                            },
                            {
                                "cn": "斜杠反转义",
                                "en": "eval"
                            },
                            {
                                "cn": "XML 解析",
                                "en": "XML"
                            },
                            {
                                "cn": "php序列化对象解析",
                                "en": "PHP deserialize"
                            },
                            {
                                "cn": "UTF-7 解码",
                                "en": "utf7"
                            }
                        ],
                        "default": [
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
                ],
                "name": {
                    "en": "decode",
                    "cn": "解码配置"
                },
                "comment": "引擎对数据的解码方法"
            }
        }
    }
}
```

