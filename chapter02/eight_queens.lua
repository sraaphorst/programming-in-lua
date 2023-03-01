-- Board size
N = 8

-- Keep track of the number of solutions.
solutions = 0

-- Keep track of the number of permutations.
permutations = 0

-- A board a is a permutation of [N] representing the placement
-- of a queen in position row i, col a[i].

-- Check whether position (n,c) is free from attacks.
function isplaceok(a, n, c)
  isplaceok_calls = isplaceok_calls + 1
  for i = 1, n-1 do
    if (a[i] == c) or           -- same column?
       (a[i] - i == c - n) or   -- same diagonal?
       (a[i] + i == c + n) then -- same diagonal?
         return false
    end
  end
  
  -- No attacks: place is okay.
  return true
end

-- Print a board.
function printboard(a)
  -- Print the position (row, col) for each queen.
  for r = 1, N do
    io.write("(", r, ",", a[r], ") ")
  end
  
  io.write("\n")
  for r = 1, N do    -- for each row
    for c = 1, N do  -- for each col
      io.write(a[r] == c and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
  solutions = solutions + 1
end


-- Add to board a all queens from n to N using simple backtracking.
-- We can prematurely stop by passing false to genall.
function addqueen(a, n, genall)
  if genall == nil then genall = true end
  -- Have all queens been placed?
  if n > N then
    printboard(a)
  elseif genall or (solutions == 0) then
      -- Try to place n-th queen.
      for c = 1, N do
        -- Check if queen placed in row n at position c is valud for board up to a[n[
        if isplaceok(a, n, c) then
          a[n] = c
          addqueen(a, n + 1, genall)
        end
      end
    end
  end
-- Generate all permutations of [N]
-- Idea: place each element in last position and call recursively.
-- a is the permutation, and n is the position.
function genallperms(a, n)
  -- If we have a full permutation, then check it.
  if n == 0 then
    permutations = permutations + 1
    -- Make sure all positions starting from 1 are valid.
    for r = 1, N do
      -- Check if queen placed in row r at position a[r] is valid for board up to a[r-1].
      if not isplaceok(a, r, a[r]) then
        return false
      end
    end
    printboard(a)
  else
    for i = 1, n do
      -- Put ith element as the last element
      a[n], a[i] = a[i], a[n]
      
      -- Generate all permutations recursively.
      genallperms(a, n - 1)
      
      -- Restore the ith element.
      a[n], a[i] = a[i], a[n]
    end
  end
end

-- Run the problem with backtracking.
isplaceok_calls = 0
addqueen({}, 1)
-- Use to limit the output to first solution;
-- addqueen({}, 1, false)
backtracking_solutions = solutions 
backtracking_calls = isplaceok_calls


-- Run the problem with permutations.
---[[
solutions = 0
isplaceok_calls = 0
permutation_calls = genallperms({1, 2, 3, 4, 5, 6, 7, 8}, 8)
--]]

-- Print the statistics.
io.write("Backtracking: ", backtracking_solutions, " solutions\n")
io.write("Backtracking: ", backtracking_calls, " isplaceok calls\n\n")

---[[
io.write("Permutations: ", solutions, " solutions\n")
io.write("Permutations: ", permutations, " permutations\n")
io.write("Permutations: ", isplaceok_calls, " isplaceok calls\n")
--]]