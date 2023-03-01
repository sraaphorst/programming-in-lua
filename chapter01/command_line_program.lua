#!/usr/bin/env lua
print("Running from lua!")

-- To run lua directly from the command line:
-- $ lua -e "print(math.sin(math.pi) ~= 0)"

-- The -l option loads a library, -i enters interactive mode:
-- $ lua -lfactorial -e "print(facttr($1))"

-- Command line arrguments are accessed through global variable:
-- arg

-- $ lua -e "sin=math.sin" script a b
-- arg[-3] = "lua"
-- arg[-2] = "-e"
-- arg[-1] = "sin=math.sin"
-- arg[0] = "script"
-- arg[1] = "a"
-- arg[2] = "b"
-- Can also retrieve arguments using vararg expression ... (later)
