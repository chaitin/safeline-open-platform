# /api/ReportSubscriptionAPI

## GET



### - 获取报告订阅列表



?> 本 API 支持翻页参数

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 5,
            "name": "foobar",
            "type": "day",
            "targets": [
                "https://foobar.com"
            ],
            "create_time": "1544513554"
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
|targets | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#uodxcanjdyrszdnudcuhkyhwgujttqtq) | 
|type | 指定选项 | 必填 | False | 选项是: ['day', 'week', 'month'] | 

<a id="uodxcanjdyrszdnudcuhkyhwgujttqtq">targets</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | URL;  | 



### - 创建一个报告订阅



请求

```js
{
    "name": "foobar",
    "targets": [
        "https://foobar.com"
    ],
    "type": "day"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 3,
        "name": "foobar",
        "type": "day",
        "targets": [
            "https://foobar.com"
        ],
        "create_time": "1544513553"
    },
    "msg": null
}
```

## DELETE

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#dvbcmnyztjozvkybrqukdeptuhwtypjm) | 

<a id="dvbcmnyztjozvkybrqukdeptuhwtypjm">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 



### - 删除一个报告订阅



请求

```js
{
    "id": [
        4
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

# /api/ManualGenerateReportAPI

## POST

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|time_range | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 
|name | 字符串 | 必填 | False |  -  | 
|targets | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#iewakbfkzsrnavgjkymvtcrdmejtuiow) | 
|sync | 布尔 | 非必填/False | False |  -  | 
|type | 指定选项 | 必填 | False | 选项是: ['day', 'week', 'custom', 'month'] | 

<a id="iewakbfkzsrnavgjkymvtcrdmejtuiow">targets</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | URL;  | 



### - 手动生成一个报告



请求

```js
{
    "name": "foobar",
    "targets": [],
    "time_range": "1541001600-1541087999",
    "sync": true,
    "type": "day"
}
```

响应

```js
{
    "err": null,
    "data": {
        "id": 1,
        "name": "foobar",
        "type": "day",
        "targets": [],
        "create_time": "1544513552"
    },
    "msg": null
}
```

# /api/ReportResultAPI

## GET

### [数据格式定义]
数据格式

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|type | 指定选项 | 非必填/无默认值 | False | 选项是: ['day', 'week', 'custom', 'month'] | 
|targets | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#nnjecfyyqsuiwazlidtiomsldwonwzxc) | 
|name__like | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#ankoyivlfqjzxvnexohrxykydddgtpxu) | 
|timestamp__range | 列表 | 必填 | False | [ -  详见下方表格](#seixqrvenscoqlyuazzxocpcbnppqadc) | 

<a id="nnjecfyyqsuiwazlidtiomsldwonwzxc">targets</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="ankoyivlfqjzxvnexohrxykydddgtpxu">name__like</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False |  -  | 


<a id="seixqrvenscoqlyuazzxocpcbnppqadc">timestamp__range</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 字符串 | 必填 | False | 时间范围，比如 1234-4567, 1234-0;  | 



### - 获取报告列表



?> 本 API 支持翻页参数

请求

```js
{
    "type": [
        "custom",
        "day"
    ],
    "name__like": [
        "f"
    ]
}
```

响应

```js
{
    "err": null,
    "data": [
        {
            "id": 3,
            "time_range": "1531971605-1531981729",
            "state": "Pending",
            "create_time": "1544513553",
            "message_id": "",
            "end_time": null,
            "name": "foobar",
            "type": "day",
            "targets": []
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
|id__in | 列表 | 非必填/<class 'list'> | False | [ -  详见下方表格](#mjhjnvfejyeyblouxsqztdccbonrwtdf) | 

<a id="mjhjnvfejyeyblouxsqztdccbonrwtdf">id__in</a>

|字段名|数据类型|是否必填/默认值|NULL|其他|
|:--|:-:|:-:|:-:|:-:|
|子字段 | 整型数字 | 必填 | False |  -  | 



### - 删除一个报告结果



请求

```js
{
    "id": [
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

