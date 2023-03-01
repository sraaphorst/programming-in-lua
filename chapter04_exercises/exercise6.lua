-- A UTF8 compatible remove
function remove(s, start_idx, end_idx)
  return
    s:sub(1, utf8.offset(s, start_idx) - 1)
    ..s:sub(utf8.offset(s, start_idx + end_idx), -1)
end

-- Japanese example.
jp = '私は少し日本語が分かります。'
print(jp)
print(remove(jp, 3, 2))

-- Chinese example.
zh = "我學了中文四年了，可是很長的時間沒有練習。"
print(zh)
print(remove(zh, 4, 2))

-- Portuguese example.
pg = "ação"
print(pg)
print(remove(pg, 2, 2))

-- English example.
en = "This is not a test."
print(en)
print(remove(en, 8, 4))
