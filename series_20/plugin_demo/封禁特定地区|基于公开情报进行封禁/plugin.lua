local safeline = require "safeline"

--  ipdata.co API 地址
local url = "https://api.ipdata.co/%s?api-key=%s"

-- api key
local api_key = "****" -- 替换为自己的 key

-- 封禁时间
local bantime = 60

-- 拦截地区，字段可省略
local blocks = {
    {country_code = "US"}, -- 拦截美国的请求
    {country_code = "CN", region = "zhejiang", city = "hangzhou"}, -- 浙江省杭州市，拼音
    {country_code = "CN", region = "sichuan"}, -- 四川省，拼音
    {country_code = "CN", region = "beijing"} -- 北京直辖市，拼音
}

-- 按威胁情报拦截，表项为 true 表示封禁该类型的 ip
local block_by_threat = {
    is_threat = true, -- 威胁 ip
    is_anonymous = true, -- 匿名访问者
    is_bogon = true, -- 伪装身份
    is_abuser = true, -- 刷子（刷分、羊毛）
    is_proxy = true, -- 代理节点
    is_tor = true, -- TOR 节点
    is_known_attacker = true -- 已知攻击者
}

match = {
    ip = "0.0.0.0/0",
    host = ".+",
    urlpath = ".+",
    type = safeline.MATCH_TYPE_ALL
}

function make_region_key(t)
    local rk = ""
    local country = t["country_code"]
    if country ~= nil then
        rk = rk .. country
    else
        rk = rk .. "CN"
    end
    local region = t["region"]
    if region ~= nil and string.len(region) > 0 then
        rk = rk .. "_" .. region
        local city = t["city"]
        if city ~= nil and string.len(city) > 0 then
            rk = rk .. "_" .. city
        end
    end
    return string.lower(rk)
end

local block_region_keys = {}
for i, v in ipairs(blocks) do table.insert(block_region_keys, make_region_key(v)) end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. k .. ':' .. dump(v) .. ','
        end
        s = s:sub(1, -2)
        return s .. '} '
    else
        if type(o) == 'number' then
            return tostring(o)
        else
            return '"' .. tostring(o) .. '"'
        end
    end
end

--[[ json.lua
A compact pure-Lua JSON library.
The main functions are: json.stringify, json.parse.
## json.stringify:
This expects the following to be true of any tables being encoded:
 * They only have string or number keys. Number keys must be represented as
   strings in json; this is part of the json spec.
 * They are not recursive. Such a structure cannot be specified in json.
A Lua table is considered to be an array if and only if its set of keys is a
consecutive sequence of positive integers starting at 1. Arrays are encoded like
so: `[2, 3, false, "hi"]`. Any other type of Lua table is encoded as a json
object, encoded like so: `{"key1": 2, "key2": false}`.
Because the Lua nil value cannot be a key, and as a table value is considerd
equivalent to a missing key, there is no way to express the json "null" value in
a Lua table. The only way this will output "null" is if your entire input obj is
nil itself.
An empty Lua table, {}, could be considered either a json object or array -
it's an ambiguous edge case. We choose to treat this as an object as it is the
more general type.
To be clear, none of the above considerations is a limitation of this code.
Rather, it is what we get when we completely observe the json specification for
as arbitrary a Lua object as json is capable of expressing.
## json.parse:
This function parses json, with the exception that it does not pay attention to
\u-escaped unicode code points in strings.
It is difficult for Lua to return null as a value. In order to prevent the loss
of keys with a null value in a json string, this function uses the one-off
table value json.null (which is just an empty table) to indicate null values.
This way you can check if a value is null with the conditional
`val == json.null`.
If you have control over the data and are using Lua, I would recommend just
avoiding null values in your data to begin with.
--]]

local json = {}

-- Internal functions.

local function kind_of(obj)
    if type(obj) ~= 'table' then return type(obj) end
    local i = 1
    for _ in pairs(obj) do
        if obj[i] ~= nil then
            i = i + 1
        else
            return 'table'
        end
    end
    if i == 1 then
        return 'table'
    else
        return 'array'
    end
end

local function escape_str(s)
    local in_char = {'\\', '"', '/', '\b', '\f', '\n', '\r', '\t'}
    local out_char = {'\\', '"', '/', 'b', 'f', 'n', 'r', 't'}
    for i, c in ipairs(in_char) do s = s:gsub(c, '\\' .. out_char[i]) end
    return s
end

-- Returns pos, did_find; there are two cases:
-- 1. Delimiter found: pos = pos after leading space + delim; did_find = true.
-- 2. Delimiter not found: pos = pos after leading space;     did_find = false.
-- This throws an error if err_if_missing is true and the delim is not found.
local function skip_delim(str, pos, delim, err_if_missing)
    pos = pos + #str:match('^%s*', pos)
    if str:sub(pos, pos) ~= delim then
        if err_if_missing then
            safeline.log("test",
                         'Expected ' .. delim .. ' near position ' .. pos)
        end
        return pos, false
    end
    return pos + 1, true
end

-- Expects the given pos to be the first character after the opening quote.
-- Returns val, pos; the returned pos is after the closing quote character.
local function parse_str_val(str, pos, val)
    val = val or ''
    local early_end_error = 'End of input found while parsing string.'
    if pos > #str then safeline.log("test", early_end_error) end
    local c = str:sub(pos, pos)
    if c == '"' then return val, pos + 1 end
    if c ~= '\\' then return parse_str_val(str, pos + 1, val .. c) end
    -- We must have a \ character.
    local esc_map = {b = '\b', f = '\f', n = '\n', r = '\r', t = '\t'}
    local nextc = str:sub(pos + 1, pos + 1)
    if not nextc then safeline.log("test", early_end_error) end
    return parse_str_val(str, pos + 2, val .. (esc_map[nextc] or nextc))
