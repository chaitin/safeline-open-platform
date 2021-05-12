# /api/v1/conf/waf_state/log_ip_source

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|log_ip_source | 列表 | 必填 | False |  - 详见下方表格 | 

log_ip_source

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 最大长度: 64;  | 



### 设置检测日志 ip 来源

对于 x-forwarded-for，还可以添加 :-1 :-2 等后缀表示取第几个ip

请求

```js
{
    "log_ip_source": [
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
    "msg": "",
    "data": {
        "log_ip_source": [
            "Socket",
            "X-Forwarded-For",
            "My-Header",
            "X-Forwarded-For:-1"
        ]
    }
}
```

# /api/v3/snserver/heartbeat

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|timestamp | 浮点数字 | 必填 | False |  -  | 
|time_from | 浮点数字 | 必填 | False |  -  | 
|node | 字符串 | 必填 | False | 最大长度: 128;  | 
|cpu | 浮点数字 | 必填 | False |  -  | 
|mem | 浮点数字 | 必填 | False |  -  | 
|req_num_total | 整型数字 | 必填 | False |  -  | 
|req_num_blocked | 整型数字 | 必填 | False |  -  | 
|req_num_accepted | 整型数字 | 必填 | False |  -  | 
|req_num_handled | 整型数字 | 必填 | False |  -  | 
|req_num_dropped | 整型数字 | 必填 | False |  -  | 
|req_average_time | 浮点数字 | 必填 | False |  -  | 
|ioread | 浮点数字 | 必填 | False |  -  | 
|iowrite | 浮点数字 | 必填 | False |  -  | 
|req_ngx_time | 整型数字 | 必填 | False |  -  | 
|req_ngx_count | 整型数字 | 必填 | False |  -  | 
|detector_version | 整型数字 | 必填 | False |  -  | 
|workers | 列表 | 必填 | False |  - 详见下方表格 | 
|policy_version | 字典 | - | - | 详见下面表格 | 

workers

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | 详见下面表格 | 

子字段

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|index | 整型数字 | 必填 | False |  -  | 
|cpu | 浮点数字 | 必填 | False |  -  | 
|ioread | 浮点数字 | 必填 | False |  -  | 
|iowrite | 浮点数字 | 必填 | False |  -  | 


policy_version

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|waf_rule_version | 整型数字 | 必填 | False |  -  | 
|cc_rule_version | 整型数字 | 必填 | False |  -  | 



### snserver 发送 heartbeat



请求

```js
{
    "timestamp": 1545297403.5166395,
    "time_from": 1545297398.5166395,
    "node": "node",
    "policy_version": {
        "waf_rule_version": 1,
        "cc_rule_version": 1
    },
    "cpu": 0.9,
    "mem": 0.8,
    "req_num_total": 100,
    "req_num_blocked": 15,
    "req_num_accepted": 15,
    "req_num_handled": 15,
    "req_num_dropped": 10,
    "req_average_time": 100,
    "ioread": 1000,
    "iowrite": 200,
    "req_ngx_time": 1000,
    "req_ngx_count": 2000,
    "detector_version": 4,
    "workers": [
        {
            "index": 1,
            "cpu": 0.6,
            "ioread": 300,
            "iowrite": 500
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

# /api/v1/stat/node/delete

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|node | 字符串 | 必填 | False |  -  | 



### 删除检测节点数据



请求

```js
{
    "node": "node"
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

# /api/v1/stat/node

## GET



### 获取节点状态



响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "node": "node",
            "timestamp": 1545297403.2744617,
            "last_timestamp": 1545297398.2744617,
            "last_update_at": 1545297403.2821705,
            "cpu": 0.9,
            "mem": 0.8,
            "num_request": 20.0,
            "num_attack": 3.0,
            "num_accepted": 3.0,
            "num_handled": 3.0,
            "num_dropped": 2.0,
            "process_time": 100,
            "detector_version": 4,
            "ioread": 200.0,
            "iowrite": 40.0,
            "workers": [
                {
                    "index": 1,
                    "cpu": 0.6,
                    "ioread": 60.0,
                    "iowrite": 100.0
                }
            ],
            "ngx_count": 400.0,
            "ngx_time": 200.0,
            "status": "normal",
            "config": "policy_update_failed"
        }
    ]
}
```

# /api/v1/conf/syslog

## GET



### 获取 syslog 配置，目前 syslog 处于 未配置过的状态



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "ip": null,
        "port": null,
        "format": {
            "type": "json"
        }
    }
}
```

### 获取 syslog 配置



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "ip": "1.2.3.4",
        "port": 80,
        "format": {
            "data": [],
            "type": "custom"
        }
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|ip | 字符串 | 必填 | False |  -  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|format | 字典 | - | - | 详见下面表格 | 

format

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['json', 'custom'] | 
|data | 列表 | 非必填/无默认值 | False |  - 详见下方表格 | 

data

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|



### 修改 syslog 配置



请求

```js
{
    "ip": "1.2.3.4",
    "port": 80,
    "format": {
        "type": "custom",
        "data": []
    }
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "ip": "1.2.3.4",
        "port": 80,
        "format": {
            "data": [],
            "type": "custom"
        }
    }
}
```

# /api/v1/conf/ha_status

## GET



### 获取 ha 配置



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "status": true,
        "mode": "master",
        "nopreempt": true,
        "interface_name": "",
        "downgraded": false,
        "vrrp_state": "master",
        "sync_state": "success",
        "state": "normal"
    }
}
```

# /api/v1/conf/ha

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|interface_name | 字符串 | 必填 | False | 最大长度: 128;  | 
|mode | 指定选项 | 必填 | False | 选项是: ['master', 'backup'] | 
|status | 布尔 | 必填 | False |  -  | 
|nopreempt | 布尔 | 必填 | False |  -  | 



### ha 配置



请求

```js
{
    "interface_name": "bonding_0",
    "mode": "master",
    "status": true,
    "nopreempt": true
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "interface_name": "bonding_0",
        "mode": "master",
        "status": true,
        "nopreempt": true
    }
}
```

# /api/v1/conf/system_service

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|services | 指定选项 | 必填 | False | 选项是: ['web_management', 'icmp_echo', 'ssh', 'snmp'] | 



### 获取系统服务设置



请求

```js
{
    "services": [
        "ssh",
        "icmp_echo"
    ]
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "icmp_echo": [
            {
                "interface": "br0",
                "interface_comment": "接口-1",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br1",
                "interface_comment": "接口-2",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br2",
                "interface_comment": "接口-3",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br3",
                "interface_comment": "接口-4",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br4",
                "interface_comment": "接口-5",
                "enabled": false,
                "port": 65535
            }
        ],
        "ssh": [
            {
                "interface": "br0",
                "interface_comment": "接口-1",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br1",
                "interface_comment": "接口-2",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br2",
                "interface_comment": "接口-3",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br3",
                "interface_comment": "接口-4",
                "enabled": false,
                "port": 65535
            },
            {
                "interface": "br4",
                "interface_comment": "接口-5",
                "enabled": false,
                "port": 65535
            }
        ]
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 必填 | False | 选项是: ['web_management', 'icmp_echo', 'ssh', 'snmp'] | 
|interface | 字符串 | 必填 | False | 最大长度: 128;  | 
|enabled | 布尔 | 必填 | False |  -  | 
|port | 整型数字 | 非必填/0 | False | 最小值: 1; 最大值: 65535 | 



### 设置系统服务，其中 icmp_echo 不需要端口



请求

```js
{
    "interface": "br0",
    "type": "ssh",
    "enabled": true,
    "port": 22
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

