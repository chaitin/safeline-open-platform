# /api/ServerControlledConfigAPI

## GET



### - 获取服务器控制的配置的详情

可以添加 ?type=xx 获取单项配置

响应

```js
{
    "err": null,
    "data": {
        "attack_type": [
            {
                "value": -1,
                "translation": "None"
            },
            {
                "value": 0,
                "translation": "SQL Injection"
            },
            {
                "value": 1,
                "translation": "XSS"
            },
            {
                "value": 2,
                "translation": "CSRF"
            },
            {
                "value": 3,
                "translation": "SSRF"
            },
            {
                "value": 4,
                "translation": "DOS"
            },
            {
                "value": 5,
                "translation": "Backdoor"
            },
            {
                "value": 6,
                "translation": "Deserialization"
            },
            {
                "value": 7,
                "translation": "Code Execution"
            },
            {
                "value": 8,
                "translation": "Code Injection"
            },
            {
                "value": 9,
                "translation": "Command Injection"
            },
            {
                "value": 10,
                "translation": "File Upload"
            },
            {
                "value": 11,
                "translation": "File Inclusion"
            },
            {
                "value": 12,
                "translation": "Redirect"
            },
            {
                "value": 13,
                "translation": "Weak Permission"
            },
            {
                "value": 14,
                "translation": "Info Leak"
            },
            {
                "value": 15,
                "translation": "Unauthorized Access"
            },
            {
                "value": 16,
                "translation": "Unsafe Config"
            },
            {
                "value": 17,
                "translation": "XXE"
            },
            {
                "value": 18,
                "translation": "XPath Injection"
            },
            {
                "value": 19,
                "translation": "LDAP Injection"
            },
            {
                "value": 20,
                "translation": "Directory Traversal"
            },
            {
                "value": 21,
                "translation": "Scanner"
            },
            {
                "value": 22,
                "translation": "Permission Bypass"
            },
            {
                "value": 23,
                "translation": "ACL Bypass"
            },
            {
                "value": 24,
                "translation": "File Write"
            },
            {
                "value": 25,
                "translation": "File Download"
            },
            {
                "value": 26,
                "translation": "File Deletion"
            },
            {
                "value": 27,
                "translation": "Logic Error"
            },
            {
                "value": 28,
                "translation": "CRLF Injection"
            },
            {
                "value": 29,
                "translation": "SSTI"
            },
            {
                "value": 30,
                "translation": "Click Hijacking"
            },
            {
                "value": 31,
                "translation": "Buffer Overflow"
            },
            {
                "value": 32,
                "translation": "Integer Overflow"
            },
            {
                "value": 33,
                "translation": "Format String"
            },
            {
                "value": 34,
                "translation": "Race Condition"
            },
            {
                "value": 61,
                "translation": "Timeout"
            },
            {
                "value": 62,
                "translation": "Unknown"
            }
        ],
        "policy_rule_attack_type": [
            {
                "value": -1,
                "translation": "None"
            },
            {
                "value": 0,
                "translation": "SQL Injection"
            },
            {
                "value": 1,
                "translation": "XSS"
            },
            {
                "value": 2,
                "translation": "CSRF"
            },
            {
                "value": 3,
                "translation": "SSRF"
            },
            {
                "value": 4,
                "translation": "DOS"
            },
            {
                "value": 5,
                "translation": "Backdoor"
            },
            {
                "value": 6,
                "translation": "Deserialization"
            },
            {
                "value": 7,
                "translation": "Code Execution"
            },
            {
                "value": 8,
                "translation": "Code Injection"
            },
            {
                "value": 9,
                "translation": "Command Injection"
            },
            {
                "value": 10,
                "translation": "File Upload"
            },
            {
                "value": 11,
                "translation": "File Inclusion"
            },
            {
                "value": 12,
                "translation": "Redirect"
            },
            {
                "value": 13,
                "translation": "Weak Permission"
            },
            {
                "value": 14,
                "translation": "Info Leak"
            },
            {
                "value": 15,
                "translation": "Unauthorized Access"
            },
            {
                "value": 16,
                "translation": "Unsafe Config"
            },
            {
                "value": 17,
                "translation": "XXE"
            },
            {
                "value": 18,
                "translation": "XPath Injection"
            },
            {
                "value": 19,
                "translation": "LDAP Injection"
            }
        ],
        "user_permission_list": [
            {
                "category": "General",
                "types": [
                    {
                        "value": "User Management",
                        "translation": "User Management",
                        "description": "Manage user info, credentials and permissions, etc."
                    },
                    {
                        "value": "Audit Log Management",
                        "translation": "Audit Log Management",
                        "description": "View audit log"
                    }
                ]
            },
            {
                "category": "Security",
                "types": [
                    {
                        "value": "Website And Security Policy Management",
                        "translation": "Website And Security Policy Management",
                        "description": "Manage website, security policy, detection log, etc."
                    },
                    {
                        "value": "System Monitor",
                        "translation": "System Monitor",
                        "description": "View system monitor data, like CPU, memory, disk, network, node load, etc."
                    },
                    {
                        "value": "System Management",
                        "translation": "System Management",
                        "description": "Manage some global settings, like SMTP, LDAP, time, license, etc."
                    }
                ]
            }
        ],
        "alarm_type_list": [
            {
                "category": "General",
                "types": [
                    {
                        "value": "Account Security",
                        "translation": "Account Security"
                    },
                    {
                        "value": "System Management",
                        "translation": "System Management"
                    },
                    {
                        "value": "System Monitor And Alarm",
                        "translation": "System Monitor And Alarm"
                    }
                ]
            },
            {
                "category": "Security",
                "types": [
                    {
                        "value": "Website Management",
                        "translation": "Website Management"
                    },
                    {
                        "value": "Security Policy Management",
                        "translation": "Security Policy Management"
                    },
                    {
                        "value": "ACL Management",
                        "translation": "ACL Management"
                    },
                    {
                        "value": "Plugin Management",
                        "translation": "Plugin Management"
                    },
                    {
                        "value": "Request Log",
                        "translation": "Request Log",
                        "description": "Forward request log to your server"
                    }
                ]
            }
        ],
        "detection_config": {
            "modules_detection_config": [
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "Detect non-injected SQL, such as full SQL statement execution",
                                "cn": "检测非注入型 SQL，如完整的 SQL 语句执行"
                            },
                            "default": true,
                            "type": "boolean",
                            "name": {
                                "en": "Detect non-injection type SQL",
                                "cn": "检测非注入型攻击"
                            },
                            "key": "detect_non_injection_sql"
                        }
                    ],
                    "name": {
                        "en": "m_sqli",
                        "cn": "SQL 注入检测模块"
                    },
                    "key": "m_sqli"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "Detect non-injection XSS, such as full HTML file",
                                "cn": "检测非注入型 XSS，如完整的 HTML 文件"
                            },
                            "default": true,
                            "type": "boolean",
                            "name": {
                                "en": "Detect non-injection type XSS",
                                "cn": "检测非注入型攻击"
                            },
                            "key": "detect_complete_html"
                        }
                    ],
                    "name": {
                        "en": "m_xss",
                        "cn": "XSS 检测模块"
                    },
                    "key": "m_xss"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "Intelligence module requires special detection information leakage type",
                                "cn": "情报模块需要特殊检测的信息泄露类型"
                            },
                            "name": {
                                "en": "Info leak detect types",
                                "cn": "信息泄露需要检测的类型"
                            },
                            "default": [
                                "test file",
                                "backup file",
                                "code repository",
                                "server sensitive file"
                            ],
                            "choices": [
                                {
                                    "en": "test file",
                                    "cn": "测试文件"
                                },
                                {
                                    "en": "backup file",
                                    "cn": "备份文件"
                                },
                                {
                                    "en": "code repository",
                                    "cn": "代码仓库"
                                },
                                {
                                    "en": "server sensitive file",
                                    "cn": "服务器敏感文件"
                                }
                            ],
                            "key": "info_leak_types",
                            "type": "choices"
                        },
                        {
                            "comment": {
                                "en": "It must be combined with the response to determine if the information leakage really happened",
                                "cn": "一定要结合 response  来判断信息泄露是否真的发生"
                            },
                            "default": false,
                            "type": "boolean",
                            "name": {
                                "en": "Check info leak by response",
                                "cn": "通过 response 检测信息泄露"
                            },
                            "key": "check_info_leak_by_rsp"
                        }
                    ],
                    "name": {
                        "en": "m_rule",
                        "cn": "情报模块"
                    },
                    "key": "m_rule"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [],
                    "name": {
                        "en": "m_csrf",
                        "cn": "CSRF 检测模块"
                    },
                    "key": "m_csrf"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [],
                    "name": {
                        "en": "m_ssrf",
                        "cn": "SSRF 检测模块"
                    },
                    "key": "m_ssrf"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [],
                    "name": {
                        "en": "m_php_unserialize",
                        "cn": "PHP 反序列化检测模块"
                    },
                    "key": "m_php_unserialize"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [],
                    "name": {
                        "en": "m_java_unserialize",
                        "cn": "Java 反序列化检测模块"
                    },
                    "key": "m_java_unserialize"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [],
                    "name": {
                        "en": "m_file_upload",
                        "cn": "文件上传攻击检测模块"
                    },
                    "key": "m_file_upload"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [],
                    "name": {
                        "en": "m_file_include",
                        "cn": "文件包含攻击检测模块"
                    },
                    "key": "m_file_include"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "Whether to check the php code injection in the uploaded file",
                                "cn": "是否检测上传文件中的 PHP 代码注入"
                            },
                            "default": true,
                            "type": "boolean",
                            "name": {
                                "en": "Detect uploading file",
                                "cn": "检测文件上传"
                            },
                            "key": "detect_upload_file"
                        }
                    ],
                    "name": {
                        "en": "m_php_code_injection",
                        "cn": "PHP 代码注入检测模块"
                    },
                    "key": "m_php_code_injection"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "Whether to detect Java code injection in uploaded files",
                                "cn": "是否检测上传文件中的 Java 代码注入"
                            },
                            "default": true,
                            "type": "boolean",
                            "name": {
                                "en": "Detect uploading file",
                                "cn": "检测文件上传"
                            },
                            "key": "detect_upload_file"
                        }
                    ],
                    "name": {
                        "en": "m_java",
                        "cn": "Java 代码注入检测模块"
                    },
                    "key": "m_java"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [],
                    "name": {
                        "en": "m_cmd_injection",
                        "cn": "命令注入检测模块"
                    },
                    "key": "m_cmd_injection"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "Which backend error types are detected",
                                "cn": "检测哪些后端的错误类型"
                            },
                            "name": {
                                "en": "Server error types",
                                "cn": "响应错误类型"
                            },
                            "default": [
                                "directory indexing",
                                "SQL execution error",
                                "server exception"
                            ],
                            "choices": [
                                {
                                    "en": "directory indexing",
                                    "cn": "列目录"
                                },
                                {
                                    "en": "SQL execution error",
                                    "cn": "SQL 报错"
                                },
                                {
                                    "en": "server exception",
                                    "cn": "服务器异常"
                                }
                            ],
                            "key": "error_types",
                            "type": "choices"
                        }
                    ],
                    "name": {
                        "en": "m_response",
                        "cn": "服务器响应检测模块"
                    },
                    "key": "m_response"
                },
                {
                    "comment": {
                        "en": "",
                        "cn": ""
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "",
                                "cn": "机器人检测模块需要检测的类型"
                            },
                            "name": {
                                "en": "Robot types",
                                "cn": "机器人类型"
                            },
                            "default": [
                                "scanner"
                            ],
                            "choices": [
                                {
                                    "en": "scanner",
                                    "cn": "扫描器检测"
                                },
                                {
                                    "en": "spider",
                                    "cn": "爬虫检测"
                                },
                                {
                                    "en": "abnormal",
                                    "cn": "其他疑似非浏览器请求"
                                }
                            ],
                            "key": "robot_types",
                            "type": "choices"
                        }
                    ],
                    "name": {
                        "en": "m_scanner",
                        "cn": "机器人检测模块"
                    },
                    "key": "m_scanner"
                }
            ],
            "misc_detection_config": [
                {
                    "comment": {
                        "en": "How the engine decodes the data",
                        "cn": "引擎对数据的解码方法"
                    },
                    "config": [
                        {
                            "comment": {
                                "en": "",
                                "cn": "检测中可以使用的解码/解析方式"
                            },
                            "name": {
                                "en": "Decode methods",
                                "cn": "解码方式"
                            },
                            "default": [
                                "url decode",
                                "JSON",
                                "base64",
                                "hex",
                                "eval",
                                "XML",
                                "PHP deserialize",
                                "utf7"
                            ],
                            "choices": [
                                {
                                    "en": "url decode",
                                    "cn": "URL 解码"
                                },
                                {
                                    "en": "JSON",
                                    "cn": "JSON 解析"
                                },
                                {
                                    "en": "base64",
                                    "cn": "Base64 解码"
                                },
                                {
                                    "en": "hex",
                                    "cn": "十六进制转换"
                                },
                                {
                                    "en": "eval",
                                    "cn": "斜杠反转义"
                                },
                                {
                                    "en": "XML",
                                    "cn": "XML 解析"
                                },
                                {
                                    "en": "PHP deserialize",
                                    "cn": "PHP 序列化对象解析"
                                },
                                {
                                    "en": "utf7",
                                    "cn": "UTF-7 解码"
                                }
                            ],
                            "key": "decode_methods",
                            "type": "choices"
                        }
                    ],
                    "name": {
                        "en": "decode",
                        "cn": "解码配置"
                    },
                    "key": "decode_config"
                }
            ]
        },
        "policy_target_list": {
            "cmps": {
                "str_type": [
                    {
                        "desc": {
                            "en": "包含",
                            "cn": "包含"
                        },
                        "op": "infix"
                    },
                    {
                        "desc": {
                            "en": "不包含",
                            "cn": "不包含"
                        },
                        "op": "notinfix"
                    },
                    {
                        "desc": {
                            "en": "完全匹配",
                            "cn": "完全匹配"
                        },
                        "op": "str"
                    },
                    {
                        "desc": {
                            "en": "不完全匹配",
                            "cn": "不完全匹配"
                        },
                        "op": "notstr"
                    },
                    {
                        "desc": {
                            "en": "正则匹配",
                            "cn": "正则匹配"
                        },
                        "op": "re"
                    },
                    {
                        "desc": {
                            "en": "正则不匹配",
                            "cn": "正则不匹配"
                        },
                        "op": "notre"
                    }
                ],
                "numeric_type": [
                    {
                        "desc": {
                            "en": "小于",
                            "cn": "小于"
                        },
                        "op": "$lt"
                    },
                    {
                        "desc": {
                            "en": "小于等于",
                            "cn": "小于等于"
                        },
                        "op": "$le"
                    },
                    {
                        "desc": {
                            "en": "等于",
                            "cn": "等于"
                        },
                        "op": "$eq"
                    },
                    {
                        "desc": {
                            "en": "不等于",
                            "cn": "不等于"
                        },
                        "op": "$ne"
                    },
                    {
                        "desc": {
                            "en": "大于",
                            "cn": "大于"
                        },
                        "op": "$gt"
                    },
                    {
                        "desc": {
                            "en": "大于等于",
                            "cn": "大于等于"
                        },
                        "op": "$ge"
                    }
                ],
                "cidr_type": [
                    {
                        "desc": {
                            "en": "属于网段",
                            "cn": "属于网段"
                        },
                        "op": "cidr"
                    },
                    {
                        "desc": {
                            "en": "不属于网段",
                            "cn": "不属于网段"
                        },
                        "op": "notcidr"
                    }
                ]
            },
            "targets": [
                {
                    "name": {
                        "en": "URL",
                        "cn": "URL"
                    },
                    "comment": {
                        "en": "请求中原始 URL，不解码",
                        "cn": "请求中原始 URL，不解码"
                    },
                    "key": "urlpath",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "路径",
                        "cn": "路径"
                    },
                    "comment": {
                        "en": "用户请求中从 / 开始到 ? 结束的部分，并进行一次 URL 解码",
                        "cn": "用户请求中从 / 开始到 ? 结束的部分，并进行一次 URL 解码"
                    },
                    "key": "decoded_path",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Query",
                        "cn": "Query"
                    },
                    "comment": {
                        "en": "用户请求的 URL 中从 ? 开始到最后的部分，并进行一次 URL 解码",
                        "cn": "用户请求的 URL 中从 ? 开始到最后的部分，并进行一次 URL 解码"
                    },
                    "key": "decoded_query",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "GET 参数",
                        "cn": "GET 参数"
                    },
                    "comment": {
                        "en": "用户请求的 URL 中从 ? 开始到最后的部分，拆分为键值对形式后进行一次 URL 解码",
                        "cn": "用户请求的 URL 中从 ? 开始到最后的部分，拆分为键值对形式后进行一次 URL 解码"
                    },
                    "key": "query",
                    "type": "kv",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Method",
                        "cn": "Method"
                    },
                    "comment": {
                        "en": "HTTP 请求的 Method",
                        "cn": "HTTP 请求的 Method"
                    },
                    "key": "method",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Host",
                        "cn": "Host"
                    },
                    "comment": {
                        "en": "HTTP 请求头中的 Host",
                        "cn": "HTTP 请求头中的 Host"
                    },
                    "key": "host",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "完整 Cookie",
                        "cn": "完整 Cookie"
                    },
                    "comment": {
                        "en": "未拆分为键值对形式的 Cookie",
                        "cn": "未拆分为键值对形式的 Cookie"
                    },
                    "key": "cookie",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Cookie 参数",
                        "cn": "Cookie 参数"
                    },
                    "comment": {
                        "en": "拆分为键值对形式的 Cookie",
                        "cn": "拆分为键值对形式的 Cookie"
                    },
                    "key": "cookie",
                    "type": "kv",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "User Agent",
                        "cn": "User Agent"
                    },
                    "comment": {
                        "en": "HTTP 请求头中的 User-Agent",
                        "cn": "HTTP 请求头中的 User-Agent"
                    },
                    "key": "user_agent",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Referrer",
                        "cn": "Referrer"
                    },
                    "comment": {
                        "en": "HTTP 请求头中的 Referrer",
                        "cn": "HTTP 请求头中的 Referrer"
                    },
                    "key": "referer",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Content-Type",
                        "cn": "Content-Type"
                    },
                    "comment": {
                        "en": "HTTP 请求头中的 Content-Type",
                        "cn": "HTTP 请求头中的 Content-Type"
                    },
                    "key": "content_type",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "用户 IP",
                        "cn": "用户 IP"
                    },
                    "comment": {
                        "en": "用户的客户端源 IP",
                        "cn": "用户的客户端源 IP"
                    },
                    "key": "remote_addr",
                    "type": "v",
                    "cmp": [
                        "str_type",
                        "cidr_type"
                    ]
                },
                {
                    "name": {
                        "en": "X-Forwarded-For",
                        "cn": "X-Forwarded-For"
                    },
                    "comment": {
                        "en": "HTTP 请求头中的 X-Forwarded-For",
                        "cn": "HTTP 请求头中的 X-Forwarded-For"
                    },
                    "key": "x_forwarded_for",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Origin",
                        "cn": "Origin"
                    },
                    "comment": {
                        "en": "HTTP 请求头中的 Origin",
                        "cn": "HTTP 请求头中的 Origin"
                    },
                    "key": "origin",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "Session",
                        "cn": "Session"
                    },
                    "comment": {
                        "en": "用户的 Session 内容 (需要先配置 Session 获取方式)",
                        "cn": "用户的 Session 内容 (需要先配置 Session 获取方式)"
                    },
                    "key": "session",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "完整 HTTP header",
                        "cn": "完整 HTTP header"
                    },
                    "comment": {
                        "en": "原始 HTTP 完整请求头",
                        "cn": "原始 HTTP 完整请求头"
                    },
                    "key": "request_header",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "HTTP 请求头",
                        "cn": "HTTP 请求头"
                    },
                    "comment": {
                        "en": "拆分为键值对形式 HTTP 请求头",
                        "cn": "拆分为键值对形式 HTTP 请求头"
                    },
                    "key": "custom_header",
                    "type": "kv",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "HTTP 请求头长度",
                        "cn": "HTTP 请求头长度"
                    },
                    "comment": {
                        "en": "HTTP 请求头的长度",
                        "cn": "HTTP 请求头的长度"
                    },
                    "key": "request_header_length",
                    "type": "v",
                    "cmp": [
                        "numeric_type"
                    ]
                },
                {
                    "name": {
                        "en": "POST 参数",
                        "cn": "POST 参数"
                    },
                    "comment": {
                        "en": "HTTP 请求 Body 中 form 类数据，拆分为键值对形式后进行一次 URL 解码",
                        "cn": "HTTP 请求 Body 中 form 类数据，拆分为键值对形式后进行一次 URL 解码"
                    },
                    "key": "form",
                    "type": "kv",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "上传的文件名",
                        "cn": "上传的文件名"
                    },
                    "comment": {
                        "en": "HTTP 请求中上传文件的文件名",
                        "cn": "HTTP 请求中上传文件的文件名"
                    },
                    "key": "file_name",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "完整 Body",
                        "cn": "完整 Body"
                    },
                    "comment": {
                        "en": "完整的 HTTP 请求的 Body",
                        "cn": "完整的 HTTP 请求的 Body"
                    },
                    "key": "request_body",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "HTTP 状态码",
                        "cn": "HTTP 状态码"
                    },
                    "comment": {
                        "en": "服务端返回的 HTTP 状态码",
                        "cn": "服务端返回的 HTTP 状态码"
                    },
                    "key": "response_status",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                },
                {
                    "name": {
                        "en": "响应内容",
                        "cn": "响应内容"
                    },
                    "comment": {
                        "en": "服务端返回的完整响应内容",
                        "cn": "服务端返回的完整响应内容"
                    },
                    "key": "response_body",
                    "type": "v",
                    "cmp": [
                        "str_type"
                    ]
                }
            ]
        },
        "partition_config_list": [
            {
                "value": "Request Log",
                "translation": "Request Log",
                "category": [
                    {
                        "value": "",
                        "translation": "",
                        "sub_category": [
                            {
                                "value": "metrics.requestlogbasic",
                                "translation": "Request Log Basic",
                                "description": "Basic info of attack detection log, such as IP, attack type, URL, etc."
                            },
                            {
                                "value": "metrics.requestlogdetail",
                                "translation": "Request Log Detail",
                                "description": "Detailed info of attack detection log, such as request header, payload, etc. You can delete old data to save disk space"
                            }
                        ]
                    }
                ]
            },
            {
                "value": "acl.aclruleexecutionlog",
                "translation": "ACL Rule Execution Log",
                "description": "",
                "category": []
            },
            {
                "value": "mario.pluginlog",
                "translation": "Plugin Log",
                "description": "",
                "category": []
            },
            {
                "value": "management.auditlog",
                "translation": "Audit Log",
                "description": "User operation log and system service log",
                "category": []
            }
        ],
        "filter_config": {
            "log:detect": [
                {
                    "value": "timestamp__range",
                    "type": "time_range",
                    "translation": "Time Range"
                },
                {
                    "value": "id__in",
                    "type": "text",
                    "translation": "ID"
                },
                {
                    "value": "attack_type",
                    "type": "filterable_choice",
                    "translation": "Attack Type",
                    "choices": {
                        "-1": "None",
                        "0": "SQL Injection",
                        "1": "XSS",
                        "2": "CSRF",
                        "3": "SSRF",
                        "4": "DOS",
                        "5": "Backdoor",
                        "6": "Deserialization",
                        "7": "Code Execution",
                        "8": "Code Injection",
                        "9": "Command Injection",
                        "10": "File Upload",
                        "11": "File Inclusion",
                        "12": "Redirect",
                        "13": "Weak Permission",
                        "14": "Info Leak",
                        "15": "Unauthorized Access",
                        "16": "Unsafe Config",
                        "17": "XXE",
                        "18": "XPath Injection",
                        "19": "LDAP Injection",
                        "20": "Directory Traversal",
                        "21": "Scanner",
                        "22": "Permission Bypass",
                        "23": "ACL Bypass",
                        "24": "File Write",
                        "25": "File Download",
                        "26": "File Deletion",
                        "27": "Logic Error",
                        "28": "CRLF Injection",
                        "29": "SSTI",
                        "30": "Click Hijacking",
                        "31": "Buffer Overflow",
                        "32": "Integer Overflow",
                        "33": "Format String",
                        "34": "Race Condition",
                        "61": "Timeout",
                        "62": "Unknown"
                    }
                },
                {
                    "value": "risk_level",
                    "type": "filterable_choice",
                    "translation": "Risk Level",
                    "choices": {
                        "0": "None",
                        "1": "Low",
                        "2": "Medium",
                        "3": "High"
                    }
                },
                {
                    "value": "action",
                    "type": "filterable_choice",
                    "translation": "Action",
                    "choices": {
                        "0": "Allow",
                        "1": "Deny",
                        "2": "Continue"
                    }
                },
                {
                    "value": "protocol",
                    "type": "filterable_choice",
                    "translation": "Protocol",
                    "choices": {
                        "0": "http",
                        "1": "https"
                    }
                },
                {
                    "value": "event_id",
                    "type": "text",
                    "translation": "Event ID"
                },
                {
                    "value": "country",
                    "type": "filterable_choice",
                    "translation": "Country",
                    "choices": {
                        "CN": "China",
                        "AD": "Andorra",
                        "AE": "United Arab Emirates",
                        "AF": "Afghanistan",
                        "AG": "Antigua and Barbuda",
                        "AI": "Anguilla",
                        "AL": "Albania",
                        "AM": "Armenia",
                        "AO": "Angola",
                        "AQ": "Antarctica",
                        "AR": "Argentina",
                        "AS": "American Samoa",
                        "AT": "Austria",
                        "AU": "Australia",
                        "AW": "Aruba",
                        "AX": "Aland Islands",
                        "AZ": "Azerbaijan",
                        "BA": "Bosnia and Herzegovina",
                        "BB": "Barbados",
                        "BD": "Bangladesh",
                        "BE": "Belgium",
                        "BF": "Burkina Faso",
                        "BG": "Bulgaria",
                        "BH": "Bahrain",
                        "BI": "Burundi",
                        "BJ": "Benin",
                        "BL": "Saint Barthelemy",
                        "BM": "Bermuda",
                        "BN": "Brunei",
                        "BO": "Bolivia",
                        "BQ": "Bonaire, Saint Eustatius and Saba ",
                        "BR": "Brazil",
                        "BS": "Bahamas",
                        "BT": "Bhutan",
                        "BV": "Bouvet Island",
                        "BW": "Botswana",
                        "BY": "Belarus",
                        "BZ": "Belize",
                        "CA": "Canada",
                        "CC": "Cocos Islands",
                        "CD": "Democratic Republic of the Congo",
                        "CF": "Central African Republic",
                        "CG": "Republic of the Congo",
                        "CH": "Switzerland",
                        "CI": "Ivory Coast",
                        "CK": "Cook Islands",
                        "CL": "Chile",
                        "CM": "Cameroon",
                        "CO": "Colombia",
                        "CR": "Costa Rica",
                        "CU": "Cuba",
                        "CV": "Cape Verde",
                        "CW": "Curacao",
                        "CX": "Christmas Island",
                        "CY": "Cyprus",
                        "CZ": "Czech Republic",
                        "DE": "Germany",
                        "DJ": "Djibouti",
                        "DK": "Denmark",
                        "DM": "Dominica",
                        "DO": "Dominican Republic",
                        "DZ": "Algeria",
                        "EC": "Ecuador",
                        "EE": "Estonia",
                        "EG": "Egypt",
                        "EH": "Western Sahara",
                        "ER": "Eritrea",
                        "ES": "Spain",
                        "ET": "Ethiopia",
                        "FI": "Finland",
                        "FJ": "Fiji",
                        "FK": "Falkland Islands",
                        "FM": "Micronesia",
                        "FO": "Faroe Islands",
                        "FR": "France",
                        "GA": "Gabon",
                        "GB": "United Kingdom",
                        "GD": "Grenada",
                        "GE": "Georgia",
                        "GF": "French Guiana",
                        "GG": "Guernsey",
                        "GH": "Ghana",
                        "GI": "Gibraltar",
                        "GL": "Greenland",
                        "GM": "Gambia",
                        "GN": "Guinea",
                        "GP": "Guadeloupe",
                        "GQ": "Equatorial Guinea",
                        "GR": "Greece",
                        "GS": "South Georgia and the South Sandwich Islands",
                        "GT": "Guatemala",
                        "GU": "Guam",
                        "GW": "Guinea-Bissau",
                        "GY": "Guyana",
                        "HK": "Hong Kong",
                        "HM": "Heard Island and McDonald Islands",
                        "HN": "Honduras",
                        "HR": "Croatia",
                        "HT": "Haiti",
                        "HU": "Hungary",
                        "ID": "Indonesia",
                        "IE": "Ireland",
                        "IL": "Israel",
                        "IM": "Isle of Man",
                        "IN": "India",
                        "IO": "British Indian Ocean Territory",
                        "IQ": "Iraq",
                        "IR": "Iran",
                        "IS": "Iceland",
                        "IT": "Italy",
                        "JE": "Jersey",
                        "JM": "Jamaica",
                        "JO": "Jordan",
                        "JP": "Japan",
                        "KE": "Kenya",
                        "KG": "Kyrgyzstan",
                        "KH": "Cambodia",
                        "KI": "Kiribati",
                        "KM": "Comoros",
                        "KN": "Saint Kitts and Nevis",
                        "KP": "North Korea",
                        "KR": "South Korea",
                        "KW": "Kuwait",
                        "KY": "Cayman Islands",
                        "KZ": "Kazakhstan",
                        "LA": "Laos",
                        "LB": "Lebanon",
                        "LC": "Saint Lucia",
                        "LI": "Liechtenstein",
                        "LK": "Sri Lanka",
                        "LR": "Liberia",
                        "LS": "Lesotho",
                        "LT": "Lithuania",
                        "LU": "Luxembourg",
                        "LV": "Latvia",
                        "LY": "Libya",
                        "MA": "Morocco",
                        "MC": "Monaco",
                        "MD": "Moldova",
                        "ME": "Montenegro",
                        "MF": "Saint Martin",
                        "MG": "Madagascar",
                        "MH": "Marshall Islands",
                        "MK": "Macedonia",
                        "ML": "Mali",
                        "MM": "Myanmar",
                        "MN": "Mongolia",
                        "MP": "Northern Mariana Islands",
                        "MQ": "Martinique",
                        "MR": "Mauritania",
                        "MS": "Montserrat",
                        "MT": "Malta",
                        "MU": "Mauritius",
                        "MV": "Maldives",
                        "MW": "Malawi",
                        "MX": "Mexico",
                        "MY": "Malaysia",
                        "MZ": "Mozambique",
                        "NA": "Namibia",
                        "NC": "New Caledonia",
                        "NE": "Niger",
                        "NF": "Norfolk Island",
                        "NG": "Nigeria",
                        "NI": "Nicaragua",
                        "NL": "Netherlands",
                        "NO": "Norway",
                        "NP": "Nepal",
                        "NR": "Nauru",
                        "NU": "Niue",
                        "NZ": "New Zealand",
                        "OM": "Oman",
                        "PA": "Panama",
                        "PE": "Peru",
                        "PF": "French Polynesia",
                        "PG": "Papua New Guinea",
                        "PH": "Philippines",
                        "PK": "Pakistan",
                        "PL": "Poland",
                        "PM": "Saint Pierre and Miquelon",
                        "PN": "Pitcairn",
                        "PR": "Puerto Rico",
                        "PS": "Palestinian Territory",
                        "PT": "Portugal",
                        "PW": "Palau",
                        "PY": "Paraguay",
                        "QA": "Qatar",
                        "RE": "Reunion",
                        "RO": "Romania",
                        "RS": "Serbia",
                        "RU": "Russia",
                        "RW": "Rwanda",
                        "SA": "Saudi Arabia",
                        "SB": "Solomon Islands",
                        "SC": "Seychelles",
                        "SD": "Sudan",
                        "SE": "Sweden",
                        "SG": "Singapore",
                        "SH": "Saint Helena",
                        "SI": "Slovenia",
                        "SJ": "Svalbard and Jan Mayen",
                        "SK": "Slovakia",
                        "SL": "Sierra Leone",
                        "SM": "San Marino",
                        "SN": "Senegal",
                        "SO": "Somalia",
                        "SR": "Suriname",
                        "SS": "South Sudan",
                        "ST": "Sao Tome and Principe",
                        "SV": "El Salvador",
                        "SX": "Sint Maarten",
                        "SY": "Syria",
                        "SZ": "Swaziland",
                        "TC": "Turks and Caicos Islands",
                        "TD": "Chad",
                        "TF": "French Southern Territories",
                        "TG": "Togo",
                        "TH": "Thailand",
                        "TJ": "Tajikistan",
                        "TK": "Tokelau",
                        "TL": "East Timor",
                        "TM": "Turkmenistan",
                        "TN": "Tunisia",
                        "TO": "Tonga",
                        "TR": "Turkey",
                        "TT": "Trinidad and Tobago",
                        "TV": "Tuvalu",
                        "TZ": "Tanzania",
                        "UA": "Ukraine",
                        "UG": "Uganda",
                        "UM": "United States Minor Outlying Islands",
                        "US": "United States",
                        "UY": "Uruguay",
                        "UZ": "Uzbekistan",
                        "VA": "Vatican",
                        "VC": "Saint Vincent and the Grenadines",
                        "VE": "Venezuela",
                        "VG": "British Virgin Islands",
                        "VI": "U.S. Virgin Islands",
                        "VN": "Vietnam",
                        "VU": "Vanuatu",
                        "WF": "Wallis and Futuna",
                        "WS": "Samoa",
                        "YE": "Yemen",
                        "YT": "Mayotte",
                        "ZA": "South Africa",
                        "ZM": "Zambia",
                        "ZW": "Zimbabwe"
                    }
                },
                {
                    "value": "province",
                    "type": "text",
                    "translation": "Province"
                },
                {
                    "value": "src_ip",
                    "type": "text",
                    "translation": "Src IP"
                },
                {
                    "value": "host",
                    "type": "text",
                    "translation": "Host"
                },
                {
                    "value": "url_path",
                    "type": "text",
                    "translation": "URL Path"
                }
            ],
            "statistic:report:result": [
                {
                    "value": "type",
                    "type": "filterable_choice",
                    "translation": "Report Type",
                    "choices": {
                        "day": "day",
                        "week": "week",
                        "custom": "custom",
                        "month": "month"
                    }
                },
                {
                    "value": "targets",
                    "type": "text",
                    "translation": "Targets"
                },
                {
                    "value": "name__like",
                    "type": "text",
                    "translation": "Report Name"
                },
                {
                    "value": "timestamp__range",
                    "type": "time_range",
                    "translation": "Time Range"
                }
            ],
            "detect:rule_template:whitelist": [
                {
                    "value": "target_type",
                    "type": "filterable_choice",
                    "translation": "Target Type",
                    "choices": {
                        "CIDR": "CIDR",
                        "Session": "Session"
                    }
                },
                {
                    "value": "target",
                    "type": "text",
                    "translation": "Target"
                },
                {
                    "value": "comment__like",
                    "type": "text",
                    "translation": "Comment"
                }
            ],
            "log:access": [
                {
                    "value": "timestamp__range",
                    "type": "time_range",
                    "translation": "Time Range"
                },
                {
                    "value": "acl_rule_id",
                    "type": "text",
                    "translation": "ACL Rule ID"
                },
                {
                    "value": "acl_rule_template_id",
                    "type": "text",
                    "translation": "ACL Rule Template ID"
                }
            ],
            "log:plugin": [
                {
                    "value": "id__in",
                    "type": "text",
                    "translation": "ID"
                },
                {
                    "value": "timestamp__range",
                    "type": "time_range",
                    "translation": "Time Range"
                },
                {
                    "value": "plugin_id",
                    "type": "text",
                    "translation": "Plugin ID"
                },
                {
                    "value": "tag__like",
                    "type": "text",
                    "translation": "Tag"
                },
                {
                    "value": "content__like",
                    "type": "text",
                    "translation": "Content"
                }
            ]
        },
        "reset_data_config_list": [
            {
                "category": "General",
                "types": [
                    {
                        "value": "User",
                        "translation": "User",
                        "description": "User 'admin' will be skipped"
                    },
                    {
                        "value": "Report Result",
                        "translation": "Report Result",
                        "description": ""
                    },
                    {
                        "value": "Website And Policy",
                        "translation": "Website And Policy",
                        "description": ""
                    },
                    {
                        "value": "Alarm Subscription",
                        "translation": "Alarm Subscription",
                        "description": ""
                    }
                ]
            },
            {
                "category": "Log",
                "types": [
                    {
                        "value": "metrics.requestlogbasic",
                        "translation": "Request Log Basic",
                        "description": ""
                    },
                    {
                        "value": "metrics.requestlogdetail",
                        "translation": "Request Log Detail",
                        "description": ""
                    },
                    {
                        "value": "acl.aclruleexecutionlog",
                        "translation": "ACL Rule Execution Log",
                        "description": ""
                    },
                    {
                        "value": "mario.pluginlog",
                        "translation": "Plugin Log",
                        "description": ""
                    },
                    {
                        "value": "management.auditlog",
                        "translation": "Audit Log",
                        "description": ""
                    }
                ]
            },
            {
                "category": "ACL Data",
                "types": [
                    {
                        "value": "acl.aclipdata",
                        "translation": "ACL IP Data",
                        "description": ""
                    },
                    {
                        "value": "acl.aclipwebsitedata",
                        "translation": "ACL IP Website Data",
                        "description": ""
                    },
                    {
                        "value": "acl.aclipurldata",
                        "translation": "ACL IP URL Data",
                        "description": ""
                    },
                    {
                        "value": "acl.aclsessiondata",
                        "translation": "ACL Session Data",
                        "description": ""
                    },
                    {
                        "value": "acl.aclsessionwebsitedata",
                        "translation": "ACL Session Website Data",
                        "description": ""
                    },
                    {
                        "value": "acl.aclsessionurldata",
                        "translation": "ACL Session URL Data",
                        "description": ""
                    }
                ]
            }
        ],
        "config_export_import_list": [
            {
                "value": "Alarm Subscription",
                "translation": "Alarm Subscription",
                "description": ""
            },
            {
                "value": "Alarm Threshold",
                "translation": "Alarm Threshold",
                "description": ""
            },
            {
                "value": "SMTP Config",
                "translation": "SMTP Config",
                "description": ""
            },
            {
                "value": "Report Subscription",
                "translation": "Report Subscription",
                "description": ""
            },
            {
                "value": "Mario Plugin",
                "translation": "Mario Plugin",
                "description": ""
            },
            {
                "value": "User",
                "translation": "User",
                "description": "User 'admin' will be skipped"
            }
        ],
        "syslog_template_config": [
            {
                "value": "audit_log",
                "translation": "Audit Log",
                "default_template": "\"$create_time\" \"$type\" \"$user\" \"$ip\" \"$user_agent\" \"$content\""
            },
            {
                "value": "request_log",
                "translation": "Request Log",
                "default_template": "\"$timestamp\" \"$node\" \"$event_id\" \"$protocol\" \"$src_ip\" \"$dest_ip\" \"$src_port\" \"$dest_port\" \"$attack_type\" \"$risk_level\" \"$action\" \"$selector_id\" \"$rule_id\" \"$module\" \"$session\" \"$payload\" \"$decode_path\" \"$location\" \"$method\" \"$host\" \"$urlpath\" \"$cookie\" \"$user_agent\" \"$referer\" \"$req_header_raw\" \"$body\" \"$resp_status_code\" \"$resp_reason_phrase\" \"$resp_header_raw\" \"$resp_body\" \"$country\" \"$province\""
            }
        ]
    },
    "msg": null
}
```

