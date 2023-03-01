function volume(height, angle)
  -- Standard formula for volume is pi * r^2 * h / 3
  -- where r is the length of the radius.
  -- Thus, we get the length of the radius using basic trigonometry.
  -- tan(angle) = h/r, we want r, so r = h / tan(angle).
  local radius = height / math.tan(angle)
  return math.pi * radius^2 * height / 3
end

function volume2(height, radius)
  return math.pi * radius^2 * height / 3
end

math.randomseed(os.time())
for i = 1,10 do
  local height = math.random() * 15
  local radius = math.random() * 10
  print("Height: "..height..", radius: "..radius)
  print(volume(height, math.atan(height / radius)))
  print(volume2(height, radius))
end
