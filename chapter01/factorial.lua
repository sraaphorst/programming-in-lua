-- defines a factorial function
function fact(n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end


-- tail recursive factorial function
function facttr(n)
  -- cannot seem to pass default parameters
  function factaux(n, prod)
    if n == 0 then
      return prod
    else
      return factaux(n-1, n * prod)
    end
  end
  return factaux(n, 1)
end


--[[print("enter a number: ")
a = io.read("*n")
print(fact(a))
print(facttr(a))
--]]
