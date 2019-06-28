local skynet = require "skynet"

match = {
    ip      = "0.0.0.0/0",
    host    = ".+",
    urlpath = ".+",
    type    = skynet.MATCH_TYPE_ALL,
    target  = skynet.MATCH_TARGET_DETECT,
}

function legalIp(ip)
	
	white = {'8.8.8.8','9.9.9.9'}
	c = ip
	ip_part = {}
	flag = 0
	for i,value in pairs(white) do
		if value==ip then
			return nil
		end
	end
	
	for i in string.gmatch(c,"%d+") do
		if tonumber(i)>255 or tonumber(i)<0 then 
			return nil
		end 
		ip_part[#ip_part+1]=i
	end
	if ip_part[1]=='10' or ip_part[1]=='127' then 
		return nil
	elseif ip_part[1]=='172' and (tonumber(ip_part[2])>=16 and tonumber(ip_part[2])<=31) then 
		return nil
	elseif ip_part[1]=='192' and ip_part[2]=='168' then
		return nil
	end 
	if flag ==0 then 
		return 1
	end
end


function getIp(content)
	local ipArray = ""
	for c in string.gmatch(content,"%d+%.%d+%.%d+%.%d+") do
		if c ~= nil and legalIp(c) then 
			if string.find(ipArray,c) == nil then 
				ipArray = ipArray ..c..", "
				content = string.gsub(content,c,'')
			end 
		end
	end
	return ipArray
end 


function process(ip, host, urlpath)
    local ban_risk = 3       

    local log = skynet.get_detailed_info()
    local attack_num = log.attack_type+1
    if log.risk_level < ban_risk then
        return
    end
    local ans = getIp(log.req_header_raw) 
    att_type ={'sql_injection', 'xss', 'csrf', 'ssrf', 'dos', 'backdoor', 'deserialization', 'code_execution', 'code_injection', 'command_injection', 'file_upload', 'file_inclusion', 'redirect', 'weak_permission', 'info_leak', 'unauthorized_access', 'unsafe_config', 'xxe', 'xpath_injection', 'ldap_injection', 'directory_traversal', 'scanner', 'permission_bypass', 'acl_bypass', 'file_write', 'file_download', 'file_deletion', 'logic_error', 'crlf_injection', 'ssti', 'click_hijacking', 'buffer_overflow', 'integer_overflow', 'format_string', 'race_condition', 'timeout', 'unknown'}

    if ans == "" then
    	ans = log.src_ip
    	skynet.log(att_type[attack_num],ans)
    else 
		new_ans = string.gsub(ans,log.dest_ip,'')
    	skynet.log(att_type[attack_num],string.sub(new_ans,1,-3))
    end 
end

skynet.register(skynet.TYPE_PROCESS, match, process)