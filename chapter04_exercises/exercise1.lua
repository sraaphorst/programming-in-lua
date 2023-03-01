-- Since this text contains a ]], we need to use [=[ and ]=] to delimit instead
-- of [[ and ]].
xml = [=[
<![CDATA[
  Hello world
]]>]=]

print(xml)
