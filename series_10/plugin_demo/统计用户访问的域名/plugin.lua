local skynet = require "skynet"

match = {
    ip      = "0.0.0.0/0",
    -- host    = ".+",
    -- urlpath = ".+",
    type    = skynet.MATCH_TYPE_ALL,
    target  = skynet.MATCH_TARGET_ALL,
}

function process(ip, host, urlpath)
    if skynet.db_get(skynet.DB_LOCAL, host) == nil then
        skynet.db_set(skynet.DB_LOCAL, host, host)
        skynet.log("new-ip", host)
        -- or skynet.http_post(...)
    end
end

skynet.register(skynet.TYPE_PROCESS, match, process)
