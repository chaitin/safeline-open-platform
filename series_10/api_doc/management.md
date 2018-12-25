# /api/v1/management/safeline_config/export

## GET

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|smtp_config | 布尔 | 非必填/False | False |  -  | 
|ip_source | 布尔 | 非必填/False | False |  -  | 
|waf_resolver | 布尔 | 非必填/False | False |  -  | 
|cloud_analytics | 布尔 | 非必填/False | False |  -  | 
|global_waf_state | 布尔 | 非必填/False | False |  -  | 
|log_ip_source | 布尔 | 非必填/False | False |  -  | 
|sys_log_config | 布尔 | 非必填/False | False |  -  | 
|alarm_config | 布尔 | 非必填/False | False |  -  | 
|certs | 布尔 | 非必填/False | False |  -  | 
|backends | 布尔 | 非必填/False | False |  -  | 
|policy | 布尔 | 非必填/False | False |  -  | 
|acl_rule_template | 布尔 | 非必填/False | False |  -  | 
|acl_rule | 布尔 | 非必填/False | False |  -  | 
|acl_cidr_white_list | 布尔 | 非必填/False | False |  -  | 



### 导出 SafeLine 的配置



请求

```js
{
    "smtp_config": true,
    "ip_source": true,
    "waf_resolver": true,
    "cloud_analytics": true,
    "global_waf_state": true,
    "log_ip_source": true,
    "sys_log_config": true
}
```

响应

```js
"不支持展示的数据类型，如文件下载等"
```

# /api/v1/management/safeline_config/import

## POST



### 导入 SafeLine 的配置



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
    "msg": "",
    "data": null
}
```

# /api/v1/management/sync_time

## GET



### 获取服务器时间



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "time": 1545297432,
        "timezone": "Asia/Shanghai",
        "available_timezones": [
            "Asia/Shanghai",
            "America/Chicago",
            "Asia/Hong_Kong"
        ]
    }
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time | 整型数字 | 非必填/0 | False | 最小值: 0;  | 
|timezone | 字符串 | 必填 | False |  -  | 



### 同步服务器时间



请求

```js
{
    "time": 1545297432,
    "timezone": "Asia/Shanghai"
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

# /api/v1/management/detect_replay

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target | 字符串 | 必填 | False |  -  | 
|port | 整型数字 | 必填 | False | 最小值: 1; 最大值: 65535 | 
|protocol | 指定选项 | 必填 | False | 选项是: ['http', 'https'] | 
|content | 字符串 | 必填 | False |  -  | 



### 请求重放



请求

```js
{
    "target": "25.25.205.32",
    "port": 80,
    "protocol": "http",
    "content": "POST /bdddddddddddddddddbs.rar HTTP/1.1\r\nHost: safeline-test.in.chaitin.com\r\nContent-Length: 4\r\n\r\ntest"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": "80625326-2c8d-48c1-9e78-8d7cac53c913"
    }
}
```

# /api/v1/management/snmp_config

## GET



### 获取 snmp 配置，之前设置的是 v1v2c 协议版本



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "version": "v1v2c"
    }
}
```

### 获取 snmp 配置，之前设置的是 v3 协议版本



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "version": "v3",
        "username": "safeline",
        "hash_method": "SHA",
        "encryption_method": "AES"
    }
}
```

## PUT

数据格式

> v1 / v2c 协议只需要 community，
    v3 协议只不需要 community
    disable-default-check

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|version | 指定选项 | 必填 | False | 选项是: ['v1v2c', 'v3'] | 
|community | 字符串 | 非必填/无默认值 | False | 最大长度: 24;  | 
|username | 字符串 | 非必填/无默认值 | False | 最大长度: 24;  | 
|hash_method | 指定选项 | 非必填/无默认值 | False | 选项是: ['MD5', 'SHA'] | 
|password | 字符串 | 非必填/无默认值 | False | 最大长度: 24; 最小长度: 8;  | 
|encryption_method | 指定选项 | 非必填/无默认值 | False | 选项是: ['AES', 'DES'] | 



### snmp v1v2c 协议的设置



请求

```js
{
    "version": "v1v2c",
    "community": "safeline"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "version": "v1v2c"
    }
}
```

### snmp v3 协议的设置



