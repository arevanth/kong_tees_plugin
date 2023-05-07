local cjson_safe = require("cjson.safe")
local http = require("resty.http")
local ltn12 = require("ltn12")

local TEESHandler = {
    VERSION  = "1.0.0",
    PRIORITY = 1,
}


function TEESHandler:init_worker()
    kong.log.debug("Started TEESHandler")
end

function TEESHandler:access(conf)
    local json_body = assert(cjson_safe.encode({ input = input }))

    local res, err = http.new():request_uri("http://example.com/helloworld", {
        method = "POST",
        body = json_body,
        headers = {
            ["Content-Type"] = "application/json",
        },
        keepalive_timeout = conf.server.connection.timeout,
        keepalive_pool = conf.server.connection.pool
    })

    if err then
        error(err) -- failed to request the endpoint
    end

    -- deserialize the response into a Lua table
    return assert(cjson_safe.decode(res.body))
end