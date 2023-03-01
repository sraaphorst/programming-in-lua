-- A UTF8 compatible insert.
function insert(s, idx, insert_txt)
  -- Careful manipulation required here.
  offset = utf8.offset(s, idx)
  
  return
      s:sub(1, offset-1)
    ..insert_txt
    ..s:sub(offset, -1)
end

-- Japanese example.
jp = '私は日本語が分かります。'
print(jp)
print(insert(jp, 3, "少し"))

-- Chinese example.
zh = "我學了四年了，可是很長的時間沒有練習。"
print(zh)
print(insert(zh, 4, "中文"))

-- Portuguese example.
pg = "ação"
print(pg)
print(insert(insert(pg, 5, "!"), 1, 'Ç'))

-- English example.
en = "This is a test."
print(en)
print(insert(en, 10, " stringy"))
