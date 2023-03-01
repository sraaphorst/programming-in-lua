-- Function to try to find a numerator such that in the given base, the numerator can be
-- expressed as an integer divided by a power of the base.
function repr(number, base, tries)
  print("Trying to represent "..number.." in base "..base..':')
  denominator = 1
  for i = 1, tries do
    denominator = base * denominator
    numerator = number * denominator
    print(numerator, " / ", denominator)
    if math.tointeger(numerator) then
      return
    end
  end
end

-- 12.7: not possible to express as a fraction in binary: otherwise we could express it in
-- hexadecimal.
-- print(0xc + 0x1p-1 + 0x1p-3 + 0x1p-4 + 0x1p-7 + 0x1p-8 + 0x1p-11 + 0x1p-12)
-- This just loops between x + 0.4, x + 0.8, x + 0.6, x + 0.2
repr(12.7, 2, 30)

-- 5.5: possible to express in binary. The fraction is 0x1p-1.
-- print(0x5 + 0x1p-1)
-- Succeeds on first try.
repr(5.5, 2, 30)

