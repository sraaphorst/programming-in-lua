-- In boolean tests, false and nil are interpreted as false
-- anything else is interpreted as true

-- logical operators that always use short circuit evaluation: and, or, not
-- A or B -> A if true, B if A is false
-- A and B -> false if A is false, B if A is true
print(4 and 5)
print(nil and 13)
print(false and 13)

-- Remember, 0 is true
print(0 or 5)
print(false or "hi")
print(nil or false)

-- Avoiding division by zero
zero = 0.000000000001
print(i ~= 0 and 5/zero > 10)

-- Useful Lua idiom: equivalent to setting a default value for x:
-- if not x then x = v end
x = x or 10
print(x)

-- Another useful idiom:
-- ((a and b) or c) OR (a and b or c)
-- and has higher precedence than or
-- Equivalent to a ? b : c
a = false
print(a and 5 or 10)

-- the not operator always gives a Boolean value.
print(not nil)       -- true
print(not false)     -- true
print(not 0)         -- false
print(not not 1)     -- true
print (not not nil)  -- false


