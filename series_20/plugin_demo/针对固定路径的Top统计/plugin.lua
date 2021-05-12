local safeline = require("safeline")

local arg_host = "chaitin.cn"
local arg_url_path = "/safeline.html"
local arg_range = 60 * 10
local arg_period = 5
local arg_threshold = 10

local query = string.format([[
SELECT ip, COUNT(ip) AS count_
FROM access_log
WHERE (host = %q) AND (url_path = %q)
GROUP BY SLIDE_WINDOW(NOW(), %d, %d), ip
ORDER BY COUNT(host)
LIMIT %d
]], arg_host, arg_url_path, arg_range, arg_period, arg_threshold)

function process(key, rows)
    local top_list = ""
    local i = 0
    for row in rows do
        top_list = top_list .. string.format("#%d. IP %s 在最近 %d 分钟内访问了 %s%s %d 次\n", i, row.ip, arg_range/60, arg_host, arg_url_path, row.count_)
        i = i + 1
    end
    if top_list == "" then
        safeline.log("统计", string.format("最近 %d 分钟内没有任何访问 %s%s 的请求", arg_range/60, arg_host, arg_url_path))
    else
        safeline.log("统计", top_list)
    end
end

safeline.register(safeline.TYPE_QUERY, query, process)