请求

```js
{
    "version": "v3",
    "username": "safeline",
    "password": "safeline",
    "hash_method": "SHA",
    "encryption_method": "AES"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "version": "v3",
        "username": "safeline",
        "hash_method": "SHA",
        "encryption_method": "AES"
    }
}
```

# /api/v1/management/ping

## GET



### 获取 ping 的结果，这个 api 可以轮训，直到 processing == false



请求

```js
{
    "id": "c0a070f96470f38223003425fc60092e"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "output": "PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.\n",
        "processing": true
    }
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | 最大长度: 128;  | 



### 提交 ping 请求



请求

```js
{
    "hostname": "127.0.0.1"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": "d2458bb54c1d3f70946735e8328a762c"
    }
}
```

# /api/v1/management/curl

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|url | 字符串 | 必填 | False |  -  | 



### curl 测试



请求

```js
{
    "url": "https://www.baidu.com"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "output": "* Rebuilt URL to: https://www.baidu.com/\n  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 61.135.169.121...\n* Connected to www.baidu.com (61.135.169.121) port 443 (#0)\n* found 149 certificates in /etc/ssl/certs/ca-certificates.crt\n* found 596 certificates in /etc/ssl/certs\n* ALPN, offering http/1.1\n* SSL connection using TLS1.2 / ECDHE_RSA_AES_128_GCM_SHA256\n* \t server certificate verification SKIPPED\n* \t server certificate status verification SKIPPED\n* \t common name: baidu.com (matched)\n* \t server certificate expiration date OK\n* \t server certificate activation date OK\n* \t certificate public key: RSA\n* \t certificate version: #3\n* \t subject: C=CN,ST=beijing,L=beijing,OU=service operation department,O=Beijing Baidu Netcom Science Technology Co.\\, Ltd,CN=baidu.com\n* \t start date: Tue, 03 Apr 2018 03:26:03 GMT\n* \t expire date: Sun, 26 May 2019 05:31:02 GMT\n* \t issuer: C=BE,O=GlobalSign nv-sa,CN=GlobalSign Organization Validation CA - SHA256 - G2\n* \t compression: NULL\n* ALPN, server accepted to use http/1.1\n> GET / HTTP/1.1\r\n> Host: www.baidu.com\r\n> User-Agent: curl/7.47.0\r\n> Accept: */*\r\n> \r\n< HTTP/1.1 200 OK\r\n< Accept-Ranges: bytes\r\n< Cache-Control: private, no-cache, no-store, proxy-revalidate, no-transform\r\n< Connection: Keep-Alive\r\n< Content-Length: 2443\r\n< Content-Type: text/html\r\n< Date: Thu, 20 Dec 2018 09:16:59 GMT\r\n< Etag: \"588603e7-98b\"\r\n< Last-Modified: Mon, 23 Jan 2017 13:23:51 GMT\r\n< Pragma: no-cache\r\n< Server: bfe/1.0.8.18\r\n< Set-Cookie: BDORZ=27315; max-age=86400; domain=.baidu.com; path=/\r\n< \r\n{ [1040 bytes data]\n\r100  2443  100  2443    0     0   6508      0 --:--:-- --:--:-- --:--:--  6514\n* Connection #0 to host www.baidu.com left intact\n<!DOCTYPE html>\r\n<!--STATUS OK--><html> <head><meta http-equiv=content-type content=text/html;charset=utf-8><meta http-equiv=X-UA-Compatible content=IE=Edge><meta content=always name=referrer><link rel=stylesheet type=text/css href=https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/bdorz/baidu.min.css><title>百度一下，你就知道</title></head> <body link=#0000cc> <div id=wrapper> <div id=head> <div class=head_wrapper> <div class=s_form> <div class=s_form_wrapper> <div id=lg> <img hidefocus=true src=//www.baidu.com/img/bd_logo1.png width=270 height=129> </div> <form id=form name=f action=//www.baidu.com/s class=fm> <input type=hidden name=bdorz_come value=1> <input type=hidden name=ie value=utf-8> <input type=hidden name=f value=8> <input type=hidden name=rsv_bp value=1> <input type=hidden name=rsv_idx value=1> <input type=hidden name=tn value=baidu><span class=\"bg s_ipt_wr\"><input id=kw name=wd class=s_ipt value maxlength=255 autocomplete=off autofocus=autofocus></span><span class=\"bg s_btn_wr\"><input type=submit id=su value=百度一下 class=\"bg s_btn\" autofocus></span> </form> </div> </div> <div id=u1> <a href=http://news.baidu.com name=tj_trnews class=mnav>新闻</a> <a href=https://www.hao123.com name=tj_trhao123 class=mnav>hao123</a> <a href=http://map.baidu.com name=tj_trmap class=mnav>地图</a> <a href=http://v.baidu.com name=tj_trvideo class=mnav>视频</a> <a href=http://tieba.baidu.com name=tj_trtieba class=mnav>贴吧</a> <noscript> <a href=http://www.baidu.com/bdorz/login.gif?login&amp;tpl=mn&amp;u=http%3A%2F%2Fwww.baidu.com%2f%3fbdorz_come%3d1 name=tj_login class=lb>登录</a> </noscript> <script>document.write('<a href=\"http://www.baidu.com/bdorz/login.gif?login&tpl=mn&u='+ encodeURIComponent(window.location.href+ (window.location.search === \"\" ? \"?\" : \"&\")+ \"bdorz_come=1\")+ '\" name=\"tj_login\" class=\"lb\">登录</a>');\r\n                </script> <a href=//www.baidu.com/more/ name=tj_briicon class=bri style=\"display: block;\">更多产品</a> </div> </div> </div> <div id=ftCon> <div id=ftConw> <p id=lh> <a href=http://home.baidu.com>关于百度</a> <a href=http://ir.baidu.com>About Baidu</a> </p> <p id=cp>&copy;2017&nbsp;Baidu&nbsp;<a href=http://www.baidu.com/duty/>使用百度前必读</a>&nbsp; <a href=http://jianyi.baidu.com/ class=cp-feedback>意见反馈</a>&nbsp;京ICP证030173号&nbsp; <img src=//www.baidu.com/img/gs.gif> </p> </div> </div> </div> </body> </html>\r\n"
    }
}
```

# /api/v1/management/reboot

## POST



### reboot 机器



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

# /api/v1/management/netstat

## GET



### netstat



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "output": "Active Internet connections (servers and established)\nProto Recv-Q Send-Q Local Address           Foreign Address         State      \ntcp        0      0 0.0.0.0:6379            0.0.0.0:*               LISTEN     \ntcp        0      0 0.0.0.0:50001           0.0.0.0:*               LISTEN     \ntcp        0      0 127.0.0.1:59534         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:50001         127.0.0.1:59818         ESTABLISHED\ntcp        0      0 127.0.0.1:60242         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46414        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59876         127.0.0.1:50001         TIME_WAIT  \ntcp        0    172 127.0.0.1:6379          127.0.0.1:53534         ESTABLISHED\ntcp        0      0 127.0.0.1:59280         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47482        172.18.0.2:5432         ESTABLISHED\ntcp        0      0 127.0.0.1:59598         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59286         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47444        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60076         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60216         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60196         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60086         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59284         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59694         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46916        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59868         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60056         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60062         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46680        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60044         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60276         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59666         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47090        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59648         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46894        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60172         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59416         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46694        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:47008        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59318         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46770        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59408         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59606         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59448         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60078         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59292         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46676        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59406         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59978         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59844         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59734         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59394         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47456        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:46518        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59442         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46740        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59478         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59516         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59446         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59584         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46804        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60042         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60176         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:53534         127.0.0.1:6379          ESTABLISHED\ntcp        0      0 127.0.0.1:53526         127.0.0.1:6379          ESTABLISHED\ntcp        0      0 127.0.0.1:60170         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59948         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59702         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47446        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59936         127.0.0.1:50001         TIME_WAIT  \ntcp        0      1 172.18.0.3:39424        25.25.205.32:80         SYN_SENT   \ntcp        0      0 127.0.0.1:60226         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59518         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47346        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59340         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60026         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59800         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60106         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59378         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59590         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60206         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59434         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59368         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59310         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60124         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59826         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59658         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59818         127.0.0.1:50001         ESTABLISHED\ntcp        0      0 127.0.0.1:59294         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60008         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60120         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47286        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59998         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59880         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59972         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59894         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59430         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59564         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47242        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:50001         127.0.0.1:59744         ESTABLISHED\ntcp        0      0 127.0.0.1:60110         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59984         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:50001         127.0.0.1:60266         ESTABLISHED\ntcp        0      0 127.0.0.1:60054         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60050         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59674         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60192         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46936        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59362         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60210         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59914         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60036         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59468         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59994         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59764         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60134         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59864         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59824         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59438         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59684         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59704         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46650        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59740         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59414         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47134        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60136         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46910        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60220         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59594         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59612         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59798         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59982         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60126         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59514         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60138         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59578         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60214         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59754         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60228         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59922         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59520         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60258         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59350         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60104         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:6379          127.0.0.1:53532         ESTABLISHED\ntcp        0      0 127.0.0.1:59376         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59244         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59810         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59838         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46460        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59474         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59772         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59428         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59600         127.0.0.1:50001         ESTABLISHED\ntcp        0      0 127.0.0.1:59356         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59924         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60090         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59624         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59586         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59910         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59832         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46432        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59902         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59426         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60222         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60218         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59912         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59410         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59856         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60180         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59980         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60164         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59950         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59780         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47476        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60096         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59732         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59312         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59374         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47454        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59890         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59932         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60012         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60200         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60160         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59418         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59708         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59300         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59302         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59372         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60148         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59264         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:53532         127.0.0.1:6379          ESTABLISHED\ntcp        0      0 172.18.0.3:47048        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60150         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60178         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46730        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59620         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59360         127.0.0.1:50001         TIME_WAIT  \ntcp        0     89 127.0.0.1:60266         127.0.0.1:50001         ESTABLISHED\ntcp        0      0 127.0.0.1:59270         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59422         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60128         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47464        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59260         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46848        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59388         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46790        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59680         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59778         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60034         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60146         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59908         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46688        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60186         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47098        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59662         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59776         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46736        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59958         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59650         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59588         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59738         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59454         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59728         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60182         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59276         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59642         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59686         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60108         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59796         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46944        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:46690        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59424         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60240         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59354         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60238         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59440         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59602         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60184         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59970         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59384         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60232         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59746         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47100        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59560         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59946         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59882         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46450        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60130         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59472         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59246         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59688         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59570         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59552         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60040         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59930         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59328         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59928         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59274         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59504         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60046         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46678        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59888         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59396         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60070         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60018         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60204         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59848         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60064         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59720         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60190         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47472        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59804         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46742        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:46828        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59502         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59506         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59308         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46960        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59670         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59526         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59332         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59774         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59342         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60208         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59320         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47186        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59608         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59786         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59944         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60032         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59592         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60224         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59512         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59628         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59392         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59476         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59706         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59380         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59278         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59304         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60234         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59400         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59444         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60100         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59290         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59348         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59942         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:50001         127.0.0.1:59630         ESTABLISHED\ntcp        0      0 127.0.0.1:59568         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60088         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59470         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60168         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60198         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59768         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60236         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59412         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59618         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59822         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59240         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46684        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60140         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59964         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59236         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59528         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59540         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59886         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59820         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59562         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59644         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60060         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60000         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59638         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59566         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60212         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59884         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60084         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59664         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59382         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59788         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59532         127.0.0.1:50001         TIME_WAIT  \ntcp        0      5 127.0.0.1:6379          127.0.0.1:53526         ESTABLISHED\ntcp        0      0 172.18.0.3:46428        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59386         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60038         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59640         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59900         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46412        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:46862        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:47006        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59988         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59346         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60058         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59622         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59556         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59402         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59748         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59326         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60144         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59816         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46768        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59682         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59366         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60264         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59480         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59784         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46686        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:46738        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:46918        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59334         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59656         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46986        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59432         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59582         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59530         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59510         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59696         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59866         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59404         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59632         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59954         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60286         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60094         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46532        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60010         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59834         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:50001         127.0.0.1:59600         ESTABLISHED\ntcp        0      0 127.0.0.1:60132         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59660         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60052         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60254         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60162         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60080         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59842         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60280         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47054        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 172.18.0.3:46872        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59538         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59652         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46510        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59646         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60022         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60014         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59990         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60202         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47350        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59630         127.0.0.1:50001         ESTABLISHED\ntcp        0      0 127.0.0.1:59782         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59878         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60016         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59916         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59762         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59296         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60272         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59960         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59580         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46456        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60122         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60174         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59862         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59522         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60244         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59466         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59846         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60158         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59756         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59968         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59690         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46820        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59918         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59524         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59452         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59614         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60284         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60194         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59938         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59390         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60112         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59242         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60072         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46446        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59370         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59436         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59712         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59604         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60066         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59758         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60154         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59450         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59358         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59952         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59830         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59616         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59550         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60114         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:50001         127.0.0.1:59852         ESTABLISHED\ntcp        0      0 127.0.0.1:59352         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59920         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60028         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59828         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59736         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60024         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46830        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59558         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59730         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59272         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60166         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59996         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46658        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59760         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59986         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46442        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60030         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59676         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59794         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:47030        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59554         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60098         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60142         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59790         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60082         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59850         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59744         127.0.0.1:50001         ESTABLISHED\ntcp        0      0 127.0.0.1:59898         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46448        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:60006         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59420         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60118         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60068         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60230         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59806         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60188         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59488         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59282         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59966         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59710         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59956         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46538        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59770         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59314         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59398         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59852         127.0.0.1:50001         ESTABLISHED\ntcp        0      0 127.0.0.1:59874         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46452        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59306         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59726         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60002         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60116         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59926         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59672         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46444        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59752         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59322         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60004         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59962         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60020         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59976         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60246         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59808         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59698         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59508         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46524        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59572         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60102         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59840         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59974         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59802         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46530        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59872         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59288         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59692         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 172.18.0.3:46908        172.18.0.2:5432         TIME_WAIT  \ntcp        0      0 127.0.0.1:59892         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59858         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59268         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:60248         127.0.0.1:50001         TIME_WAIT  \ntcp        0      0 127.0.0.1:59934         127.0.0.1:50001         TIME_WAIT  \ntcp6       0      0 :::6379                 :::*                    LISTEN     \n"
    }
}
```

