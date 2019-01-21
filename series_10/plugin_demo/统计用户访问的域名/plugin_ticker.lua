local skynet = require "skynet"
 
local duration = 60 * 60 * 24
 
local key_prefix = "domain"
local index = key_prefix .. ":" .. "index"
 
function split(str)
    fields = {}
    for token in string.gmatch(str, "[^%s]+") do
        table.insert(fields, token)
    end
    return fields
end
 
function ticker(dur)
    local result = ""
    local domains = skynet.db_get(skynet.DB_GLOBAL, index)
    local map = {}
 
    if domains ~= nil then
        -- Domains deduplicate
        domains = split(domains)
        for i, domain in ipairs(domains) do
            map[domain] = true
        end
    end
 
    for domain, _ in pairs(map) do
        local key = key_prefix .. ":" .. domain
        local val = tonumber(skynet.db_get(skynet.DB_GLOBAL, key))
        if val ~= nil then
            if result == "" then
                result = domain .. " " .. val
            else
                result = result .. ", " .. domain .. " " .. val
            end
        end
    end
 
    skynet.db_del(skynet.DB_GLOBAL, index)
    for domain, _ in pairs(map) do
        local key = key_prefix .. ":" .. domain
        skynet.db_del(skynet.DB_GLOBAL, key)
    end
 
    if result == "" then
        result = "<empty>"
    end
    skynet.log("domain-ticker", result)
end
 
skynet.register(skynet.TYPE_TICKER, duration, ticker)
