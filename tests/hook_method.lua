
local c = {}
local ffunc = setmetatable({},{__index = function(...) print("index", ...) end, __call = function(...) 
	print("call", ...)
	return "хуй"
end})
local lt = setmetatable({},{__index = function(...) print("index", ...); return ffunc end})
c[1] = ffunc
c[2] = lt
print(lt:FindFirstChild(11,22,33))
print("---------------------------------------")
local function func()
	print("func")
	return "yay"
end
local lt1 = setmetatable({}, {__index = func})
print(lt1.f)
print("---------------------------------------")
local mlt = {f=55555}
local lt2 = setmetatable({11,22,33}, {__index = mlt})
print(lt2.f)
mlt = nil
print(lt2.f)
print("---------------------------------------")
local rlt = {f=4444}
local mmlt = {__index = rlt}
local lt3 = setmetatable({11,22,33}, mmlt)
print(lt3.f)
mmlt = nil
print(lt3.f)