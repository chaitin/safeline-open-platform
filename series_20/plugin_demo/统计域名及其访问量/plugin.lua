local safeline = require("safeline")

local arg_range = 60 * 60 * 24
local arg_period = 60

local query = string.format([[
SELECT host, COUNT(host) AS count_
FROM access_log
GROUP BY SLIDE_WINDOW(NOW(), %d, %d), host
ORDER BY COUNT(host)
]], arg_range, arg_period)

function process(key, rows)
    local domain_list = ""
    for row in rows do
        domain_list = domain_list .. string.format("域名 %s 在最近 %d 小时内被访问了 %d 次\n", row.host, arg_range / (60 * 60), row.count_)
    end
    if domain_list == "" then
        safeline.log("统计", "暂无已知的域名")
    else
        safeline.log("统计", domain_list)
    end
end

safeline.register(safeline.TYPE_QUERY, query, process)