# /api/v1/management/nslookup

## POST

数据格式

> dns 不填就使用系统的dns

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | 最大长度: 128;  | 
|dns | 字符串 | 非必填/'' | False | 最小长度: 0；  | 



### nslookup



请求

```js
{
    "hostname": "baidu.com"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "output": "Server:\t\t10.2.255.2\nAddress:\t10.2.255.2#53\n\nNon-authoritative answer:\nbaidu.com\ttext = \"google-site-verification=GHb98-6msqyx_qqjGl5eRatD3QTHyVB6-xQ3gJB5UwM\"\nbaidu.com\ttext = \"v=spf1 include:spf1.baidu.com include:spf2.baidu.com include:spf3.baidu.com a mx ptr -all\"\nbaidu.com\tnameserver = dns.baidu.com.\nbaidu.com\tnameserver = ns2.baidu.com.\nbaidu.com\tnameserver = ns7.baidu.com.\nbaidu.com\tnameserver = ns3.baidu.com.\nbaidu.com\tnameserver = ns4.baidu.com.\n\nAuthoritative answers can be found from:\n\n"
    }
}
```

# /api/v1/management/traceroute

## GET



### 获取 traceroute 的输出，本 api 可以轮询，直到 processing == false



请求

```js
{
    "id": "680c7a49cbb08fce44e8633652b2e300"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "output": "traceroute: unknown host\n",
        "processing": true
    }
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|hostname | 字符串 | 必填 | False | 最大长度: 128;  | 



### 提交 traceroute 任务



请求

```js
{
    "hostname": "safeline-test.in.chaitin.com"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": "b3fc28a2e88fde1d10c1051c3465d654"
    }
}
```

# /api/v1/management/ntp_config

## GET



### 获取 ntp 配置



响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "enabled": true,
        "servers": [
            "ntp.foobar.com"
        ]
    }
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|enabled | 布尔 | 必填 | False |  -  | 
|servers | 列表 | 非必填/<class 'list'> | False |  - 详见下方表格 | 

servers

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 



### 设置 ntp server



请求

```js
{
    "enabled": true,
    "servers": [
        "ntp.foobar.com"
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

