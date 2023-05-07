rockspec_format = "3.0"
package = "kong-tees-plugin"
version = "0.0.1-1"
source = {
   url = "git+https://github.com/rayalas1_uhg/kong_tees_poc.git",
   tag = "v0.0.1",
}
description = {
   summary = "Integrate the token exchange and enrichment service (TEES) with Kong API Gateway for token exchange and enrichment",
   detailed = [[
      see https://github.com/rayalas1_uhg/kong_tees_poc/tree/main for more information
   ]],
   homepage = "https://github.com/rayalas1_uhg/kong_tees_poc/tree/main",
   issues_url = "https://github.com/rayalas1_uhg/kong_tees_poc/issues",
}
dependencies = {
   "lua-cjson",
   "lua-resty-http",
   "lua-resty-jwt",
}
test_dependencies = {
   "luacov",
   "luacheck",
}
test = {
   type = "busted",
   flags = { "-o", "gtest" },
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.tees.handler"] = "src/kong/plugins/tees/handler.lua",
      ["kong.plugins.tees.schema"] = "src/kong/plugins/tees/schema.lua",
   },
}