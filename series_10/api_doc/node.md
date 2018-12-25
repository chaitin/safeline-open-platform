# /api/v1/node/config

## GET



### 获取提供给 minion 的配置



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "services_config": {
            "tengine": {
                "version": 6,
                "config": [
                    {
                        "sites": [
                            {
                                "domains": [
                                    "*"
                                ],
                                "backend": {
                                    "servers": [
                                        {
                                            "address": "127.0.0.1",
                                            "port": 8080,
                                            "weight": 1
                                        }
                                    ],
                                    "health_check": {}
                                },
                                "ssl_options": {},
                                "reverse_proxy_options": {},
                                "listen_options": [
                                    {
                                        "port": 80,
                                        "address": "0.0.0.0"
                                    }
                                ],
                                "client_ip_source": "remote_addr",
                                "forbidden_page_response_code": 403,
                                "name": "68",
                                "forbidden_page_content": "",
                                "x_forwarded_for_option": "AppendXFFHeader"
                            }
                        ],
                        "interface_name": "br0"
                    },
                    {
                        "interface_name": "br1"
                    },
                    {
                        "interface_name": "br2"
                    },
                    {
                        "interface_name": "br3"
                    },
                    {
                        "interface_name": "br4"
                    }
                ]
            }
        }
    }
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 字符串 | 必填 | False |  -  | 
|services_status | 字典 | - | - | 详见下面表格 | 

services_status

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|tengine | 字典 | - | - | 详见下面表格 | 

tengine

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|version | 整型数字 | 必填 | False |  -  | 
|status | 字典 | - | - | 详见下面表格 | 

status

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|status | 字符串 | 必填 | False |  -  | 
|last_result | 字符串 | 必填 | False | 最小长度: 0；  | 
|sites | 字典类型 | - | - | 字典类型 | 

sites

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|status | 字符串 | 必填 | False |  -  | 
|upstreams | 字典类型 | - | - | 字典类型 | 

upstreams

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 



### minion 报告状态获取节点配置



请求

```js
{
    "id": "test",
    "services_status": {
        "tengine": {
            "version": 0,
            "status": {
                "status": "HEALTHY",
                "last_result": "",
                "sites": {
                    "69": {
                        "status": "HEALTHY",
                        "upstreams": {
                            "backend1.com:80": "HEALTHY",
                            "backend1.com:90": "HEALTHY"
                        }
                    }
                }
            }
        }
    }
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "services_config": {
            "tengine": {
                "version": 6,
                "config": [
                    {
                        "sites": [
                            {
                                "domains": [
                                    "*"
                                ],
                                "backend": {
                                    "servers": [
                                        {
                                            "address": "127.0.0.1",
                                            "port": 8080,
                                            "weight": 1
                                        }
                                    ],
                                    "health_check": {}
                                },
                                "ssl_options": {},
                                "reverse_proxy_options": {},
                                "listen_options": [
                                    {
                                        "port": 80,
                                        "address": "0.0.0.0"
                                    }
                                ],
                                "client_ip_source": "remote_addr",
                                "forbidden_page_response_code": 403,
                                "name": "69",
                                "forbidden_page_content": "",
                                "x_forwarded_for_option": "AppendXFFHeader"
                            }
                        ],
                        "interface_name": "br0"
                    },
                    {
                        "interface_name": "br1"
                    },
                    {
                        "interface_name": "br2"
                    },
                    {
                        "interface_name": "br3"
                    },
                    {
                        "interface_name": "br4"
                    }
                ]
            }
        }
    }
}
```

