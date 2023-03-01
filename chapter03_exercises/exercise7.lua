-- We need to convert a uniform distribution to the desired normal distribution.
function normal(mean, stddev)
  -- Use the Box-Muller transformation.
  -- https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform
  mean = mean or 0
  stddev = stddev or 1
  
  -- We do not want anything too close to zero.
  repeat
    u1 = math.random()
  until u1 > 1e-10
  u2 = math.random()
  
  -- By default creates two values. We only want one.
  local mag = stddev * math.sqrt(-2.0 * math.log(u1))
  local z0 = mag * math.cos(2 * math.pi * u2) + mean
  -- local z1 = mag * math.sin(2 * math.pi * u2) + mean
  return z0
end

-- Just for fun, use the Wechsler Adult Intelligence Scale (IQ) with mean 100, stddev = 15. 
math.randomseed(os.time())
for i = 1, 30 do
  print(normal(100, 15))
end
