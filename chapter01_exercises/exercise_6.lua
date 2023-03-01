#!/usr/bin/env lua
function test(x, y, z)
  a = (x and y and (not z)) or ((not y) and x)
  b = x and y and not z or not y and x
  return a == b
end

print(test(true, true, true))
print(test(true, true, false))
print(test(true, false, true))
print(test(true, false, false))
print(test(false, true, true))
print(test(false, true, false))
print(test(false, false, true))
print(test(false, false, false))

