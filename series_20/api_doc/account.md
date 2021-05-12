# /api/LoginAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|tfa_token | 字符串 | 非必填/'' | False | 两步验证验证码; 最小长度: 0；  | 
|username | 字符串 | 必填 | False |  -  | 
|password | 字符串 | 必填 | False |  -  | 

?> 不需要登录

### - 密码登录



请求

```js
{
    "username": "admin",
    "password": "admin@password"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 15,
        "is_locked": false,
        "ip_policy": [],
        "last_login": "1544513489",
        "username": "admin",
        "comment": "",
        "tfa_enabled": false,
        "create_time": "1544513489",
        "last_update_time": "1544513489",
        "last_login_time": "1544513489",
        "last_change_password_time": "1544513489",
        "permissions": [
            "System Monitor",
            "System Management",
            "User Management",
            "Website And Security Policy Management",
            "Audit Log Management"
        ],
        "authentication_method": "password",
        "session_timeout_time": 172800
    },
    "msg": null
}
```

### - 使用两步验证登录，验证通过



请求

```js
{
    "username": "admin",
    "password": "admin@password",
    "tfa_token": "foobar"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 18,
        "is_locked": false,
        "ip_policy": [],
        "last_login": "1544513491",
        "username": "admin",
        "comment": "",
        "tfa_enabled": true,
        "create_time": "1544513490",
        "last_update_time": "1544513490",
        "last_login_time": "1544513491",
        "last_change_password_time": "1544513490",
        "permissions": [
            "System Monitor",
            "System Management",
            "User Management",
            "Website And Security Policy Management",
            "Audit Log Management"
        ],
        "authentication_method": "password",
        "session_timeout_time": 172800
    },
    "msg": null
}
```

### - 密码错误



请求

```js
{
    "username": "admin",
    "password": "admin@passwordfoobar"
}
```

响应

```js
{
    "err": "error",
    "msg": "Incorrect username or password"
}
```

### - 没有输入两步验证验证码



请求

```js
{
    "username": "admin",
    "password": "admin@password"
}
```

响应

```js
{
    "err": "tfa-required",
    "msg": "Please input two factor auth token"
}
```

# /api/CertLoginAPI

## GET

?> 不需要登录

### - 检查是否安装了证书，证书是否有效



响应

