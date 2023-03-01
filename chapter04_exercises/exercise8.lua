-- Ignoring case, spaces, and punctuation.
function ispali(s)
  local sp = s:gsub("[%p%s]", ''):lower()
  return sp == sp:reverse()
end

print(ispali("   Ste p on:n o pets!!!  "))
