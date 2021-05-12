local skynet = require "skynet"

local match = {
    host = ".*",
    urlpath = ".*",
    type = skynet.MATCH_TYPE_DEFAULT,
    target = skynet.MATCH_TARGET_ACCESS
}

function check_urlpath(urlpath)
    urlpath_l = string.lower(urlpath)
    kws = {"login"}
    for i, s in ipairs(kws) do
        if string.find(urlpath_l, s, 0) ~= nil then
            return true
        end
    end
    return false
end

function cat(host, urlpath)
    if string.sub(host, -1) == "/" and string.sub(urlpath, 0, 1) == '/' then
        return string.sub(host, 0, -2)..urlpath
    elseif string.sub(host, -1) ~= "/" and string.sub(urlpath, 0, 1) ~= '/' then
        return host.."/"..urlpath
    else
        return host..urlpath
    end
end

function process(ip, host, urlpath)
    ip_domain_paths = skynet.top_n(skynet.TOP_IP_HOST_URLPATH, 100, 5)
    for i, record in pairs(ip_domain_paths) do
        if record["count"] >= 10 then
            if check_urlpath(record["urlpath"]) then
                skynet.log("[brute]", string.format("发现 IP [%s] 疑似在尝试对 [%s] 进行暴力破解攻击", record["ip"], cat(record["host"], record["urlpath"])))
            end
        end
    end
end

skynet.register(skynet.TYPE_PROCESS, match, process)
