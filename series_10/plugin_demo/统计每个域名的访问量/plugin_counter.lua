local skynet = require "skynet"
 
local match = {
    ip      = "0.0.0.0/0",
    type    = skynet.MATCH_TYPE_ALL,
    target  = skynet.MATCH_TARGET_ACCESS,
}
 
local key_prefix = "domain"
local index = key_prefix .. ":" .. "index"
 
function process(ip, host, urlpath)
    local key = key_prefix .. ":" .. host
 
    -- Add host to domain index
    if tonumber(skynet.db_get(skynet.DB_GLOBAL, key)) == nil then
        domains = skynet.db_get(skynet.DB_GLOBAL, index)
        if domains == nil then
            skynet.db_set(skynet.DB_GLOBAL, index, host)
        else
            skynet.db_set(skynet.DB_GLOBAL, index, domains .. " " .. host)
        end
    end
 
    skynet.db_add(skynet.DB_GLOBAL, key, 1)
end
 
skynet.register(skynet.TYPE_PROCESS, match, process)
