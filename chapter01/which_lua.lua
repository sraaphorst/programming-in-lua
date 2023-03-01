#!/usr/bin/env lua

-- Before running arguments, interpreter looks for env var named LUA_INIT_5_3 or
-- if it does not exist, LUA_INIT. If one exists and its content is @filename,
-- interpreter runs given file. If does not start with @ symbol, tries to execute
-- contents as code.
print(LUA_INIT_5_3 or LUA_INIT)

