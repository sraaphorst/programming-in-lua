function remove(s, start_idx, end_idx)
  return s:sub(1, start_idx-1)..s:sub(start_idx + end_idx, -1)
end

-- English example.
print(remove("hello world", 7, 4))
