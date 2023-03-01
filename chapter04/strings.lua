-- strings in Lua are immutable
-- global substitution
a = "one string one"
b = string.gsub(a, "one", "another")
print(b)

-- To get string length, use the # operator. Returns number of bytes.
hw = "Hello, world!"
print(hw.." uses "..#hw.." bytes.")

-- Chinese: 66 bytes, i.e. three bytes per character.
zh = "中文，我學了四年了，可是很長的時間沒有練習。"
print(zh.." uses "..#zh.." bytes.")

-- Can use single or double quotes.
-- Japanese: 42 bytes for 13 characters, i.e. four bytes per character.
jp = '私は少し日本語が分かります。'
print(jp.." uses "..#jp.." bytes.")

-- Unicode: alpha beta gamma.
uc = "\u{3b1}\u{3b2}\u{3b3}"
print(uc..' uses '..#uc.." bytes.")

-- Long strings can be specified as follows:
page = [[
<html>
<head>
  <title>An HTML Page</title>
</head>
<body>
  <a href="http://www.lua.org">Lua</a>
</body>
</html>
]]

-- Some strings may need [[ in their body, in which case we can use any number of =
-- signs between the initial and final openings (they must match).
lesson=[===[
This is a table lesson.
a[b[[0]]]
]=] -- Does not end the lesson.
]===]
print(lesson)

-- End a string with a \z to continue on the next line with any arbitrary number of spaces.
data = "\x00\x01\x02\x03\x04\x05\x06\x07\z
        \x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
print(#data) -- returns 16 as expected.

-- tonumber converts to a number and accepts a base.
a = {
  "    -3    ",
  "   10e4   ",
  "10e",
  "0x1.3p-4"
}
for i = 1, #a do
  print(tonumber(a[i]))
end

print("\n\nAll your base:")
a = {
  {"100101", 2},
  {"fff", 16},
  {"-ZZ", 36},
  {"987", 8}
}
for i = 1, #a do
  rep = a[i][1]
  base = a[i][2]
  print(tonumber(rep, base))
end

-- string.len returns # bytes used by string, equivalent to # operator.
print(string.len(zh))
print(string.reverse("Hello, world!"))
print(string.upper("don't shout!"))
print(string.lower("LOL I'M SHY!"))

-- substrings
print("\nSubstrings similar to Python slices: \z
       can use negatives, but alwayas with 1 offset.")
ss = "[in brackets]"
print(string.sub(ss, 2, -2))
print(string.sub(ss, 1, 1))
print(string.sub(ss, -1, -1))

-- string.byte gets byte representation of range (only first character if not specified)
-- string.char assembles strings from arbitrary byte representations.
print(string.byte('oooo', 2))
print(string.byte('abcdefg', 1, -1))
print(string.char(111, 111, 111))

-- string.format is for serious C-like formatting.
d = 5; m = 11; y = 1990
print(string.format("%04d-%02d-%02d", y, m, d))

-- can use method like syntax for shorthand.
s = 'hello world'
sp = s:gsub('hello', 'goodbye cruel')
print(sp:sub(1,7)..' '..sp:sub(-5,-1))

-- to manage utf8 strings, use utf8 library.
print(zh.." has length "..(utf8.len(zh)))
print(jp.." has length "..(utf8.len(jp)))

-- We can convert to a table by iterating over the codepoints at the offsets
-- using utf8.codepoint and utf8.offset.
a = {}
for i = 1, utf8.len(zh) do
  a[i] = utf8.codepoint(zh, utf8.offset(zh, i))
end

-- Now convert back by iterating over the table and using utf8.char.
for i = 1, #a do
  io.write(utf8.char(a[i]))
end
io.write('\n')


-- utf8.codes iterates key,value pairs over a string:
for k,v in utf8.codes(zh) do
  print(k, v, utf8.char(v))
end