```js
{
    "err": null,
    "data": {
        "result": true
    },
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|tfa_token | 字符串 | 非必填/'' | False | 两步验证验证码; 最小长度: 0；  | 

?> 不需要登录

### - 正常登录



请求

```js
{}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 3,
        "is_locked": false,
        "ip_policy": [],
        "last_login": "1544513479",
        "username": "admin",
        "comment": "",
        "tfa_enabled": false,
        "create_time": "1544513479",
        "last_update_time": "1544513479",
        "last_login_time": "1544513479",
        "last_change_password_time": "1544513479",
        "permissions": [
            "System Monitor",
            "System Management",
            "User Management",
            "Website And Security Policy Management",
            "Audit Log Management"
        ],
        "authentication_method": "cert",
        "session_timeout_time": 172800
    },
    "msg": null
}
```

### - 使用两步验证登录，验证通过



请求

```js
{
    "tfa_token": "foobar"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 4,
        "is_locked": false,
        "ip_policy": [],
        "last_login": "1544513480",
        "username": "admin",
        "comment": "",
        "tfa_enabled": true,
        "create_time": "1544513479",
        "last_update_time": "1544513479",
        "last_login_time": "1544513480",
        "last_change_password_time": "1544513479",
        "permissions": [
            "System Monitor",
            "System Management",
            "User Management",
            "Website And Security Policy Management",
            "Audit Log Management"
        ],
        "authentication_method": "cert",
        "session_timeout_time": 172800
    },
    "msg": null
}
```

# /api/ResetUserCredentialAPI

## PUT

### [数据格式定义]
数据格式

> 只需要传递 ID

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 

### 权限
 - User Management

### - 管理员重置用户证书



请求

```js
{
    "id": 23
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 23,
            "is_locked": false,
            "ip_policy": [],
            "last_login": null,
            "username": "test",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513493",
            "last_update_time": "1544513493",
            "last_login_time": null,
            "last_change_password_time": "1544513493",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "cert",
            "session_timeout_time": 172800
        },
        "extra": {
            "token": "2081824916eaa700b5c9006ffa3697fb:1gWcVy:Dqg8yXQNexzNVjVL0HfenYURwOI",
            "password": "m7ezSC"
        }
    },
    "msg": null
}
```

### - 管理员重置用户密码



请求

```js
{
    "id": 25
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 25,
            "is_locked": false,
            "ip_policy": [],
            "last_login": null,
            "username": "test",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513494",
            "last_update_time": "1544513494",
            "last_login_time": null,
            "last_change_password_time": "1544513494",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
        },
        "extra": {
            "password": "v4DN0m"
        }
    },
    "msg": null
}
```

# /api/ChangeUserCredentialAPI

## PUT

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|authentication_method | 指定选项 | 必填 | False | 选项是: ['ldap', 'password', 'cert'] | 
|old_password | 字符串 | 非必填/'' | False | 最小长度: 0；  | 
|new_password | 字符串 | 非必填/'' | False | 最小长度: 0；  | 
|tfa_token | 字符串 | 非必填/'' | False | 最小长度: 0；  | 



### - 用户重新生成证书



请求

```js
{
    "authentication_method": "cert"
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 6,
            "is_locked": false,
            "ip_policy": [],
            "last_login": "1544513482",
            "username": "admin",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513480",
            "last_update_time": "1544513480",
            "last_login_time": "1544513482",
            "last_change_password_time": "1544513480",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "cert",
            "session_timeout_time": 172800
        },
        "extra": {
            "token": "a8aee7711c0c811d230c1ed52cc9e658:1gWcVm:hPP-lCq5AhY6xj0tf22xCoAZv9I",
            "password": "EHhhF8"
        }
    },
    "msg": null
}
```

### - 证书登录切换到密码登录



请求

```js
{
    "authentication_method": "password",
    "new_password": "somepassword@password"
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 7,
            "is_locked": false,
            "ip_policy": [],
            "last_login": "1544513483",
            "username": "admin",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513482",
            "last_update_time": "1544513482",
            "last_login_time": "1544513483",
            "last_change_password_time": "1544513484",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
        },
        "extra": {}
    },
    "msg": null
}
```

### - 密码登录切换到证书登录



请求

```js
{
    "authentication_method": "cert",
    "old_password": "testadmin@password"
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 8,
            "is_locked": false,
            "ip_policy": [],
            "last_login": "1544513484",
            "username": "admin",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513484",
            "last_update_time": "1544513484",
            "last_login_time": null,
            "last_change_password_time": "1544513484",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "cert",
            "session_timeout_time": 172800
        },
        "extra": {
            "token": "2ccd35345fbcba53d23e227dd8b90975:1gWcVp:4Cl9dl3sqW-km38RI_jcZ0ziP4I",
            "password": "IqsveW"
        }
    },
    "msg": null
}
```

### - 用户修改密码



请求

```js
{
    "authentication_method": "password",
    "old_password": "testadmin@password",
    "new_password": "somerandom@password"
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 9,
            "is_locked": false,
            "ip_policy": [],
            "last_login": "1544513485",
            "username": "admin",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513485",
            "last_update_time": "1544513485",
            "last_login_time": null,
            "last_change_password_time": "1544513486",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
        },
        "extra": {}
    },
    "msg": null
}
```

# /api/UserAPITokenAPI

## GET



### - 获取所有的 api token 和描述



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 4,
            "value": "TlYBuIwm********************************",
            "ip_policy": [
                "0.0.0.0/0",
                "::/0"
            ],
            "name": "foobar",
            "create_time": "1544513503",
            "is_internal": false,
            "permissions": [
                "User Management"
            ],
            "expire_time": "1544513603"
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
|expire_time | 浮点数字 | 非必填/None | True | 为 null 时, 表示永不过期;  | 
|permissions | 指定选项 | 必填 | False | 选项是: ['System Monitor', 'System Management', 'User Management', 'Website And Security Policy Management', 'Audit Log Management'] | 
|ip_policy | 列表 | 必填 | False | [ -  详见下方表格](#nfshkhytihjvuqxtekzhqwrhqsvmnfvz) | 

<a id="nfshkhytihjvuqxtekzhqwrhqsvmnfvz">ip_policy</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | IP 范围;  | 



### - 创建 api token



请求

```js
{
    "name": "foobar",
    "expire_time": 1544513602.0145867,
    "permissions": [
        "User Management"
    ],
    "ip_policy": [
        "0.0.0.0/0",
        "::/0"
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 1,
        "value": "rQMxtSfheOlswkE8BBxRhFpP2J7nHCLjCIAq1crv",
        "ip_policy": [
            "0.0.0.0/0",
            "::/0"
        ],
        "name": "foobar",
        "create_time": "1544513502",
        "is_internal": false,
        "permissions": [
            "User Management"
        ],
        "expire_time": "1544513602"
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
|permissions | 指定选项 | 必填 | False | 选项是: ['System Monitor', 'System Management', 'User Management', 'Website And Security Policy Management', 'Audit Log Management'] | 
|ip_policy | 列表 | 必填 | False | [ -  详见下方表格](#acvnlzcwhptxgopdwmlxmulkpovsfsvp) | 

<a id="acvnlzcwhptxgopdwmlxmulkpovsfsvp">ip_policy</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | IP 范围;  | 



### - 编辑 api token 的 permission 和 ip_policy



请求

```js
{
    "id": 3,
    "permissions": [
        "User Management",
        "System Management"
    ],
    "ip_policy": [
        "0.0.0.0/0",
        "::/0",
        "10.0.0.0/24"
    ]
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 3,
        "value": "KqKNX0CA********************************",
        "ip_policy": [
            "0.0.0.0/0",
            "::/0",
            "10.0.0.0/24"
        ],
        "name": "foobar",
        "create_time": "1544513502",
        "is_internal": false,
        "permissions": [
            "System Management",
            "User Management"
        ],
        "expire_time": "1544513602"
    },
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

> 只需要传递 ID

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 



### - 删除 api token



请求

```js
{
    "id": 2
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

# /api/UserTFAConfigAPI

## GET



### - 获取验证码链接，前端需要生成二维码，然后使用 app 扫描添加



响应

```js
{
    "err": null,
    "data": {
        "uri": "otpauth://totp/SafeLine:admin%40SafeLine?secret=ZXMDABN2HIAQK32G&issuer=SafeLine"
    },
    "msg": null
}
```

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|tfa_token | 字符串 | 非必填/'' | False | 两步验证验证码; 最小长度: 0；  | 
|action | 指定选项 | 必填 | False | 选项是: ['disable', 'enable'] | 



### - 禁用 tfa，需要输入一个 app 上生成的验证码



请求

```js
{}
```

响应

```js
{
    "err": null,
    "data": null,
    "msg": null
}
```

### - 启用 tfa，需要输入一个 app 上生成的验证码



请求

```js
{}
```

响应

```js
{
    "err": null,
    "data": null,
    "msg": null
}
```

# /api/UserAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#vardiqgkkrqfynqvaiztxzamrkfhynih) | 
|username | 列表 | 必填 | False | [ -  详见下方表格](#ykwppezutgglekopzilqzpqyrsurvadn) | 

<a id="vardiqgkkrqfynqvaiztxzamrkfhynih">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 


<a id="ykwppezutgglekopzilqzpqyrsurvadn">username</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 

### 权限
 - User Management

### - 根据 id 获取用户信息



请求

```js
{
    "id": 41
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 41,
        "is_locked": false,
        "ip_policy": [],
        "last_login": "1544513500",
        "username": "admin",
        "comment": "",
        "tfa_enabled": false,
        "create_time": "1544513500",
        "last_update_time": "1544513500",
        "last_login_time": null,
        "last_change_password_time": "1544513500",
        "permissions": [
            "System Monitor",
            "System Management",
            "User Management",
            "Website And Security Policy Management",
            "Audit Log Management"
        ],
        "authentication_method": "password",
        "session_timeout_time": 172800
    },
    "msg": null
}
```

### - 根据 username 获取用户信息



?> 本 API 支持翻页参数

请求

```js
{
    "username": "admin"
}
```

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 42,
            "is_locked": false,
            "ip_policy": [],
            "last_login": "1544513500",
            "username": "admin",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513500",
            "last_update_time": "1544513500",
            "last_login_time": null,
            "last_change_password_time": "1544513500",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
        }
    ],
    "msg": null
}
```

### - 获取用户列表



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 43,
            "is_locked": false,
            "ip_policy": [],
            "last_login": "1544513501",
            "username": "admin",
            "comment": "",
            "tfa_enabled": false,
            "create_time": "1544513500",
            "last_update_time": "1544513500",
            "last_login_time": null,
            "last_change_password_time": "1544513500",
            "permissions": [
                "System Monitor",
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
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
|username | 字符串 | 必填 | False | 最大长度: 16;  | 
|comment | 字符串 | 必填 | False | 最小长度: 0；  | 
|authentication_method | 指定选项 | 必填 | False | 选项是: ['ldap', 'password', 'cert'] | 
|permissions | 指定选项 | 必填 | False | 选项是: ['System Monitor', 'System Management', 'User Management', 'Website And Security Policy Management', 'Audit Log Management'] | 
|ip_policy | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#vfxpzftwbemywuozrruxdlhqolvxomia) | 

<a id="vfxpzftwbemywuozrruxdlhqolvxomia">ip_policy</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | IP 范围;  | 

### 权限
 - User Management

### - 创建证书认证的用户

extra 中 password 是证书的密码，token 是证书下载用的，见证书下载 api

请求

```js
{
    "username": "foobar",
    "comment": "test",
    "authentication_method": "cert",
    "permissions": [
        "System Monitor",
        "System Management",
        "User Management",
        "Website And Security Policy Management",
        "Audit Log Management"
    ],
    "ip_policy": []
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 28,
            "is_locked": false,
            "ip_policy": [],
            "last_login": null,
            "username": "foobar",
            "comment": "test",
            "tfa_enabled": false,
            "create_time": "1544513495",
            "last_update_time": "1544513495",
            "last_login_time": null,
            "last_change_password_time": null,
            "permissions": [
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "System Monitor",
                "Audit Log Management"
            ],
            "authentication_method": "cert",
            "session_timeout_time": 172800
        },
        "extra": {
            "token": "3857990760d7b0399ddd8efdb4e64cf8:1gWcW0:PDTaeMnNXjzPo7sErKMtpdtvRnE",
            "password": "H6Gc1X"
        }
    },
    "msg": null
}
```

### - 创建 ldap 认证的用户



请求

```js
{
    "username": "foobar",
    "comment": "test",
    "authentication_method": "ldap",
    "permissions": [
        "System Monitor",
        "System Management",
        "User Management",
        "Website And Security Policy Management",
        "Audit Log Management"
    ],
    "ip_policy": []
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 30,
            "is_locked": false,
            "ip_policy": [],
            "last_login": null,
            "username": "foobar",
            "comment": "test",
            "tfa_enabled": false,
            "create_time": "1544513496",
            "last_update_time": "1544513496",
            "last_login_time": null,
            "last_change_password_time": null,
            "permissions": [
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "System Monitor",
                "Audit Log Management"
            ],
            "authentication_method": "ldap",
            "session_timeout_time": 172800
        },
        "extra": null
    },
    "msg": null
}
```

### - 创建密码认证的用户

密码是随机生成的

请求

```js
{
    "username": "foobar",
    "comment": "test",
    "authentication_method": "password",
    "permissions": [
        "System Monitor",
        "System Management",
        "User Management",
        "Website And Security Policy Management",
        "Audit Log Management"
    ],
    "ip_policy": []
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 32,
            "is_locked": false,
            "ip_policy": [],
            "last_login": null,
            "username": "foobar",
            "comment": "test",
            "tfa_enabled": false,
            "create_time": "1544513497",
            "last_update_time": "1544513497",
            "last_login_time": null,
            "last_change_password_time": "1544513497",
            "permissions": [
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "System Monitor",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
        },
        "extra": {
            "password": "eRFfGO"
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
|comment | 字符串 | 必填 | False | 最小长度: 0；  | 
|authentication_method | 指定选项 | 必填 | False | 选项是: ['ldap', 'password', 'cert'] | 
|permissions | 指定选项 | 必填 | False | 选项是: ['System Monitor', 'System Management', 'User Management', 'Website And Security Policy Management', 'Audit Log Management'] | 
|ip_policy | 列表 | 必填 | False | [ -  详见下方表格](#ywomadrftelbefzwypfqmnxaoghbvzkp) | 

<a id="ywomadrftelbefzwypfqmnxaoghbvzkp">ip_policy</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | IP 范围;  | 

### 权限
 - User Management

### - 编辑用户登录方式



请求

```js
{
    "id": 36,
    "is_locked": false,
    "ip_policy": [],
    "last_login": null,
    "username": "foobar",
    "comment": "test",
    "tfa_enabled": false,
    "create_time": "1544513498",
    "last_update_time": "1544513498",
    "last_login_time": null,
    "last_change_password_time": "1544513498",
    "permissions": [
        "System Management",
        "User Management",
        "Website And Security Policy Management",
        "System Monitor",
        "Audit Log Management"
    ],
    "authentication_method": "cert",
    "session_timeout_time": 172800
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 36,
            "is_locked": false,
            "ip_policy": [],
            "last_login": null,
            "username": "foobar",
            "comment": "test",
            "tfa_enabled": false,
            "create_time": "1544513498",
            "last_update_time": "1544513498",
            "last_login_time": null,
            "last_change_password_time": "1544513498",
            "permissions": [
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "System Monitor",
                "Audit Log Management"
            ],
            "authentication_method": "cert",
            "session_timeout_time": 172800
        },
        "extra": {
            "token": "b161c788e116639277ee86fd5106d1c3:1gWcW2:xFbNZMmIp54S87_C7fjA9EmCDgk",
            "password": "fZmHt3"
        }
    },
    "msg": null
}
```

### - 编辑用户 IP 策略



请求

```js
{
    "id": 38,
    "is_locked": false,
    "ip_policy": [
        "0.0.0.0/0",
        "::/0"
    ],
    "last_login": null,
    "username": "foobar",
    "comment": "test",
    "tfa_enabled": false,
    "create_time": "1544513499",
    "last_update_time": "1544513499",
    "last_login_time": null,
    "last_change_password_time": "1544513499",
    "permissions": [
        "System Management",
        "User Management",
        "Website And Security Policy Management",
        "System Monitor",
        "Audit Log Management"
    ],
    "authentication_method": "password",
    "session_timeout_time": 172800
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 38,
            "is_locked": false,
            "ip_policy": [
                "0.0.0.0/0",
                "::/0"
            ],
            "last_login": null,
            "username": "foobar",
            "comment": "test",
            "tfa_enabled": false,
            "create_time": "1544513499",
            "last_update_time": "1544513499",
            "last_login_time": null,
            "last_change_password_time": "1544513499",
            "permissions": [
                "System Management",
                "User Management",
                "Website And Security Policy Management",
                "System Monitor",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
        },
        "extra": {}
    },
    "msg": null
}
```

### - 编辑用户权限



请求

```js
{
    "id": 40,
    "is_locked": false,
    "ip_policy": [],
    "last_login": null,
    "username": "foobar",
    "comment": "test",
    "tfa_enabled": false,
    "create_time": "1544513499",
    "last_update_time": "1544513499",
    "last_login_time": null,
    "last_change_password_time": "1544513499",
    "permissions": [
        "System Management",
        "User Management",
        "Website And Security Policy Management",
        "Audit Log Management"
    ],
    "authentication_method": "password",
    "session_timeout_time": 172800
}
```

响应

```js
{
    "err": null,
    "data": {
        "user": {
            "id": 40,
            "is_locked": false,
            "ip_policy": [],
            "last_login": null,
            "username": "foobar",
            "comment": "test",
            "tfa_enabled": false,
            "create_time": "1544513499",
            "last_update_time": "1544513499",
            "last_login_time": null,
            "last_change_password_time": "1544513499",
            "permissions": [
                "Website And Security Policy Management",
                "System Management",
                "User Management",
                "Audit Log Management"
            ],
            "authentication_method": "password",
            "session_timeout_time": 172800
        },
        "extra": {}
    },
    "msg": null
}
```

# /api/DownloadUserCertAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|token | 字符串 | 必填 | False |  -  | 

?> 不需要登录

### - 下载证书认证的用户的证书



请求

```js
{
    "token": "e15966530aaafdcee1f91a6065c0c3c0:1gWcW2:Ap4j2DLdtcVbYrjnFQKAVxQ1rC4"
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

# /api/UsernameExistsCheckAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|username | 字符串 | 必填 | False | 最大长度: 16;  | 

### 权限
 - User Management

### - 查询一个用户名是否被占用



请求

```js
{
    "username": "foobar"
}
```

响应

```js
{
    "err": null,
    "data": {
        "result": false
    },
    "msg": null
}
```

# /api/UnlockUserAPI

## PUT

### [数据格式定义]
数据格式

> 只需要传递 ID

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id | 整型数字 | 必填 | False |  -  | 

### 权限
 - User Management

### - 解锁用户



请求

```js
{
    "id": 26
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

