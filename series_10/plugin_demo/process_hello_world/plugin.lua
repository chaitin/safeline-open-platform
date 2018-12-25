local skynet = require "skynet"
 
local match = {
    ip      = "0.0.0.0/0",          -- 字符串类型，要匹配的 ip 段，使用 cidr 记法
    host    = ".*\\.chaitin\\.cn",  -- 字符串类型，要匹配的域名，支持 perl 风格的正则表达式
    urlpath = ".*",                 -- 字符串类型，访问路径，同样支持正则
    type    = skynet.MATCH_TYPE_ALL,
    target  = skynet.MATCH_TARGET_ALL,
}
 
 
function process(ip, host, urlpath)
    skynet.log("hello world", host .. urlpath)
end
 
skynet.register(skynet.TYPE_PROCESS, match, process)
