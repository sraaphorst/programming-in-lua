#!/usr/bin/env lua
function factorial(n)
  if n < 0 then
    return 0
  end
  if n == 0 then
    return 1
  else
    return n * factorial(n-1)
  end
end

for k, v in pairs(arg) do
  if k > 0 then
    print(v, factorial(tonumber(v)))
  end
end
