# /api/NodeInfoAPI

## GET

### 权限
 - System Monitor

### - 获取节点数据



响应

```js
{
    "err": null,
    "data": [
        {
            "id": "minion",
            "node": {
                "timestamp": 1544513539,
                "cpu": 0.02,
                "mem": 0.02,
                "uptime": 100000,
                "network_io": [
                    {
                        "time_from": 150000000,
                        "time_to": 150000000,
                        "interface": "lo",
                        "read": 255.0,
                        "write": 825.0
                    }
                ],
                "disk_info": {
                    "time_from": 150000000,
                    "time_to": 150000000,
                    "total": 100,
                    "usage": 12,
                    "read": 1000,
                    "write": 1000
                },
                "detector": {
                    "node": "deploy",
                    "time_from": 1526541111.271,
                    "time_to": 1526541116.272,
                    "ioread": 554,
                    "iowrite": 651,
                    "detector_version": "9",
                    "policy_version": {
                        "current_version": "1"
                    },
                    "req_num_total": 10086,
                    "rsp_num_total": 0,
                    "req_num_blocked": 0,
                    "req_num_blocked_acl": 0,
                    "req_num_blocked_web": 0,
                    "req_num_attack": 0,
                    "req_num_attack_acl": 0,
                    "req_num_attack_web": 0,
                    "rsp_num_blocked": 0,
                    "rsp_num_blocked_acl": 0,
                    "rsp_num_blocked_web": 0,
                    "rsp_num_attack": 0,
                    "rsp_num_attack_acl": 0,
                    "rsp_num_attack_web": 0,
                    "req_detect_time": 0,
                    "req_detect_count": 0,
                    "rsp_detect_time": 0,
                    "rsp_detect_count": 0,
                    "req_ngx_time_distribution": {
                        "tengine-1": {
                            "time": 4803.0,
                            "count": 6
                        }
                    }
                },
                "tengine": {
                    "config_version": 1,
                    "stats": {
                        "time_from": 150000000,
                        "time_to": 150000000,
                        "accepts": 100,
                        "handled": 100,
                        "requests": 100,
                        "avg_time": 800.5
                    },
                    "hostname": "tengine-1"
                },
                "mario": null,
                "last_timestamp": -1,
                "status": "STARTING",
                "received_timestamp": 1544513539.213878
            },
            "ha": {
                "services": [
                    {
                        "name": "mgt-api",
                        "healthy": true,
                        "estate": "master",
                        "mstate": "idle"
                    },
                    {
                        "name": "tengine",
                        "healthy": false,
                        "estate": "slave",
                        "mstate": "idle"
                    }
                ]
            },
            "services": [
                {
                    "name": "mgt-api",
                    "hostname": "mgt-api-ilibili-slb1",
                    "version": "18.02.1",
                    "status": "HEALTHY",
                    "cpu": 0.02,
                    "mem": 0.02,
                    "uptime": 100000
                },
                {
                    "name": "tengine",
                    "hostname": "tengine-1",
                    "version": "18.02.1",
                    "status": "HEALTHY",
                    "cpu": 0.02,
                    "mem": 0.02,
                    "uptime": 100000,
                    "status_hint": ""
                },
                {
                    "name": "detector-srv",
                    "hostname": "detector-srv",
                    "version": "18.02.1",
                    "status": "HEALTHY",
                    "cpu": 0.02,
                    "mem": 0.02,
                    "uptime": 100000,
                    "status_hint": ""
                }
            ],
            "sites": []
        }
    ],
    "msg": null
}
```

# /api/ServerTimeAPI

## GET

### 权限
 - System Management

### - 获取服务器时间



响应

```js
{
    "err": null,
    "data": [
        {
            "node": "ws-test-client",
            "data": {
                "err": null,
                "data": 1533711846
            },
            "channel_name": "specific.aaa"
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
|value | 浮点数字 | 必填 | False |  -  | 

### 权限
 - System Management

### - 设置服务器时间



请求

```js
{
    "value": 1533711846
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

# /api/HACommandAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|node | 字符串 | 必填 | False |  -  | 
|service | 字符串 | 必填 | False |  -  | 
|command | 指定选项 | 必填 | False | 选项是: ['recover', 'halt'] | 

### 权限
 - System Management

### - HA service 重连



请求

```js
{
    "command": "recover",
    "node": "minion-1",
    "service": "mgt-api"
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

