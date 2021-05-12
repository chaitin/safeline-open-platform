# /api/ACLRuleTemplateAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#dmwhrkmldcazoturonuyxoksfqvelzho) | 

<a id="dmwhrkmldcazoturonuyxoksfqvelzho">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 查询 acl template



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 15,
            "name": "test",
            "version": 21,
            "is_enabled": true,
            "match_method": {
                "limit": 20,
                "scope": "URL Prefix",
                "period": 10,
                "policy": "http://example.com",
                "target_type": "CIDR"
            },
            "action": {
                "action": "forbid"
            },
            "create_time": "1544513514",
            "expire_period": null,
            "execution_number": 0,
            "template_type": "auto"
        },
        {
            "id": 14,
            "name": "test",
            "version": 20,
            "is_enabled": true,
            "match_method": {
                "limit": null,
                "scope": "URL Prefix",
                "period": null,
                "policy": "http://example.com",
                "target_type": "CIDR"
            },
            "action": {
                "action": "forbid"
            },
            "create_time": "1544513514",
            "expire_period": null,
            "execution_number": 0,
            "template_type": "manual"
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
|name | 字符串 | 必填 | False |  -  | 
|match_method | OneOf 类型 | - | - | [详见下方表格](#aszgclutcoapcgpkpcrrxqqcvjnwhapj) | 
|action | OneOf 类型 | - | - | [详见下方表格](#olqktnaqyzbpmihvcxezwnbjkjfjcctf) | 
|expire_period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|targets | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#dobvmndjcoqelpxkqayvqqllxxxpqcph) | 
|template_type | 指定选项 | 必填 | False | 选项是: ['manual', 'auto'] | 

<a id="aszgclutcoapcgpkpcrrxqqcvjnwhapj">1. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#hkzhdlmcxhteekrjrwcwzncgkewvuawo) | 

<a id="hkzhdlmcxhteekrjrwcwzncgkewvuawo">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['All'] | 


<a id="aszgclutcoapcgpkpcrrxqqcvjnwhapj">2. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#xkxbnyvaggziekmitjtlhluuwiglsbxd) | 

<a id="xkxbnyvaggziekmitjtlhluuwiglsbxd">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['URL'] | 
|policy | 字符串 | 必填 | False | URL;  | 


<a id="aszgclutcoapcgpkpcrrxqqcvjnwhapj">3. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#lokvzhdpgjvrmghpmirownurqmdhhzrl) | 

<a id="lokvzhdpgjvrmghpmirownurqmdhhzrl">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['URL Prefix'] | 
|policy | 字符串 | 必填 | False | URL;  | 


<a id="olqktnaqyzbpmihvcxezwnbjkjfjcctf">1. action</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#norrlhqenmgjmdnubxplritdvqypxegh) | 

<a id="norrlhqenmgjmdnubxplritdvqypxegh">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['forbid'] | 


<a id="olqktnaqyzbpmihvcxezwnbjkjfjcctf">2. action</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#dggjxijrywfgsgvyqfwnzuudtjvusnwx) | 

<a id="dggjxijrywfgsgvyqfwnzuudtjvusnwx">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['Limit Rate'] | 
|limit_rate_limit | 整型数字 | 必填 | False | 最小值: 1;  | 
|limit_rate_period | 整型数字 | 必填 | False | 最小值: 1;  | 


<a id="dobvmndjcoqelpxkqayvqqllxxxpqcph">targets</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 创建规则（封禁已知用户）



请求

```js
{
    "name": "test",
    "match_method": {
        "target_type": "CIDR",
        "period": 10,
        "limit": 20,
        "scope": "URL Prefix",
        "policy": "http://example.com"
    },
    "action": {
        "action": "forbid"
    },
    "template_type": "manual",
    "targets": [
        "1.2.3.4"
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 8,
        "name": "test",
        "version": 13,
        "is_enabled": true,
        "match_method": {
            "target_type": "CIDR",
            "period": null,
            "limit": null,
            "scope": "URL Prefix",
            "policy": "http://example.com"
        },
        "action": {
            "action": "forbid"
        },
        "create_time": "1544513512",
        "expire_period": null,
        "execution_number": 0,
        "template_type": "manual"
    },
    "msg": null
}
```

### - 创建自动封禁规则 （封禁符合条件的用户）



请求

```js
{
    "name": "test",
    "match_method": {
        "target_type": "CIDR",
        "period": 10,
        "limit": 20,
        "scope": "URL Prefix",
        "policy": "http://example.com"
    },
    "action": {
        "action": "forbid"
    },
    "template_type": "auto"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 9,
        "name": "test",
        "version": 14,
        "is_enabled": true,
        "match_method": {
            "target_type": "CIDR",
            "period": 10,
            "limit": 20,
            "scope": "URL Prefix",
            "policy": "http://example.com"
        },
        "action": {
            "action": "forbid"
        },
        "create_time": "1544513512",
        "expire_period": null,
        "execution_number": 0,
        "template_type": "auto"
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
|match_method | OneOf 类型 | - | - | [详见下方表格](#eraezithgpirnrjwnslmewjwfdspidpu) | 
|action | OneOf 类型 | - | - | [详见下方表格](#nocestxgapcryqauadcfyoixrlhjcpyn) | 
|expire_period | 整型数字 | 非必填/None | True | 最小值: 1;  | 

<a id="eraezithgpirnrjwnslmewjwfdspidpu">1. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#zfkzklaelbvsatakomxntmpvhkvngnxz) | 

<a id="zfkzklaelbvsatakomxntmpvhkvngnxz">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['All'] | 


<a id="eraezithgpirnrjwnslmewjwfdspidpu">2. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#aydrcfopmyynzsmdfjvowxsvqmzqtgnx) | 

<a id="aydrcfopmyynzsmdfjvowxsvqmzqtgnx">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['URL'] | 
|policy | 字符串 | 必填 | False | URL;  | 


<a id="eraezithgpirnrjwnslmewjwfdspidpu">3. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#trbnekwyckntsfpkznjypvlizhcdhgfa) | 

<a id="trbnekwyckntsfpkznjypvlizhcdhgfa">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['URL Prefix'] | 
|policy | 字符串 | 必填 | False | URL;  | 


<a id="nocestxgapcryqauadcfyoixrlhjcpyn">1. action</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#jpbmrnchdjswhhiernxgpszrrgorvbsm) | 

<a id="jpbmrnchdjswhhiernxgpszrrgorvbsm">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['forbid'] | 


<a id="nocestxgapcryqauadcfyoixrlhjcpyn">2. action</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#usmpudjbzbwmlapocopvrzlzlfyfuiyr) | 

<a id="usmpudjbzbwmlapocopvrzlzlfyfuiyr">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['Limit Rate'] | 
|limit_rate_limit | 整型数字 | 必填 | False | 最小值: 1;  | 
|limit_rate_period | 整型数字 | 必填 | False | 最小值: 1;  | 

### 权限
 - Website And Security Policy Management

### - 编辑 acl template



请求

```js
{
    "name": "test",
    "match_method": {
        "target_type": "CIDR",
        "period": 10,
        "limit": 20,
        "scope": "URL Prefix",
        "policy": "http://foobar.com"
    },
    "action": {
        "action": "forbid"
    },
    "template_type": "manual",
    "targets": [
        "1.2.3.4"
    ],
    "id": 12
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 12,
        "name": "test",
        "version": 18,
        "is_enabled": true,
        "match_method": {
            "target_type": "CIDR",
            "period": 10,
            "limit": 20,
            "scope": "URL Prefix",
            "policy": "http://foobar.com"
        },
        "action": {
            "action": "forbid"
        },
        "create_time": "1544513513",
        "expire_period": null,
        "execution_number": 0,
        "template_type": "auto"
    },
    "msg": null
}
```

# /api/ClearACLRuleAPI

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|acl_rule_template_id | 整型数字 | 必填 | False |  -  | 
|add_to_white_list | 布尔 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 清空 acl rule template 的所有目标



请求

```js
{
    "acl_rule_template_id": 6,
    "add_to_white_list": true
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

# /api/ACLRuleAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|acl_rule_template_id | 整型数字 | 非必填/无默认值 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 获取 acl template 的 acl rule



?> 本 API 支持翻页参数

请求

```js
{
    "acl_rule_template_id": 13
}
```

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 12,
            "target": "1.2.3.4",
            "expire_time": null
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
|acl_rule_template_id | 整型数字 | 必填 | False |  -  | 
|acl_rule_template_version | 整型数字 | 非必填/无默认值 | False | 最小值: 0;  | 
|targets | 列表 | 必填 | False | [ -  详见下方表格](#gmoitcpwlnkoafhvuqqcyrkpqkcxilad) | 

<a id="gmoitcpwlnkoafhvuqqcyrkpqkcxilad">targets</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 创建 acl rule



请求

```js
{
    "acl_rule_template_id": 7,
    "targets": [
        "2.3.4.5"
    ]
}
```

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 8,
            "target": "2.3.4.5",
            "expire_time": null
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
|id | 整型数字 | 必填 | False |  -  | 
|add_to_white_list | 布尔 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除 acl rule



请求

```js
{
    "id": 11,
    "add_to_white_list": true
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

# /api/MarioACLRuleAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|acl_rule_template_id | 整型数字 | 必填 | False |  -  | 
|acl_rule_template_version | 整型数字 | 非必填/无默认值 | False | 最小值: 0;  | 
|targets | 列表 | 必填 | False | [ -  详见下方表格](#ynzniuqvrhoyfwsmfamzbrgbuusuuhsk) | 

<a id="ynzniuqvrhoyfwsmfamzbrgbuusuuhsk">targets</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Minion

### - mario 创建 acl rule



请求

```js
{
    "acl_rule_template_id": 16,
    "acl_rule_template_version": 22,
    "targets": [
        "1.2.3.4",
        "2.3.4.5"
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

# /api/PluginACLRuleTemplateAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|name | 字符串 | 必填 | False |  -  | 
|match_method | OneOf 类型 | - | - | [详见下方表格](#wejpveflnsrcqvuzxwqcczmzcedsbjhv) | 
|action | OneOf 类型 | - | - | [详见下方表格](#cqzkkvbrwcdwwteivimtxxevyqiibyde) | 
|expire_period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|targets | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#lwwqcjmfsgtumkkycussxclipuyfsikl) | 
|template_type | 指定选项 | 必填 | False | 选项是: ['plugin'] | 

<a id="wejpveflnsrcqvuzxwqcczmzcedsbjhv">1. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#gqrnpumkczbgdjqmqsttiaquuygoiext) | 

<a id="gqrnpumkczbgdjqmqsttiaquuygoiext">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['All'] | 


<a id="wejpveflnsrcqvuzxwqcczmzcedsbjhv">2. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#ezemiwrtztskandyxjshpwwanuyehvmt) | 

<a id="ezemiwrtztskandyxjshpwwanuyehvmt">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['URL'] | 
|policy | 字符串 | 必填 | False | URL;  | 


<a id="wejpveflnsrcqvuzxwqcczmzcedsbjhv">3. match_method</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#fxfkeeyopmctkrtrnoucjhexpwnpugow) | 

<a id="fxfkeeyopmctkrtrnoucjhexpwnpugow">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|period | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|limit | 整型数字 | 非必填/None | True | 最小值: 1;  | 
|scope | 指定选项 | 必填 | False | 选项是: ['URL Prefix'] | 
|policy | 字符串 | 必填 | False | URL;  | 


<a id="cqzkkvbrwcdwwteivimtxxevyqiibyde">1. action</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#otwytofitfqmejzcybtvmvdcaiiadqzu) | 

<a id="otwytofitfqmejzcybtvmvdcaiiadqzu">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['forbid'] | 


<a id="cqzkkvbrwcdwwteivimtxxevyqiibyde">2. action</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字典 | - | - | [详见下方表格](#krpvmpqzacyqwjhuwpkvsahrlvringxw) | 

<a id="krpvmpqzacyqwjhuwpkvsahrlvringxw">子字段</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|action | 指定选项 | 必填 | False | 选项是: ['Limit Rate'] | 
|limit_rate_limit | 整型数字 | 必填 | False | 最小值: 1;  | 
|limit_rate_period | 整型数字 | 必填 | False | 最小值: 1;  | 


<a id="lwwqcjmfsgtumkkycussxclipuyfsikl">targets</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Minion

### - 插件创建 acl 规则

- name match_method action expire_period template_type 一致的话，会复用已有的 template id
         - IP/Session 存在白名单或者已经存在某条规则的时候会自动跳过

请求

```js
{
    "name": 1,
    "match_method": {
        "target_type": "CIDR",
        "scope": "URL Prefix",
        "policy": "http://example.com"
    },
    "action": {
        "action": "forbid"
    },
    "template_type": "plugin",
    "targets": [
        "1.2.3.4"
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 19,
        "name": "Generated by plugin [foobar]",
        "version": 25,
        "is_enabled": true,
        "match_method": {
            "target_type": "CIDR",
            "period": null,
            "limit": null,
            "scope": "URL Prefix",
            "policy": "http://example.com"
        },
        "action": {
            "action": "forbid"
        },
        "create_time": "1544513516",
        "expire_period": null,
        "execution_number": 0,
        "template_type": "plugin"
    },
    "msg": null
}
```

# /api/ACLWhiteListAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|target_type | 指定选项 | 非必填/无默认值 | False | 选项是: ['CIDR', 'Session'] | 
|target | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#lrcmnjwuheecrchrhzarzlhtjwlensla) | 
|comment__like | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#slcoobpiosumzqkusvusqrtrbflatbmu) | 

<a id="lrcmnjwuheecrchrhzarzlhtjwlensla">target</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="slcoobpiosumzqkusvusqrtrbflatbmu">comment__like</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 查询 acl white list



?> 本 API 支持翻页参数

请求

```js
{
    "target_type": [
        "Session"
    ],
    "target": [
        "foo"
    ]
}
```

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
|comment | 字符串 | 必填 | False | 最小长度: 0；  | 
|target_type | 指定选项 | 必填 | False | 选项是: ['CIDR', 'Session'] | 
|target_list | 列表 | 必填 | False | [ -  详见下方表格](#njwphdnqkabwopawfigzejhljnnkcngi) | 

<a id="njwphdnqkabwopawfigzejhljnnkcngi">target_list</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 创建 cidr 类型的 acl 白名单



请求

```js
{
    "target_type": "CIDR",
    "target_list": [
        "1.2.3.4",
        "192.168.1.0/32"
    ],
    "comment": "test"
}
```

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 4,
            "target": "1.2.3.4",
            "target_type": "CIDR",
            "comment": "test",
            "create_time": "1544513515"
        },
        {
            "id": 5,
            "target": "192.168.1.0/32",
            "target_type": "CIDR",
            "comment": "test",
            "create_time": "1544513515"
        }
    ],
    "msg": null
}
```

### - 创建 session 类型的 acl 白名单



请求

```js
{
    "target_type": "Session",
    "target_list": [
        "foobar",
        "example"
    ],
    "comment": "test"
}
```

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 6,
            "target": "foobar",
            "target_type": "Session",
            "comment": "test",
            "create_time": "1544513515"
        },
        {
            "id": 7,
            "target": "example",
            "target_type": "Session",
            "comment": "test",
            "create_time": "1544513515"
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
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#ivmigodstsytxttmjbicemdpbljcledg) | 

<a id="ivmigodstsytxttmjbicemdpbljcledg">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 删除 acl white list



请求

```js
{
    "id": [
        8
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

# /api/ACLRuleExecutionLogAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#qmbyczsbfnhhpoevfwooruidzakcwdvo) | 
|timestamp__range | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#cebqkhkahtnzexjwitkbycmpwrizhzdp) | 
|acl_rule_id | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#slpnhnjawuihfsvbqvwuazzyvywgoqjl) | 
|acl_rule_template_id | 列表 | 非必填/无默认值 | False | [ -  详见下方表格](#xxmzzuvyneozszadsysyigdlsnjdvsrb) | 

<a id="qmbyczsbfnhhpoevfwooruidzakcwdvo">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="cebqkhkahtnzexjwitkbycmpwrizhzdp">timestamp__range</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 


<a id="slpnhnjawuihfsvbqvwuazzyvywgoqjl">acl_rule_id</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="xxmzzuvyneozszadsysyigdlsnjdvsrb">acl_rule_template_id</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 

### 权限
 - Website And Security Policy Management

### - 查询 acl 日志统计数据



?> 本 API 支持翻页参数

请求

```js
{
    "total": 100,
    "count": 100
}
```

响应

```js
{
    "err": null,
    "data": {
        "items": [
            {
                "id": 8,
                "acl_rule_id": 4,
                "acl_rule_template_id": 4,
                "acl_rule_template_version": 8,
                "timestamp": "1544513100",
                "count": 1000,
                "acl_rule_target": "1.2.3.4",
                "acl_rule_template": {
                    "name": "test",
                    "match_method": {
                        "limit": 20,
                        "scope": "URL Prefix",
                        "period": 10,
                        "policy": "http://foobar.com",
                        "target_type": "CIDR"
                    },
                    "action": {
                        "action": "forbid"
                    },
                    "status": "ok"
                }
            },
            {
                "id": 7,
                "acl_rule_id": 4,
                "acl_rule_template_id": 4,
                "acl_rule_template_version": 7,
                "timestamp": "1544513100",
                "count": 200,
                "acl_rule_target": "1.2.3.4",
                "acl_rule_template": {
                    "name": "test",
                    "match_method": {
                        "limit": null,
                        "scope": "URL Prefix",
                        "period": null,
                        "policy": "http://example.com",
                        "target_type": "CIDR"
                    },
                    "action": {
                        "action": "forbid"
                    },
                    "status": "edited"
                }
            },
            {
                "id": 6,
                "acl_rule_id": 4,
                "acl_rule_template_id": 4,
                "acl_rule_template_version": 8,
                "timestamp": "1544512800",
                "count": 1000,
                "acl_rule_target": "1.2.3.4",
                "acl_rule_template": {
                    "name": "test",
                    "match_method": {
                        "limit": 20,
                        "scope": "URL Prefix",
                        "period": 10,
                        "policy": "http://foobar.com",
                        "target_type": "CIDR"
                    },
                    "action": {
                        "action": "forbid"
                    },
                    "status": "ok"
                }
            },
            {
                "id": 5,
                "acl_rule_id": 4,
                "acl_rule_template_id": 4,
                "acl_rule_template_version": 7,
                "timestamp": "1544512800",
                "count": 200,
                "acl_rule_target": "1.2.3.4",
                "acl_rule_template": {
                    "name": "test",
                    "match_method": {
                        "limit": null,
                        "scope": "URL Prefix",
                        "period": null,
                        "policy": "http://example.com",
                        "target_type": "CIDR"
                    },
                    "action": {
                        "action": "forbid"
                    },
                    "status": "edited"
                }
            }
        ],
        "total": 4
    },
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|timestamp | 浮点数字 | 必填 | False |  -  | 
|rule_id_list | 列表 | 必填 | False | [ -  详见下方表格](#omeclpjxbkgvxvfbgqfqnoayvktslofc) | 
|count_list | 列表 | 必填 | False | [ -  详见下方表格](#khrkjpgigqnxoacpomtqrlngyzaigrzo) | 

<a id="omeclpjxbkgvxvfbgqfqnoayvktslofc">rule_id_list</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="khrkjpgigqnxoacpomtqrlngyzaigrzo">count_list</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False | 最小值: 0;  | 

### 权限
 - Minion

### - minion 发送 acl 日志统计数据



请求

```js
{
    "timestamp": 1544513220,
    "rule_id_list": [
        "1:1:1",
        "1:1:2"
    ],
    "count_list": [
        100,
        700
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

# /api/ACLDataAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|timestamp | 整型数字 | 必填 | False |  -  | 
|top_ip | 字典 | - | - | [详见下方表格](#ajntgxbcnhetgkwkdjxptxddailvezgm) | 
|top_ip_website | 字典 | - | - | [详见下方表格](#lzewwtgcpytztsmqbmzcivoqzoemmhhf) | 
|top_ip_url | 字典 | - | - | [详见下方表格](#mayhcllskqepqqwawqbzcfafztlpkpti) | 
|top_session | 字典 | - | - | [详见下方表格](#anwidvhlcneoymzjxejjzzcbjwjigihu) | 
|top_session_website | 字典 | - | - | [详见下方表格](#izmsfnadqpkctwxhcqcqqikazangymjh) | 
|top_session_url | 字典 | - | - | [详见下方表格](#rlxihlmlcqanlnplogqlgpypxfippkid) | 

<a id="ajntgxbcnhetgkwkdjxptxddailvezgm">top_ip</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|count | 列表 | 必填 | False | [ -  详见下方表格](#fgrnwvwekmpgkwpswhdwvnuajvjjufwe) | 
|time | 列表 | 必填 | False | [ -  详见下方表格](#ofcboplxekwachstymozyuxacqcmbhrr) | 
|ip | 列表 | 必填 | False | [ -  详见下方表格](#cufygbvgiqwjuvadtupxedyvmqiujdbx) | 

<a id="fgrnwvwekmpgkwpswhdwvnuajvjjufwe">count</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="ofcboplxekwachstymozyuxacqcmbhrr">time</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 浮点数字 | 必填 | False |  -  | 


<a id="cufygbvgiqwjuvadtupxedyvmqiujdbx">ip</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="lzewwtgcpytztsmqbmzcivoqzoemmhhf">top_ip_website</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|count | 列表 | 必填 | False | [ -  详见下方表格](#iqhihhdqnlbqlswlrsckrmvmgbyfvaav) | 
|time | 列表 | 必填 | False | [ -  详见下方表格](#kgbtfvlesldalrbpduoviphvgwuydsre) | 
|ip | 列表 | 必填 | False | [ -  详见下方表格](#lydzzxerqundngfjqzfyytighfhoxrhl) | 
|website | 列表 | 必填 | False | [ -  详见下方表格](#ltmlegipvvnxtowztvusrbzbdfovwusr) | 

<a id="iqhihhdqnlbqlswlrsckrmvmgbyfvaav">count</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="kgbtfvlesldalrbpduoviphvgwuydsre">time</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 浮点数字 | 必填 | False |  -  | 


<a id="lydzzxerqundngfjqzfyytighfhoxrhl">ip</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="ltmlegipvvnxtowztvusrbzbdfovwusr">website</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="mayhcllskqepqqwawqbzcfafztlpkpti">top_ip_url</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|count | 列表 | 必填 | False | [ -  详见下方表格](#xkcophbbdlxqvbuoobfebrpmrgldmqrf) | 
|time | 列表 | 必填 | False | [ -  详见下方表格](#gwuovcbshntqprztfiddrqlurfwbcppe) | 
|ip | 列表 | 必填 | False | [ -  详见下方表格](#rsmhtvbcscculaxbczjwsnbgghjircgt) | 
|url | 列表 | 必填 | False | [ -  详见下方表格](#nspkwckegodeisugjzwrbbmmdvwfgomh) | 

<a id="xkcophbbdlxqvbuoobfebrpmrgldmqrf">count</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="gwuovcbshntqprztfiddrqlurfwbcppe">time</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 浮点数字 | 必填 | False |  -  | 


<a id="rsmhtvbcscculaxbczjwsnbgghjircgt">ip</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="nspkwckegodeisugjzwrbbmmdvwfgomh">url</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="anwidvhlcneoymzjxejjzzcbjwjigihu">top_session</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|count | 列表 | 必填 | False | [ -  详见下方表格](#sqamexaghcqffldckfmqaveigluikljl) | 
|time | 列表 | 必填 | False | [ -  详见下方表格](#kzxmuqoazpiriqpucwupniiimgszbmgn) | 
|session | 列表 | 必填 | False | [ -  详见下方表格](#ddqhepxhufkxtgsrqgszziwhraipwdug) | 

<a id="sqamexaghcqffldckfmqaveigluikljl">count</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="kzxmuqoazpiriqpucwupniiimgszbmgn">time</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 浮点数字 | 必填 | False |  -  | 


<a id="ddqhepxhufkxtgsrqgszziwhraipwdug">session</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="izmsfnadqpkctwxhcqcqqikazangymjh">top_session_website</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|count | 列表 | 必填 | False | [ -  详见下方表格](#myrrcqondxhacoayrwydtuyzhcdacujw) | 
|time | 列表 | 必填 | False | [ -  详见下方表格](#ceguimaphnggqcvkyynzmijvfeospypo) | 
|session | 列表 | 必填 | False | [ -  详见下方表格](#aansdblxsvwdtufxqiddhcjrjowwzrhv) | 
|website | 列表 | 必填 | False | [ -  详见下方表格](#iinvlasnljmwvrsxwnlwibzaownoabjo) | 

<a id="myrrcqondxhacoayrwydtuyzhcdacujw">count</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="ceguimaphnggqcvkyynzmijvfeospypo">time</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 浮点数字 | 必填 | False |  -  | 


<a id="aansdblxsvwdtufxqiddhcjrjowwzrhv">session</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="iinvlasnljmwvrsxwnlwibzaownoabjo">website</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="rlxihlmlcqanlnplogqlgpypxfippkid">top_session_url</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|count | 列表 | 必填 | False | [ -  详见下方表格](#bqwfbwapupkxzunaxganugqurowwkwkx) | 
|time | 列表 | 必填 | False | [ -  详见下方表格](#zrpfzpgzntxkqykpitqaxcslnztazbwq) | 
|session | 列表 | 必填 | False | [ -  详见下方表格](#yexneemwgdcpvqngknrjxsjvfqyhnhrk) | 
|url | 列表 | 必填 | False | [ -  详见下方表格](#psplqqejuuandohufhmlodbkrslgtepa) | 

<a id="bqwfbwapupkxzunaxganugqurowwkwkx">count</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="zrpfzpgzntxkqykpitqaxcslnztazbwq">time</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 浮点数字 | 必填 | False |  -  | 


<a id="yexneemwgdcpvqngknrjxsjvfqyhnhrk">session</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="psplqqejuuandohufhmlodbkrslgtepa">url</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - Minion

### - mario 发送 acl 访问统计数据



请求

```js
{
    "timestamp": 1544513507,
    "top_ip": {
        "count": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10
        ],
        "ip": [
            "1.2.3.1",
            "1.2.3.2",
            "1.2.3.3",
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6",
            "1.2.3.7",
            "1.2.3.8",
            "1.2.3.9",
            "1.2.3.10"
        ],
        "time": [
            15,
            60,
            135,
            240,
            375,
            540,
            735,
            960,
            1215,
            1500
        ]
    },
    "top_ip_website": {
        "count": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10
        ],
        "ip": [
            "1.2.3.1",
            "1.2.3.2",
            "1.2.3.3",
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6",
            "1.2.3.7",
            "1.2.3.8",
            "1.2.3.9",
            "1.2.3.10"
        ],
        "time": [
            15,
            60,
            135,
            240,
            375,
            540,
            735,
            960,
            1215,
            1500
        ],
        "website": [
            "http://example1.com",
            "http://example2.com",
            "http://example3.com",
            "http://example4.com",
            "http://example5.com",
            "http://example6.com",
            "http://example7.com",
            "http://example8.com",
            "http://example9.com",
            "http://example10.com"
        ]
    },
    "top_ip_url": {
        "count": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10
        ],
        "ip": [
            "1.2.3.1",
            "1.2.3.2",
            "1.2.3.3",
            "1.2.3.4",
            "1.2.3.5",
            "1.2.3.6",
            "1.2.3.7",
            "1.2.3.8",
            "1.2.3.9",
            "1.2.3.10"
        ],
        "time": [
            15,
            60,
            135,
            240,
            375,
            540,
            735,
            960,
            1215,
            1500
        ],
        "url": [
            "http://example.com/u/1",
            "http://example.com/u/2",
            "http://example.com/u/3",
            "http://example.com/u/4",
            "http://example.com/u/5",
            "http://example.com/u/6",
            "http://example.com/u/7",
            "http://example.com/u/8",
            "http://example.com/u/9",
            "http://example.com/u/10"
        ]
    },
    "top_session": {
        "count": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10
        ],
        "session": [
            "sess1",
            "sess2",
            "sess3",
            "sess4",
            "sess5",
            "sess6",
            "sess7",
            "sess8",
            "sess9",
            "sess10"
        ],
        "time": [
            15,
            60,
            135,
            240,
            375,
            540,
            735,
            960,
            1215,
            1500
        ]
    },
    "top_session_website": {
        "count": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10
        ],
        "session": [
            "sess1",
            "sess2",
            "sess3",
            "sess4",
            "sess5",
            "sess6",
            "sess7",
            "sess8",
            "sess9",
            "sess10"
        ],
        "time": [
            15,
            60,
            135,
            240,
            375,
            540,
            735,
            960,
            1215,
            1500
        ],
        "website": [
            "http://example1.com",
            "http://example2.com",
            "http://example3.com",
            "http://example4.com",
            "http://example5.com",
            "http://example6.com",
            "http://example7.com",
            "http://example8.com",
            "http://example9.com",
            "http://example10.com"
        ]
    },
    "top_session_url": {
        "count": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10
        ],
        "session": [
            "sess1",
            "sess2",
            "sess3",
            "sess4",
            "sess5",
            "sess6",
            "sess7",
            "sess8",
            "sess9",
            "sess10"
        ],
        "time": [
            15,
            60,
            135,
            240,
            375,
            540,
            735,
            960,
            1215,
            1500
        ],
        "url": [
            "http://example.com/u/1",
            "http://example.com/u/2",
            "http://example.com/u/3",
            "http://example.com/u/4",
            "http://example.com/u/5",
            "http://example.com/u/6",
            "http://example.com/u/7",
            "http://example.com/u/8",
            "http://example.com/u/9",
            "http://example.com/u/10"
        ]
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

