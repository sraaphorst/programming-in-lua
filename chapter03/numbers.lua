-- Most of the time floats and integers are interchangeable.
-- type(n) always returns number
-- If we need to know float vs integer, use math.type:
print(math.type(5.0))
print(math.type(5))

-- Normal divison gives a float.
print(5 / 2)

-- Integer division:
print(5 // 2)

-- mod always returns positive.
print(-7 % 5)

-- You can use mod with float
print(math.pi % 0.01)
print(math.pi - math.pi%0.01)


local tolerance = 10
function isturnback(angle)
  angle = angle % 360
  return math.abs(angle - 180) < tolerance
end

print(isturnback(189))

-- Exponentiation is done by caret, but is always a float.
print(2^-2)
print(27^(1/3))
print(2^2)

-- All regular relational operators except !=, but ~= is used instead.
print(4 ~= 4.0)

-- RNG: math.random
-- without args, [0,1)
print(math.random())
-- with one arg n, [1,n].
print(math.random(2))
--with lower and upper, [lower, upper]
print(math.random(1, 6))

-- Seeding the RNG is necessary or we will generate always the same values:
math.randomseed(os.time())

-- Three rounding functions: floor, ceil, modf
-- modf rounds towards zero and returns both the rounded value and the fractional value.
print(math.floor(3.3))
print(math.ceil(-3.3))
print(math.modf(-3.3))
print(math.modf(3.3))


-- Rounding is a bit more complicated because large numbers do not have a precise
-- representation as a float. Example:
-- 2^52 + 1.5 does not have a precise representation as a float, so this returns
-- incorrectly.
x = 2^52 + 1
print(string.format("%d %d", x, math.floor(x + 0.5)))

-- Instead, make a round function.
-- This, however, always round half-integers up, which may be considered biased.
function round(x)
  local f = math.floor(x)
  if x == f then
    return f
  else
    return math.floor(x + 0.5)
  end
end

print(round(3.5)) -- 4
print(round(2.5)) -- 3 !!!

-- For unbiased rounding (round to nearest even integer), use:
function unbiased_round(x)
  local f = math.floor(x)
  if x == f or x % 2.0 == 0.5 then
    return f
  else
    return math.floor(x + 0.5)
  end
end

print(unbiased_round(3.5)) -- 4
print(unbiased_round(2.5)) -- 2


-- maximum values
-- max is 0x7fffffffffffffff
-- min is 0x8000000000000000
print('Maximum integer: ', math.maxinteger)
print('Minimum integer: ', math.mininteger)

-- For floating point, uses standard double precision.
-- 64 bits, 11 used for mantissa.
print(12.7 - 20 + 7.3)

-- To force a number to be a float, we can add 0.0 to it.
-- Any integer up to 2^53 has an exact float representation.
print(-3 + 0.0)

-- To force a number to be an integer, we can binary OR it with 0.
-- This ONLY works when the number is an integer. If it has a fractional part, it fails.
print(2^53 | 0)
-- Fail: print(2.3 | 0)
print(2.3 - 2.3%1 | 0)

-- Use math.tointeger, which returns nil if the number is not an integer.
print(math.tointeger(2.3))
print(math.tointeger(2^53))

-- Function to convert a number to an integer when possible, leaving it as a float
-- otherwise.
function cond2int(x)
  return math.tointeger(x) or x
end

