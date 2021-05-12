# /api/UploadSSLCertAPI

## POST

### 权限
 - Website And Security Policy Management
 - System Management

### - 上传证书和私钥

name 参数可选，如果不传，则会使用证书的域名拼接作为名字（可能会很长）
        id 参数可选，如果不传代表新建，否则为编辑这个id的证书

请求

```js
{
    "crt_file": "<文件上传>",
    "key_file": "<文件上传>"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 4,
        "websites": [],
        "create_time": "1544513555",
        "name": "example.com, www.example.com",
        "signature": "992316b5dac61ee0db87bdc93588e20d",
        "info": {
            "serial": "0x915173ceebcf4937",
            "issuer": "Example Intermediate CA",
            "not_valid_before": 1513209600.0,
            "not_valid_after": 1670889600.0,
            "domains": [
                "example.com",
                "www.example.com"
            ]
        }
    },
    "msg": null
}
```

### - 证书和私钥在一个文件中的上传



请求

```js
{
    "name": "test",
    "crt_file": "<文件上传>"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 5,
        "websites": [],
        "create_time": "1544513556",
        "name": "test",
        "signature": "992316b5dac61ee0db87bdc93588e20d",
        "info": {
            "serial": "0x915173ceebcf4937",
            "issuer": "Example Intermediate CA",
            "not_valid_before": 1513209600.0,
            "not_valid_after": 1670889600.0,
            "domains": [
                "example.com",
                "www.example.com"
            ]
        }
    },
    "msg": null
}
```

# /api/CertAPI

## GET

### 权限
 - Website And Security Policy Management
 - System Management

### - 获取证书列表



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 1,
            "websites": [],
            "create_time": "1534413446",
            "name": "SafeLine Management Server",
            "signature": "f311314ac3ac5a549d4ad90ee118b8d6",
            "info": {
                "issuer": "SafeLine Management Server",
                "serial": "0x146722b549635f721de593e4c461e6a8",
                "domains": [
                    "mgt-api",
                    "*.safeline"
                ],
                "not_valid_after": 1841097600.0,
                "not_valid_before": 1525737600.0
            }
        },
        {
            "id": 3,
            "websites": [],
            "create_time": "1544513555",
            "name": "example.com, www.example.com",
            "signature": "992316b5dac61ee0db87bdc93588e20d",
            "info": {
                "issuer": "Example Intermediate CA",
                "serial": "0x915173ceebcf4937",
                "domains": [
                    "example.com",
                    "www.example.com"
                ],
                "not_valid_after": 1670889600.0,
                "not_valid_before": 1513209600.0
            }
        }
    ],
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#sqfauhaaptochmbqdrigtcfihxisqwto) | 

<a id="sqfauhaaptochmbqdrigtcfihxisqwto">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除证书



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

# /api/SoftwareReverseProxyWebsiteAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#kflrupyshdzdaacdllqcyxgqmvgticjk) | 
|name | 字符串 | 非必填/无默认值 | False |  -  | 
|create_time__range | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#leosihwnvabmrdfwjpfrcebupieyzhmi) | 

<a id="kflrupyshdzdaacdllqcyxgqmvgticjk">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="leosihwnvabmrdfwjpfrcebupieyzhmi">create_time__range</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 

### 权限
 - Website And Security Policy Management

### - 编辑站点



请求

