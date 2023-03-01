function insert(s, idx, insert_txt)
  return s:sub(0, idx-1)..insert_txt..s:sub(idx,-1)
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", 7, "smol "):gsub('world', 'boi'))


function utf8_insert(s, idx, insert_txt)
  return utf8.sub(s, 0, utf8.codepoint(s, idx-1))..insert_txt..utf8.sub(s, utf8.codepoint(s, idx, -1))
end

jp = '私は日本語が分かります。'
print(insert(jp, 3, "少し"))
