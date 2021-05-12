# /api/v1/user/cert

## GET



### 使用 code 下载证书



请求

```js
{
    "code": "Z3yjmJlNl5pYYkwO6p"
}
```

响应

```js
"不支持展示的数据类型，如文件下载等"
```

### code 不存在



请求

```js
{
    "code": "aaaaaaaaaaaaaaaaaa"
}
```

响应

```js
{
    "err": "error",
    "msg": "证书不存在"
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|username | 字符串 | 必填 | False | 最大长度: 32;  | 



### 生成证书



请求

```js
{
    "username": "username"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "code": "ungqMuvOhCNIIyjOfs",
        "password": "569ec53c"
    }
}
```

# /api/v1/user/unlock

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|username | 字符串 | 必填 | False | 最大长度: 32;  | 



### 解锁用户



请求

```js
{
    "username": "username"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 26,
        "create_time": 1545297375.409247,
        "is_locked": false,
        "username": "username",
        "permissions": [
            "log_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "allow",
        "last_change_password": null,
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 172800,
        "user_type": "normal"
    }
}
```

# /api/v1/login

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|username | 字符串 | 必填 | False | 最大长度: 32;  | 
|password | 字符串 | 必填 | False | 最大长度: 32;  | 



### 用户登录



请求

```js
{
    "username": "admin",
    "password": "admin"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 81,
        "create_time": 1545297379.553428,
        "is_locked": false,
        "username": "admin",
        "permissions": [
            "log_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "allow",
        "last_change_password": null,
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 172800,
        "user_type": "normal",
        "need_change_password": true
    }
}
```

### 登录 IP 不在允许范围内



请求

```js
{
    "username": "admin",
    "password": "admin"
}
```

响应

```js
{
    "err": "ip-not-allowed",
    "msg": "IP不在允许范围内"
}
```

### 该用户只能使用证书登录



请求

```js
{
    "username": "admin",
    "password": "admin"
}
```

响应

```js
{
    "err": "login-failed",
    "msg": "该用户只能使用证书登录"
}
```

### 用户名或密码错误



请求

```js
{
    "username": "admin",
    "password": "adminxxx"
}
```

响应

```js
{
    "err": "login-failed",
    "msg": "用户名或密码错误"
}
```

# /api/v1/logout

## POST



### 退出登录



请求

```js
{
    "action": "logout"
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

# /api/v1/user

## GET



### 使用用户名查询用户信息



请求

```js
{
    "username": "test_admin"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 44,
        "create_time": 1545297376.80086,
        "is_locked": false,
        "username": "test_admin",
        "permissions": [
            "log_mgmt",
            "user_mgmt",
            "waf_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "allow",
        "last_change_password": null,
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 172800,
        "user_type": "normal"
    }
}
```

### 获取用户列表



本 API 支持翻页参数

响应

```js
{
    "err": null,
    "msg": "",
    "data": [
        {
            "id": 45,
            "create_time": 1545297376.872861,
            "is_locked": false,
            "username": "test_admin",
            "permissions": [
                "log_mgmt",
                "user_mgmt",
                "waf_mgmt"
            ],
            "is_deleted": false,
            "ip_policy": [
                "*.*.*.*"
            ],
            "ip_policy_mode": "allow",
            "last_change_password": null,
            "user_experience_improvement_program": true,
            "login_method": "password",
            "session_timeout": 172800,
            "user_type": "normal"
        },
        {
            "id": 46,
            "create_time": 1545297376.931824,
            "is_locked": false,
            "username": "other_user",
            "permissions": [
                "log_mgmt"
            ],
            "is_deleted": false,
            "ip_policy": [
                "*.*.*.*"
            ],
            "ip_policy_mode": "allow",
            "last_change_password": null,
            "user_experience_improvement_program": true,
            "login_method": "password",
            "session_timeout": 172800,
            "user_type": "normal"
        }
    ]
}
```

## POST

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|session_timeout | 整型数字 | 非必填/172800 | False | 最小值: 1;  | 
|username | 字符串 | 必填 | False | 最大长度: 32;  | 
|password | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|login_method | 指定选项 | 必填 | False | 选项是: ['cert', 'password'] | 
|permissions | 指定选项 | 必填 | False | 选项是: ['user_mgmt', 'waf_mgmt', 'log_mgmt'] | 
|ip_policy | 列表 | 必填 | False |  - 详见下方表格 | 
|ip_policy_mode | 指定选项 | 必填 | False | 选项是: ['allow', 'deny'] | 

ip_policy

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 最大长度: 64;  | 



### 创建日志管理员



请求

```js
{
    "username": "other_user",
    "password": "password@user",
    "permissions": [
        "log_mgmt"
    ],
    "ip_policy": [
        "*.*.*.*"
    ],
    "ip_policy_mode": "allow",
    "login_method": "password",
    "session_timeout": 60
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 29,
        "create_time": 1545297375.803614,
        "is_locked": false,
        "username": "other_user",
        "permissions": [
            "log_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "allow",
        "last_change_password": null,
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 60,
        "user_type": "normal"
    }
}
```

### 创建超级管理员



请求

```js
{
    "username": "other_user",
    "password": "password@user",
    "permissions": [
        "user_mgmt",
        "waf_mgmt",
        "log_mgmt"
    ],
    "ip_policy": [
        "*.*.*.*"
    ],
    "ip_policy_mode": "allow",
    "login_method": "password",
    "session_timeout": 60
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 31,
        "create_time": 1545297375.938573,
        "is_locked": false,
        "username": "other_user",
        "permissions": [
            "user_mgmt",
            "waf_mgmt",
            "log_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "allow",
        "last_change_password": null,
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 60,
        "user_type": "normal"
    }
}
```

### 创建 waf 管理员



请求

```js
{
    "username": "other_user",
    "password": "password@user",
    "permissions": [
        "waf_mgmt"
    ],
    "ip_policy": [
        "*.*.*.*"
    ],
    "ip_policy_mode": "allow",
    "login_method": "password",
    "session_timeout": 60
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 38,
        "create_time": 1545297376.426044,
        "is_locked": false,
        "username": "other_user",
        "permissions": [
            "waf_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "allow",
        "last_change_password": null,
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 60,
        "user_type": "normal"
    }
}
```

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|session_timeout | 整型数字 | 非必填/172800 | False | 最小值: 1;  | 
|username | 字符串 | 必填 | False | 最大长度: 32;  | 
|password | 字符串 | 非必填/无默认值 | False | 最小长度: 0；  | 
|login_method | 指定选项 | 必填 | False | 选项是: ['cert', 'password'] | 
|permissions | 指定选项 | 必填 | False | 选项是: ['user_mgmt', 'waf_mgmt', 'log_mgmt'] | 
|ip_policy | 列表 | 必填 | False |  - 详见下方表格 | 
|ip_policy_mode | 指定选项 | 必填 | False | 选项是: ['allow', 'deny'] | 

ip_policy

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 最大长度: 64;  | 



### 修改用户信息



请求

```js
{
    "username": "other_user",
    "permissions": [
        "user_mgmt",
        "waf_mgmt",
        "log_mgmt"
    ],
    "ip_policy": [
        "*.*.*.*"
    ],
    "ip_policy_mode": "deny",
    "login_method": "password",
    "session_timeout": 60
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 52,
        "create_time": 1545297377.20951,
        "is_locked": false,
        "username": "other_user",
        "permissions": [
            "user_mgmt",
            "waf_mgmt",
            "log_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "deny",
        "last_change_password": null,
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 60,
        "user_type": "normal"
    }
}
```

### 修改用户密码

需要原密码和新密码

请求

```js
{
    "username": "other_user",
    "password": "new_password",
    "permissions": [
        "user_mgmt",
        "waf_mgmt",
        "log_mgmt"
    ],
    "ip_policy": [
        "*.*.*.*"
    ],
    "ip_policy_mode": "allow",
    "login_method": "password"
}
```

响应

```js
{
    "err": null,
    "msg": "",
    "data": {
        "id": 62,
        "create_time": 1545297377.73444,
        "is_locked": false,
        "username": "other_user",
        "permissions": [
            "user_mgmt",
            "waf_mgmt",
            "log_mgmt"
        ],
        "is_deleted": false,
        "ip_policy": [
            "*.*.*.*"
        ],
        "ip_policy_mode": "allow",
        "last_change_password": "2018-12-20T09:16:17.804446Z",
        "user_experience_improvement_program": true,
        "login_method": "password",
        "session_timeout": 172800,
        "user_type": "normal"
    }
}
```

## DELETE

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|username | 字符串 | 必填 | False | 最大长度: 32;  | 



### 删除用户



请求

```js
{
    "username": "other_user"
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

# /api/v1/profile/session_timeout

## PUT

数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|session_timeout | 整型数字 | 非必填/172800 | False | 最小值: 1;  | 



### 用户修改自己的session过期时间



请求

```js
{
    "session_timeout": 60
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

