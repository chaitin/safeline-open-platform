local skynet = require "skynet"

match = {
    ip      = "0.0.0.0/0",
    host    = ".+",
    urlpath = ".+",
    type    = skynet.MATCH_TYPE_ALL,
    target  = skynet.MATCH_TARGET_DETECT,
}

function process(ip, host, urlpath)
    local attack_limit = 2
    local check_dur = 60*30
    local ban_dur = 60*60

    local ts = skynet.db_get(skynet.DB_LOCAL, ip..":ts")
    local log = skynet.get_detailed_info()
    local clear = function()
        skynet.db_del(skynet.DB_LOCAL, ip..":ts")
        skynet.db_del(skynet.DB_LOCAL, ip..":attack")
    end
    local reset = function()
        skynet.db_set(skynet.DB_LOCAL, ip..":ts", tostring(log.timestamp))
        skynet.db_add(skynet.DB_LOCAL, ip..":attack", 1)
    end

    if ts == nil then
        -- first time record
        reset()
    else
        if log.timestamp - tonumber(ts) < check_dur then
            local attack = skynet.db_get(skynet.DB_LOCAL, ip..":attack")
            if attack ~= nil and tonumber(attack) > attack_limit then
                -- exceed attack limit
                local key = {ip  = ip}
                skynet.action_ban(key, ban_dur)
                skynet.log("process", "ban "..ip)
                clear()
            else
                -- normal record
                skynet.db_add(skynet.DB_LOCAL, ip..":attack", 1)
            end
        else
            -- exceed check duration, reset record
            clear()
            reset()
        end
    end
end

skynet.register(skynet.TYPE_PROCESS, match, process)
