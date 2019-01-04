local skynet = require "skynet"

match = {
    ip      = "0.0.0.0/0",
    host    = ".+",
    urlpath = ".+",
    type    = skynet.MATCH_TYPE_ALL,
    target  = skynet.MATCH_TARGET_DETECT,
}

function clear(ip)
    skynet.db_del(skynet.DB_LOCAL, ip..":ts")
    skynet.db_del(skynet.DB_LOCAL, ip..":attack")
end

function reset(log, ip)
    skynet.db_set(skynet.DB_LOCAL, ip..":ts", tostring(log.timestamp))
    skynet.db_add(skynet.DB_LOCAL, ip..":attack", 1)
end

function process(ip, host, urlpath)
    local attack_limit = 3     -- 累积攻击次数
    local check_dur = 60 * 30  -- 攻击次数统计时间，单位秒
    local ban_dur = 60 * 60    -- 封禁时间，单位秒
    local ban_risk = 3         -- 需要统计的威胁等级，3 代表只统计高危，2 代表统计中高危，1代表统计中高低危

    local log = skynet.get_detailed_info()

    if log.risk_level < ban_risk then
        return
    end

    local ts = skynet.db_get(skynet.DB_LOCAL, ip..":ts")

    if ts == nil then
        -- first time record
        reset(log, ip)
    else
        if log.timestamp - tonumber(ts) < check_dur then
            local attack = skynet.db_get(skynet.DB_LOCAL, ip..":attack")
            if attack ~= nil and tonumber(attack) >= attack_limit then
                -- exceed attack limit
                local key = {ip  = ip}
                skynet.action_ban(key, ban_dur)
                skynet.log("process", "ban "..ip)
                clear(ip)
            else
                -- normal record
                skynet.db_add(skynet.DB_LOCAL, ip..":attack", 1)
            end
        else
            -- exceed check duration, reset record
            clear(ip)
            reset(log, ip)
        end
    end
end

skynet.register(skynet.TYPE_PROCESS, match, process)
