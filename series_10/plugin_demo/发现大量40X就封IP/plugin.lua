local skynet = require "skynet"
local limit = 50               -- 产生4xx错误的最大次数
local duration = 120           -- 过去几分钟内（两分钟）
local bantime = 2 * 24 * 3600  -- 封禁的秒数

-- 匹配规则是对所有IP进行匹配

local match = {
    host = ".*",
    urlpath = ".*",
	type = skynet.MATCH_TYPE_DEFAULT,
    target = skynet.MATCH_TARGET_ALL
}

skynet.register(skynet.TYPE_PROCESS, match,
    function(ip, host, urlpath)
        -- 将会统计所有的IP的在过去两分钟内的次数。
        local ipkey = {ip = ip}
        local stat = skynet.stat_resp_code(ipkey, duration)
        
        -- 封大于50次的人两天
        local st4xx = stat[skynet.RESP_CODE_4XX]
        if st4xx ~= nil and st4xx > limit then
          skynet.action_ban(ipkey, bantime)
        end
    end
)
