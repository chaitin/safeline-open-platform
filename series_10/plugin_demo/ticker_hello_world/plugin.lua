local skynet = require "skynet"
local os = require "os"
 
function ticker(dur)
    skynet.log("hello world", os.date("%H:%M:%S"))
end
 
skynet.register(skynet.TYPE_TICKER, 10, ticker)
