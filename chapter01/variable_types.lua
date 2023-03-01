-- Lua is dynamically typed. Each value carries its own type. There are eight basic ones:
print("\nTypes:")
print(type(nil))        -- nil
print(type(true))       -- boolean
print(type(10.4 * 3))   -- number
print(type("Hello"))    -- string
print(type(io.stdin))   -- userdata
print(type(print))      -- function
print(type(type))       -- function
print(type({}))         -- table
print(type(type(X)))    -- string, because value of type is always string no matter what arg is

-- userdata allows arbitrary C data to be stored in Lua variables.
-- undefined variables are nil