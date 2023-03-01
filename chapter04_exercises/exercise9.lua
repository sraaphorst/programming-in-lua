function reverse(s)
  local sp = ""
  for _, c in utf8.codes(s) do
    sp = utf8.char(c) .. sp
  end
  return sp
end

function ispali(s)
  local sp = s:gsub("[%p%s]", "")
  return reverse(sp) == sp
end

-- Chinese test. No idea how to clear out unicode punctuation: does not work for ， or 。 or ！
zh = "我愛 爸爸 爸 爸 愛 我"
print(ispali(zh))

zh2 = "人人 為我 我 為人 人"
print(ispali(zh2))