end

-- Returns val, pos; the returned pos is after the number's final character.
local function parse_num_val(str, pos)
    local num_str = str:match('^-?%d+%.?%d*[eE]?[+-]?%d*', pos)
    local val = tonumber(num_str)
    if not val then
        safeline.log("test", 'Error parsing number at position ' .. pos .. '.')
    end
    return val, pos + #num_str
end

-- Public values and functions.

function json.stringify(obj, as_key)
    local s = {} -- We'll build the string as an array of strings to be concatenated.
    local kind = kind_of(obj) -- This is 'array' if it's an array or type(obj) otherwise.
    if kind == 'array' then
        if as_key then
            safeline.log("test", 'Can\'t encode array as key.')
        end
        s[#s + 1] = '['
        for i, val in ipairs(obj) do
            if i > 1 then s[#s + 1] = ', ' end
            s[#s + 1] = json.stringify(val)
        end
        s[#s + 1] = ']'
    elseif kind == 'table' then
        if as_key then
            safeline.log("test", 'Can\'t encode table as key.')
        end
        s[#s + 1] = '{'
        for k, v in pairs(obj) do
            if #s > 1 then s[#s + 1] = ', ' end
            s[#s + 1] = json.stringify(k, true)
            s[#s + 1] = ':'
            s[#s + 1] = json.stringify(v)
        end
        s[#s + 1] = '}'
    elseif kind == 'string' then
        return '"' .. escape_str(obj) .. '"'
    elseif kind == 'number' then
        if as_key then return '"' .. tostring(obj) .. '"' end
        return tostring(obj)
    elseif kind == 'boolean' then
        return tostring(obj)
    elseif kind == 'nil' then
        return 'null'
    else
        error('Unjsonifiable type: ' .. kind .. '.')
    end
    return table.concat(s)
end

json.null = {} -- This is a one-off table to represent the null value.

function json.parse(str, pos, end_delim)
    pos = pos or 1
    if pos > #str then
        safeline.log("test", 'Reached unexpected end of input.')
    end
    local pos = pos + #str:match('^%s*', pos) -- Skip whitespace.
    local first = str:sub(pos, pos)
    if first == '{' then -- Parse an object.
        local obj, key, delim_found = {}, true, true
        pos = pos + 1
        while true do
            key, pos = json.parse(str, pos, '}')
            if key == nil then return obj, pos end
            if not delim_found then
                safeline.log("test", 'Comma missing between object items.')
            end
            pos = skip_delim(str, pos, ':', true) -- true -> error if missing.
            obj[key], pos = json.parse(str, pos)
            pos, delim_found = skip_delim(str, pos, ',')
        end
    elseif first == '[' then -- Parse an array.
        local arr, val, delim_found = {}, true, true
        pos = pos + 1
        while true do
            val, pos = json.parse(str, pos, ']')
            if val == nil then return arr, pos end
            if not delim_found then
                safeline.log("test", 'Comma missing between array items.')
            end
            arr[#arr + 1] = val
            pos, delim_found = skip_delim(str, pos, ',')
        end
    elseif first == '"' then -- Parse a string.
        return parse_str_val(str, pos + 1)
    elseif first == '-' or first:match('%d') then -- Parse a number.
        return parse_num_val(str, pos)
    elseif first == end_delim then -- End of an object or array.
        return nil, pos + 1
    else -- Parse true, false, or null.
        local literals = {
            ['true'] = true,
            ['false'] = false,
            ['null'] = json.null
        }
        for lit_str, lit_val in pairs(literals) do
            local lit_end = pos + #lit_str - 1
            if str:sub(pos, lit_end) == lit_str then
                return lit_val, lit_end + 1
            end
        end
        local pos_info_str = 'position ' .. pos .. ': ' ..
                                 str:sub(pos, pos + 10)
        safeline.log("test", 'Invalid json syntax starting at ' .. pos_info_str)
    end
end

function banbanban(ip, body)
    local banip = {ip = ip}
    local num = string.len(body)
    local content = json.parse(body, 1, "}")

    -- 检查当前 ip 是否在封禁区域
    local max_depth = 1
    local matching = {string.lower(content["country_code"])}
    if type(content["region"]) == "string" then
        table.insert(matching, string.lower(content["region"]))
        max_depth = max_depth + 1
    end
    if type(content["city"]) == "string" then
        table.insert(matching, string.lower(content["city"]))
        max_depth = max_depth + 1
    end

    -- safeline.log("[debug]", dump(matching))
    for i, v in ipairs(block_region_keys) do
        local match_depth = 1
        local do_ban = false
        for k in string.gmatch(v, "[^_]+") do
            if match_depth > max_depth then break end
            if matching[match_depth] == k then
                do_ban = true
            else
                do_ban = false
                break
            end
            match_depth = match_depth + 1
        end
        if do_ban then
            safeline.action_ban(safeline.ACTION_SCOPE_ALL, banip, bantime)
            safeline.log("区域封禁", body)
            break
        end
    end

    -- 检查当前 ip 是否命中威胁情报拦截规则
    for k, v in pairs(block_by_threat) do
        if v == true then
            if content["threat"][k] == "true" or content["threat"][k] == true then
                safeline.action_ban(safeline.ACTION_SCOPE_ALL, banip, bantime)
                safeline.log("威胁情报封禁", body)
                break
            end
        end
    end
end

function process(ip, host, urlpath)
    urltmp = string.format(url, ip, api_key)
    local resp, err = safeline.http_get(urltmp, {})
    if err ~= nil and string.len(err) > 0 then
        safeline.log("[http]", dump(err))
    else
        banbanban(ip, resp["body"])
    end
end

safeline.register(safeline.TYPE_PROCESS, match, process)
