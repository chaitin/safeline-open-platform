local safeline = require("safeline")

local arg_threshold = 1.0
local arg_period = 5

local query = string.format([[
SELECT ip, host, url_path, SUM(time)/COUNT(ip) AS avg_time
FROM access_log WHERE time > %f
GROUP BY TUMBLE_WINDOW(NOW(), %d), ip, host, url_path
]], arg_threshold, arg_period)

function process(key, rows)
    local ip_list = ""
    for row in rows do
        ip_list = ip_list .. string.format("IP %s 访问 %s/%s 耗时 %f 秒，告警阈值为 %f 秒\n", row.ip, row.host, row.url_path, row.avg_time, arg_threshold)
    end
    if ip_list ~= "" then
        safeline.log("警告", ip_list)
    end
end

safeline.register(safeline.TYPE_QUERY, query, process)
