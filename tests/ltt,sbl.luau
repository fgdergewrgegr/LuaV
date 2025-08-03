local ltt, sbl = {}, {}

for a=65, 90 do ltt[#ltt+1] = string.char(a) end
for a=97, 122 do ltt[#ltt+1] = string.char(a) end
for a=32, 47 do sbl[#sbl+1] = string.char(a) end
for a=58, 64 do sbl[#sbl+1] = string.char(a) end
for a=91, 96 do sbl[#sbl+1] = string.char(a) end
for a=123, 126 do sbl[#sbl+1] = string.char(a) end

print("---------------------------")
for i,v in ltt do print(i,v) end
print("---------------------------")
for i,v in sbl do print(i,v) end
print("---------------------------")