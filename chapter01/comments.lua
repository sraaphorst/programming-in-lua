--[[A multi-line
long comment
]]



-- To inactive code:
--[[
  print(10)
--]]

--[[
To reactive code, oddly.
This is because the -- starts a line comment, and thus
a ---[[ parses into:
  -- -[[
statements
--]] --(independent comment)
-- Example:
---[[
  print(10)
--]]