```js
{
    "id": 17
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 17,
        "ip": [
            "0.0.0.0",
            "::"
        ],
        "session_method": {
            "type": "off"
        },
        "policy_rules": [],
        "health_check_status": "",
        "operation_mode": "Software Reverse Proxy",
        "interface": "virtual",
        "ports": [
            {
                "ssl": false,
                "port": 80,
                "http2": false
            },
            {
                "ssl": true,
                "port": 443,
                "http2": false
            }
        ],
        "server_names": [
            "example.com"
        ],
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "name": "first website",
        "backend_config": {
            "type": "proxy",
            "servers": [
                {
                    "host": "foobar.com",
                    "port": 80,
                    "weight": 1,
                    "protocol": "http"
                }
            ],
            "header_config": [],
            "proxy_ssl_ciphers": "",
            "health_check_config": {
                "fall": 5,
                "port": 0,
                "rise": 2,
                "timeout": 1000,
                "interval": 30000,
                "http_send": "GET / HTTP/1.0\r\nUser-Agent: Health Check\r\n\r\n",
                "check_type": "http",
                "is_enabled": false,
                "check_http_expect_alive": [
                    "http_2xx",
                    "http_3xx",
                    "http_5xx",
                    "http_4xx"
                ]
            },
            "load_balance_policy": "Round Robin",
            "proxy_ssl_protocols": [],
            "x_forwarded_for_action": "append"
        },
        "create_time": "1544513562",
        "last_update_time": "1544513562",
        "is_enabled": true,
        "detector_ip_source": [
            "Socket"
        ],
        "access_log": {
            "is_enabled": true,
            "log_request_header": true,
            "log_response_header": false
        },
        "ssl_cert": 1,
        "policy_group": 1
    },
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False |  -  | 
|server_names | 列表 | 必填 | False | [ -  详见下方表格](#udirroqbobnbwxnvivoagfkorluznvdw) | 
|ports | 列表 | 必填 | False | [ -  详见下方表格](#ewbcuofcsrhveefyxizzkxbbajmpacue) | 
|ssl_cert | 整型数字 | 非必填/None | True |  -  | 
|backend_config | OneOf 类型 | - | - | [详见下方表格](#fxdvultlbjvghxfaacschexvryhyhdve) | 
|policy_group | 整型数字 | 必填 | True |  -  | 
|session_method | 字典 | - | - | [详见下方表格](#byuttycjpfmlcnhpeyryxwlfhxwlybis) | 

<a id="udirroqbobnbwxnvivoagfkorluznvdw">server_names</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | Nginx 的 server_name，可以是 IPv4、[IPv6]、域名或者泛域名;  | 


<a id="ewbcuofcsrhveefyxizzkxbbajmpacue">ports</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#yfufrlgqmwkfzuxbcnsrqdatdikceshw) | 

<a id="yfufrlgqmwkfzuxbcnsrqdatdikceshw">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|ssl | 布尔 | 必填 | False |  -  | 
|http2 | 布尔 | 必填 | False |  -  | 


<a id="fxdvultlbjvghxfaacschexvryhyhdve">1. backend_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#ryonnrhmrzhnjqysvfkjjjvgthmztlrk) | 

<a id="ryonnrhmrzhnjqysvfkjjjvgthmztlrk">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['proxy'] | 
|load_balance_policy | 指定选项 | 必填 | False | 选项是: ['Round Robin', 'Least Connected', 'IP Hash'] | 
|servers | 列表 | 必填 | False | [ -  详见下方表格](#crlbizzxnyvevtkmkvhxmwxpdmhzatrs) | 
|x_forwarded_for_action | 指定选项 | 必填 | False | 选项是: ['append', 'cover', 'no_action'] | 

<a id="crlbizzxnyvevtkmkvhxmwxpdmhzatrs">servers</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#pdowpkjdwmrjhkvoouhtaelsnzxpjjpi) | 

<a id="pdowpkjdwmrjhkvoouhtaelsnzxpjjpi">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|protocol | 指定选项 | 必填 | False | 选项是: ['https', 'http'] | 
|host | 字符串 | 必填 | False | IP 或者域名;  | 
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|weight | 整型数字 | 非必填/1 | False | 最小值: 1;  | 


<a id="fxdvultlbjvghxfaacschexvryhyhdve">2. backend_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#yzhttmlimzpxwzaonimuqdgxompwtgep) | 

<a id="yzhttmlimzpxwzaonimuqdgxompwtgep">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['response'] | 
|status_code | 指定选项 | 必填 | False | 选项是: [200, 400, 401, 402, 404, 405, 500, 503, 504] | 
|path | 字符串 | 必填 | False | 大小写字母和数字;  | 


<a id="fxdvultlbjvghxfaacschexvryhyhdve">3. backend_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#ovlydbccyyqfjwphnvyqajjkuoyqfnan) | 

<a id="ovlydbccyyqfjwphnvyqajjkuoyqfnan">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['redirect'] | 
|status_code | 指定选项 | 必填 | False | 选项是: [301, 302, 307] | 
|path | 字符串 | 必填 | False |  -  | 


<a id="byuttycjpfmlcnhpeyryxwlfhxwlybis">session_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['header', 'off', 'internal_session', 're', 'cookie', 'url_query', 'body_form'] | 
|param | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|pattern | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 

### 权限
 - Website And Security Policy Management

### - 创建后端服务器为反向代理模式的站点



请求

```js
{
    "name": "first website",
    "server_names": [
        "example.com"
    ],
    "ports": [
        {
            "port": 80,
            "ssl": false,
            "http2": false
        },
        {
            "port": 443,
            "ssl": true,
            "http2": false
        }
    ],
    "ssl_cert": 1,
    "backend_config": {
        "type": "proxy",
        "load_balance_policy": "Round Robin",
        "servers": [
            {
                "protocol": "http",
                "host": "foobar.com",
                "port": 80
            }
        ],
        "x_forwarded_for_action": "append"
    },
    "session_method": {
        "type": "off"
    },
    "policy_group": 1
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 14,
        "ip": [
            "0.0.0.0",
            "::"
        ],
        "session_method": {
            "type": "off"
        },
        "policy_rules": [],
        "health_check_status": "",
        "operation_mode": "Software Reverse Proxy",
        "interface": "virtual",
        "ports": [
            {
                "port": 80,
                "ssl": false,
                "http2": false
            },
            {
                "port": 443,
                "ssl": true,
                "http2": false
            }
        ],
        "server_names": [
            "example.com"
        ],
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "name": "first website",
        "backend_config": {
            "type": "proxy",
            "load_balance_policy": "Round Robin",
            "servers": [
                {
                    "protocol": "http",
                    "host": "foobar.com",
                    "port": 80,
                    "weight": 1
                }
            ],
            "x_forwarded_for_action": "append",
            "header_config": [],
            "health_check_config": {
                "is_enabled": false,
                "check_http_expect_alive": [
                    "http_2xx",
                    "http_3xx",
                    "http_4xx",
                    "http_5xx"
                ],
                "check_type": "http",
                "interval": 30000,
                "fall": 5,
                "rise": 2,
                "timeout": 1000,
                "port": 0,
                "http_send": "GET / HTTP/1.0\r\nUser-Agent: Health Check\r\n\r\n"
            },
            "proxy_ssl_protocols": [],
            "proxy_ssl_ciphers": ""
        },
        "create_time": "1544513561",
        "last_update_time": "1544513561",
        "is_enabled": true,
        "detector_ip_source": [
            "Socket"
        ],
        "access_log": {
            "is_enabled": true,
            "log_request_header": false,
            "log_response_header": false
        },
        "ssl_cert": 1,
        "policy_group": 1
    },
    "msg": null
}
```

### - 创建后端服务器为 rewrite 模式的站点



请求

```js
{
    "name": "first website",
    "server_names": [
        "example.com"
    ],
    "ports": [
        {
            "port": 80,
            "ssl": false,
            "http2": false
        },
        {
            "port": 443,
            "ssl": true,
            "http2": false
        }
    ],
    "ssl_cert": 1,
    "backend_config": {
        "type": "response",
        "status_code": 200,
        "path": "foobar"
    },
    "session_method": {
        "type": "off"
    },
    "policy_group": null
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 15,
        "ip": [
            "0.0.0.0",
            "::"
        ],
        "session_method": {
            "type": "off"
        },
        "policy_rules": [],
        "health_check_status": "",
        "operation_mode": "Software Reverse Proxy",
        "interface": "virtual",
        "ports": [
            {
                "port": 80,
                "ssl": false,
                "http2": false
            },
            {
                "port": 443,
                "ssl": true,
                "http2": false
            }
        ],
        "server_names": [
            "example.com"
        ],
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "name": "first website",
        "backend_config": {
            "type": "response",
            "status_code": 200,
            "path": "foobar"
        },
        "create_time": "1544513561",
        "last_update_time": "1544513561",
        "is_enabled": true,
        "detector_ip_source": [
            "Socket"
        ],
        "access_log": {
            "is_enabled": true,
            "log_request_header": false,
            "log_response_header": false
        },
        "ssl_cert": 1,
        "policy_group": null
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
|server_names | 列表 | 必填 | False | [ -  详见下方表格](#einkiubnnvybwxdbdrvmiqeycpbsijsh) | 
|ports | 列表 | 必填 | False | [ -  详见下方表格](#qjsnxiiknicivwoctqjdwgggmpmqcyqj) | 
|ssl_cert | 整型数字 | 非必填/None | True |  -  | 
|backend_config | OneOf 类型 | - | - | [详见下方表格](#xjqbiiavltqkkqnhpblksoulxvjgdrap) | 
|policy_group | 整型数字 | 必填 | True |  -  | 
|session_method | 字典 | - | - | [详见下方表格](#txbkjfggmfvudyohtxixvbvnjqmpjauo) | 
|ssl_protocols | 指定选项 | 必填 | False | 选项是: ['TLSv1', 'TLSv1.1', 'SSLv2', 'TLSv1.2', 'SSLv3'] | 
|ssl_ciphers | 字符串 | 必填 | False | 最小长度: 0；  | 
|detector_ip_source | 列表 | 必填 | False | [ -  详见下方表格](#tegiddwbcgcwlorhlgavbdnzkkwzyqxq) | 
|access_log | 字典 | - | - | [详见下方表格](#oataorffxgtdygvaszzhqvrgxclbotrc) | 

<a id="einkiubnnvybwxdbdrvmiqeycpbsijsh">server_names</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | Nginx 的 server_name，可以是 IPv4、[IPv6]、域名或者泛域名;  | 


<a id="qjsnxiiknicivwoctqjdwgggmpmqcyqj">ports</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#tqjrxcougjmpadiacotjjwkmeqeccrgh) | 

<a id="tqjrxcougjmpadiacotjjwkmeqeccrgh">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|ssl | 布尔 | 必填 | False |  -  | 
|http2 | 布尔 | 必填 | False |  -  | 


<a id="xjqbiiavltqkkqnhpblksoulxvjgdrap">1. backend_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#fqbuyjwotvwrsdtyutvxzyehdyxamgwx) | 

<a id="fqbuyjwotvwrsdtyutvxzyehdyxamgwx">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['proxy'] | 
|load_balance_policy | 指定选项 | 必填 | False | 选项是: ['Round Robin', 'Least Connected', 'IP Hash'] | 
|servers | 列表 | 必填 | False | [ -  详见下方表格](#cbmnmormupyzqjqzwzeodddepmolmpru) | 
|x_forwarded_for_action | 指定选项 | 必填 | False | 选项是: ['append', 'cover', 'no_action'] | 
|header_config | 列表 | 必填 | False | [ -  详见下方表格](#ufcfaiblxczhkrkbhyjfbkjfopixxhbe) | 
|health_check_config | 字典 | - | - | [详见下方表格](#urqwdeebtobfugpdwcbhjgvlrpmnosju) | 
|proxy_ssl_protocols | 指定选项 | 必填 | False | 选项是: ['TLSv1', 'TLSv1.1', 'SSLv2', 'TLSv1.2', 'SSLv3'] | 
|proxy_ssl_ciphers | 字符串 | 非必填/'' | False | 最小长度: 0；  | 

<a id="cbmnmormupyzqjqzwzeodddepmolmpru">servers</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#vklimwxpglrrseyqnhbfgrvhobdkhxrd) | 

<a id="vklimwxpglrrseyqnhbfgrvhobdkhxrd">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|protocol | 指定选项 | 必填 | False | 选项是: ['https', 'http'] | 
|host | 字符串 | 必填 | False | IP 或者域名;  | 
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|weight | 整型数字 | 非必填/1 | False | 最小值: 1;  | 


<a id="ufcfaiblxczhkrkbhyjfbkjfopixxhbe">header_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#kdmjearkiggnwadgdyebxiykyuakfotr) | 

<a id="kdmjearkiggnwadgdyebxiykyuakfotr">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False |  -  | 
|context | 指定选项 | 必填 | False | 选项是: ['response', 'request'] | 
|action | 指定选项 | 必填 | False | 选项是: ['hide', 'set'] | 
|value | 字符串 | 非必填/'' | False | 最小长度: 0；  | 


<a id="urqwdeebtobfugpdwcbhjgvlrpmnosju">health_check_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|is_enabled | 布尔 | 必填 | False |  -  | 
|check_http_expect_alive | 指定选项 | 必填 | False | 选项是: ['http_2xx', 'http_3xx', 'http_5xx', 'http_4xx'] | 
|check_type | 指定选项 | 必填 | False | 选项是: ['http'] | 
|interval | 整型数字 | 必填 | False | 最小值: 1;  | 
|fall | 整型数字 | 必填 | False | 最小值: 1;  | 
|rise | 整型数字 | 必填 | False | 最小值: 1;  | 
|timeout | 整型数字 | 必填 | False | 最小值: 1;  | 
|port | 整型数字 | 必填 | False | 最小值: 0;  | 
|http_send | 字符串 | 必填 | False |  -  | 


<a id="xjqbiiavltqkkqnhpblksoulxvjgdrap">2. backend_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#qufmtseblinjoxzempxkpxvkidwhogul) | 

<a id="qufmtseblinjoxzempxkpxvkidwhogul">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['response'] | 
|status_code | 指定选项 | 必填 | False | 选项是: [200, 400, 401, 402, 404, 405, 500, 503, 504] | 
|path | 字符串 | 必填 | False | 大小写字母和数字;  | 


<a id="xjqbiiavltqkkqnhpblksoulxvjgdrap">3. backend_config</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#fzsgxvtxzrafejfgvixksztmlrzftgol) | 

<a id="fzsgxvtxzrafejfgvixksztmlrzftgol">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['redirect'] | 
|status_code | 指定选项 | 必填 | False | 选项是: [301, 302, 307] | 
|path | 字符串 | 必填 | False |  -  | 


<a id="txbkjfggmfvudyohtxixvbvnjqmpjauo">session_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['header', 'off', 'internal_session', 're', 'cookie', 'url_query', 'body_form'] | 
|param | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|pattern | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 


<a id="tegiddwbcgcwlorhlgavbdnzkkwzyqxq">detector_ip_source</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="oataorffxgtdygvaszzhqvrgxclbotrc">access_log</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|is_enabled | 布尔 | 必填 | False |  -  | 
|log_request_header | 布尔 | 必填 | False |  -  | 
|log_response_header | 布尔 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 编辑站点



请求

```js
{
    "id": 17,
    "ip": [
        "0.0.0.0",
        "::"
    ],
    "session_method": {
        "type": "off"
    },
    "policy_rules": [],
    "health_check_status": "",
    "operation_mode": "Software Reverse Proxy",
    "interface": "virtual",
    "ports": [
        {
            "port": 80,
            "ssl": false,
            "http2": false
        },
        {
            "port": 443,
            "ssl": true,
            "http2": false
        }
    ],
    "server_names": [
        "example.com"
    ],
    "ssl_protocols": [],
    "ssl_ciphers": "",
    "name": "first website",
    "backend_config": {
        "type": "proxy",
        "load_balance_policy": "Round Robin",
        "servers": [
            {
                "protocol": "http",
                "host": "foobar.com",
                "port": 80,
                "weight": 1
            }
        ],
        "x_forwarded_for_action": "append",
        "header_config": [],
        "health_check_config": {
            "is_enabled": false,
            "check_http_expect_alive": [
                "http_2xx",
                "http_3xx",
                "http_4xx",
                "http_5xx"
            ],
            "check_type": "http",
            "interval": 30000,
            "fall": 5,
            "rise": 2,
            "timeout": 1000,
            "port": 0,
            "http_send": "GET / HTTP/1.0\r\nUser-Agent: Health Check\r\n\r\n"
        },
        "proxy_ssl_protocols": [],
        "proxy_ssl_ciphers": ""
    },
    "create_time": "1544513562",
    "last_update_time": "1544513562",
    "is_enabled": true,
    "detector_ip_source": [
        "Socket"
    ],
    "access_log": {
        "is_enabled": true,
        "log_request_header": true,
        "log_response_header": false
    },
    "ssl_cert": 1,
    "policy_group": 1
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 17,
        "ip": [
            "0.0.0.0",
            "::"
        ],
        "session_method": {
            "type": "off"
        },
        "policy_rules": [],
        "health_check_status": "",
        "operation_mode": "Software Reverse Proxy",
        "interface": "virtual",
        "ports": [
            {
                "port": 80,
                "ssl": false,
                "http2": false
            },
            {
                "port": 443,
                "ssl": true,
                "http2": false
            }
        ],
        "server_names": [
            "example.com"
        ],
        "ssl_protocols": [],
        "ssl_ciphers": "",
        "name": "first website",
        "backend_config": {
            "type": "proxy",
            "load_balance_policy": "Round Robin",
            "servers": [
                {
                    "protocol": "http",
                    "host": "foobar.com",
                    "port": 80,
                    "weight": 1
                }
            ],
            "x_forwarded_for_action": "append",
            "header_config": [],
            "health_check_config": {
                "is_enabled": false,
                "check_http_expect_alive": [
                    "http_2xx",
                    "http_3xx",
                    "http_5xx",
                    "http_4xx"
                ],
                "check_type": "http",
                "interval": 30000,
                "fall": 5,
                "rise": 2,
                "timeout": 1000,
                "port": 0,
                "http_send": "GET / HTTP/1.0\r\nUser-Agent: Health Check\r\n\r\n"
            },
            "proxy_ssl_protocols": [],
            "proxy_ssl_ciphers": ""
        },
        "create_time": "1544513562",
        "last_update_time": "1544513562",
        "is_enabled": true,
        "detector_ip_source": [
            "Socket"
        ],
        "access_log": {
            "is_enabled": true,
            "log_request_header": true,
            "log_response_header": false
        },
        "ssl_cert": 1,
        "policy_group": 1
    },
    "msg": null
}
```

# /api/EnableDisableWebsiteAPI

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#nbigwntivjermmbznhrtfqbxbyhkfmwm) | 
|action | 指定选项 | 必填 | False | 选项是: ['disable', 'enable'] | 

<a id="nbigwntivjermmbznhrtfqbxbyhkfmwm">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 批量启用禁用站点



请求

```js
{
    "id__in": [
        12
    ],
    "action": "disable"
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

# /api/UploadForbiddenPageAPI

## POST

### 权限
 - Website And Security Policy Management

### - 上传拦截页面



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
        "path": "c599d0a9bfee89ce3eddb4cce43a1ffc"
    },
    "msg": null
}
```

# /api/SoftwareClusterReverseProxyWebsiteAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#wqbkteibcbjutogirshvmljmcmomvtph) | 
|name | 字符串 | 非必填/无默认值 | False |  -  | 
|create_time__range | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#kstcspryovjojrgvxsrwawkexbixjthj) | 

<a id="wqbkteibcbjutogirshvmljmcmomvtph">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="kstcspryovjojrgvxsrwawkexbixjthj">create_time__range</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 

### 权限
 - Website And Security Policy Management

### - 编辑站点



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
    "data": {
        "id": 8,
        "name": "test",
        "server_names": [
            "foobar.com"
        ],
        "ports": [
            {
                "ssl": false,
                "port": 1234,
                "http2": false
            }
        ],
        "create_time": "1544513557",
        "policy_group": 1,
        "session_method": {
            "type": "off"
        },
        "policy_rules": [],
        "detector_ip_source": [
            "Socket"
        ],
        "access_log": {
            "is_enabled": true,
            "log_request_header": true,
            "log_response_header": false
        }
    },
    "msg": null
}
```

### - 获取站点信息



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [],
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False |  -  | 
|server_names | 列表 | 必填 | False | [ -  详见下方表格](#mwybngrdzffnxyamrnnvhdurrfsqkpqz) | 
|ports | 列表 | 必填 | False | [ -  详见下方表格](#dkxqpudqrprawjrkorxfwipqkgighrwe) | 
|policy_group | 整型数字 | 必填 | True |  -  | 
|session_method | 字典 | - | - | [详见下方表格](#kxxcbwmdslficqyxixawtzzwidxssnld) | 

<a id="mwybngrdzffnxyamrnnvhdurrfsqkpqz">server_names</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | Nginx 的 server_name，可以是 IPv4、[IPv6]、域名或者泛域名;  | 


<a id="dkxqpudqrprawjrkorxfwipqkgighrwe">ports</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#rwqosgqzpetbvinpsoxfxfufxjqosnmd) | 

<a id="rwqosgqzpetbvinpsoxfxfufxjqosnmd">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|ssl | 布尔 | 必填 | False |  -  | 
|http2 | 布尔 | 必填 | False |  -  | 


<a id="kxxcbwmdslficqyxixawtzzwidxssnld">session_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['header', 'off', 'internal_session', 're', 'cookie', 'url_query', 'body_form'] | 
|param | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|pattern | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 

### 权限
 - Website And Security Policy Management

### - 创建站点



请求

```js
{
    "name": "test",
    "ports": [
        {
            "port": 1234,
            "ssl": false,
            "http2": false
        }
    ],
    "server_names": [
        "example.com"
    ],
    "policy_group": 1,
    "session_method": {
        "param": "",
        "type": "off"
    }
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 6,
        "name": "test",
        "server_names": [
            "example.com"
        ],
        "ports": [
            {
                "port": 1234,
                "ssl": false,
                "http2": false
            }
        ],
        "create_time": "1544513556",
        "policy_group": 1,
        "session_method": {
            "type": "off"
        },
        "policy_rules": [],
        "detector_ip_source": [
            "Socket"
        ],
        "access_log": {
            "is_enabled": true,
            "log_request_header": false,
            "log_response_header": false
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
|server_names | 列表 | 必填 | False | [ -  详见下方表格](#asakqfyuwntohbsvymtawtnembptdoqn) | 
|ports | 列表 | 必填 | False | [ -  详见下方表格](#gwqikhzpcrhavjhnvkivrvafodqmixqn) | 
|policy_group | 整型数字 | 必填 | True |  -  | 
|session_method | 字典 | - | - | [详见下方表格](#ytwzlbkquvvflstriefghkvwgohrwtml) | 
|detector_ip_source | 列表 | 必填 | False | [ -  详见下方表格](#rzsgkxgvvszejogfngdgkqvlkpbwpphg) | 
|access_log | 字典 | - | - | [详见下方表格](#mtdstwxjvawqgcfcsojkxdwqfieugswc) | 

<a id="asakqfyuwntohbsvymtawtnembptdoqn">server_names</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | Nginx 的 server_name，可以是 IPv4、[IPv6]、域名或者泛域名;  | 


<a id="gwqikhzpcrhavjhnvkivrvafodqmixqn">ports</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#qhtjgwkyuxpoogkmrhnppgsismdistzp) | 

<a id="qhtjgwkyuxpoogkmrhnppgsismdistzp">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|ssl | 布尔 | 必填 | False |  -  | 
|http2 | 布尔 | 必填 | False |  -  | 


<a id="ytwzlbkquvvflstriefghkvwgohrwtml">session_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['header', 'off', 'internal_session', 're', 'cookie', 'url_query', 'body_form'] | 
|param | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|pattern | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 


<a id="rzsgkxgvvszejogfngdgkqvlkpbwpphg">detector_ip_source</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="mtdstwxjvawqgcfcsojkxdwqfieugswc">access_log</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|is_enabled | 布尔 | 必填 | False |  -  | 
|log_request_header | 布尔 | 必填 | False |  -  | 
|log_response_header | 布尔 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 编辑站点



请求

```js
{
    "id": 8,
    "name": "test",
    "server_names": [
        "foobar.com"
    ],
    "ports": [
        {
            "port": 1234,
            "ssl": false,
            "http2": false
        }
    ],
    "create_time": "1544513557",
    "policy_group": 1,
    "session_method": {
        "type": "off"
    },
    "policy_rules": [],
    "detector_ip_source": [
        "Socket"
    ],
    "access_log": {
        "is_enabled": true,
        "log_request_header": true,
        "log_response_header": false
    }
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 8,
        "name": "test",
        "server_names": [
            "foobar.com"
        ],
        "ports": [
            {
                "port": 1234,
                "ssl": false,
                "http2": false
            }
        ],
        "create_time": "1544513557",
        "policy_group": 1,
        "session_method": {
            "type": "off"
        },
        "policy_rules": [],
        "detector_ip_source": [
            "Socket"
        ],
        "access_log": {
            "is_enabled": true,
            "log_request_header": true,
            "log_response_header": false
        }
    },
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#steqwgogrneyvwabrcyocmeovuligrem) | 

<a id="steqwgogrneyvwabrcyocmeovuligrem">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除站点



请求

```js
{
    "id__in": [
        7
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

# /api/SoftwarePortMirroringWebsiteAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#dcvjfyownduxzxpjolactlmtxtilcvoo) | 
|name | 字符串 | 非必填/无默认值 | False |  -  | 
|create_time__range | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#jwdenkyzkctvlmwlkwjizbbpgobyubuh) | 

<a id="dcvjfyownduxzxpjolactlmtxtilcvoo">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="jwdenkyzkctvlmwlkwjizbbpgobyubuh">create_time__range</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 

### 权限
 - Website And Security Policy Management

### - 编辑站点



请求

```js
{
    "id": 11
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 11,
        "name": "test",
        "server_names": [
            "foobar.com"
        ],
        "ports": [
            {
                "ssl": false,
                "port": 1234,
                "http2": false
            }
        ],
        "create_time": "1544513559",
        "policy_group": 1,
        "policy_rules": [],
        "is_enabled": true,
        "access_log": {
            "is_enabled": true,
            "log_request_header": true,
            "log_response_header": false
        }
    },
    "msg": null
}
```

### - 获取站点信息



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [],
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False |  -  | 
|server_names | 列表 | 必填 | False | [ -  详见下方表格](#dmzfkkjfyrdxbhshsjbufvpvszbcmysx) | 
|ports | 列表 | 必填 | False | [ -  详见下方表格](#wajwszttdcxccgilidpfphifjrfhaanj) | 
|policy_group | 整型数字 | 必填 | True |  -  | 

<a id="dmzfkkjfyrdxbhshsjbufvpvszbcmysx">server_names</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | Nginx 的 server_name，可以是 IPv4、[IPv6]、域名或者泛域名;  | 


<a id="wajwszttdcxccgilidpfphifjrfhaanj">ports</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#apfqhnvthcoygzgtbawypdkhzwfdqisb) | 

<a id="apfqhnvthcoygzgtbawypdkhzwfdqisb">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|ssl | 布尔 | 必填 | False |  -  | 
|http2 | 布尔 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 创建站点



请求

```js
{
    "name": "test",
    "ports": [
        {
            "port": 1234,
            "ssl": false,
            "http2": false
        }
    ],
    "server_names": [
        "example.com"
    ],
    "policy_group": 1
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 9,
        "name": "test",
        "server_names": [
            "example.com"
        ],
        "ports": [
            {
                "port": 1234,
                "ssl": false,
                "http2": false
            }
        ],
        "create_time": "1544513558",
        "policy_group": 1,
        "policy_rules": [],
        "is_enabled": true,
        "access_log": {
            "is_enabled": true,
            "log_request_header": false,
            "log_response_header": false
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
|server_names | 列表 | 必填 | False | [ -  详见下方表格](#rrarqpyqvjmgzgncwhbwihefvcduojms) | 
|ports | 列表 | 必填 | False | [ -  详见下方表格](#kyevvipcphuyaojwaxpfvrqltzxgxufl) | 
|policy_group | 整型数字 | 必填 | True |  -  | 
|access_log | 字典 | - | - | [详见下方表格](#ztylcfwakkzwbmkfuspsabkoosiihrwh) | 

<a id="rrarqpyqvjmgzgncwhbwihefvcduojms">server_names</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | Nginx 的 server_name，可以是 IPv4、[IPv6]、域名或者泛域名;  | 


<a id="kyevvipcphuyaojwaxpfvrqltzxgxufl">ports</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#ybrehaqzzmbifqtksnhmnkbfsrymmqxa) | 

<a id="ybrehaqzzmbifqtksnhmnkbfsrymmqxa">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|port | 整型数字 | 必填 | False | 最小值: 1;  | 
|ssl | 布尔 | 必填 | False |  -  | 
|http2 | 布尔 | 必填 | False |  -  | 


<a id="ztylcfwakkzwbmkfuspsabkoosiihrwh">access_log</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|is_enabled | 布尔 | 必填 | False |  -  | 
|log_request_header | 布尔 | 必填 | False |  -  | 
|log_response_header | 布尔 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 编辑站点



请求

```js
{
    "id": 11,
    "name": "test",
    "server_names": [
        "foobar.com"
    ],
    "ports": [
        {
            "port": 1234,
            "ssl": false,
            "http2": false
        }
    ],
    "create_time": "1544513559",
    "policy_group": 1,
    "policy_rules": [],
    "is_enabled": true,
    "access_log": {
        "is_enabled": true,
        "log_request_header": true,
        "log_response_header": false
    }
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 11,
        "name": "test",
        "server_names": [
            "foobar.com"
        ],
        "ports": [
            {
                "port": 1234,
                "ssl": false,
                "http2": false
            }
        ],
        "create_time": "1544513559",
        "policy_group": 1,
        "policy_rules": [],
        "is_enabled": true,
        "access_log": {
            "is_enabled": true,
            "log_request_header": true,
            "log_response_header": false
        }
    },
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#xlvvkgcuujhqfaaydrvygqicpkavhgqw) | 

<a id="xlvvkgcuujhqfaaydrvygqicpkavhgqw">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除站点



请求

```js
{
    "id__in": [
        10
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

