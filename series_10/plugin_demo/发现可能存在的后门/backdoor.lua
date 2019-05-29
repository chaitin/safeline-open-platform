local skynet = require "skynet"
local match = {
    host = ".*",
    urlpath = ".*",
	type = skynet.MATCH_TYPE_ALL,
    target = skynet.MATCH_TARGET_DETECT,
}

function process()
    local info = skynet.get_detailed_info()
  	if info.attack_type == 5 and info.resp_status_code == "200" then
        skynet.log('backdoor', string.format("发现疑似后门: [%s%s], 请求 IP 为 [%s]", info.host, info.urlpath, info.src_ip))
    end
end

skynet.register(skynet.TYPE_PROCESS, match, process)