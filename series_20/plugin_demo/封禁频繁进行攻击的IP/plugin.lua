local safeline = require("safeline")

local arg_range = 60 * 30
local arg_period = 5
local arg_threshold = 3

local query = string.format([[
SELECT ip
FROM access_log
WHERE req_block_reason = "web"
GROUP BY SLIDE_WINDOW(NOW(), %d, %d), ip
HAVING COUNT(ip) >= %d
]], arg_range, arg_period, arg_threshold)

function process(key, rows)
    local total_num = 0
    local err_num = 0
    for row in rows do
        err = safeline.action_ban(safeline.ACTION_SCOPE_ALL, { ip = row.ip }, 3600)
        total_num = total_num + 1
        if err ~= nil then
            err_num = err_num + 1
        end
    end
    if total_num ~= 0 then
        safeline.log("信息", string.format("本次需要封禁 %d 个 IP，其中 %d 个封禁失败", total_num, err_num))
    end
end

safeline.register(safeline.TYPE_QUERY, query, process)
