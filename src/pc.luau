--init env
	__luaw__ = {
		funcs = {
			kenrel = {},
			global = {},
			normal = {}
		},
		objs = {},
		save = {},
		cache = {},
		data = {
			props = {},
			methods = {},
			operators = {},
			tabes = {},
			metatables = {},
			idk = {},
			text = {
				letters = {},
				numbers = {},
				symbols = {},
				valid_combo = {}
			}
		}
	}

	local f = __luaw__.funcs
		local k = f.kenrel
		local g = f.global
		local n = f.normal

	local o = __luaw__.objs
	local s = __luaw__.save
	local c = __luaw__.cache
		
	local d = __luaw__.data
		local p = d.props
		local m = d.methods
		local op = d.operators
		local t = d.tables
		local mt = d.metatables
		local idk = d.idk
		local txt = d.text
			local ltt = txt.letters
			local nms = txt.numbers
			local sbl = txt.symbols
			local vdc = txt.valid_combo
			local ltls = {l=ltt, n=nms, s=sbl}

--fast env set
	for a=65, 90 do ltt[#ltt+1] = string.char(a) end
	for a=97, 122 do ltt[#ltt+1] = string.char(a) end

	for a=48, 57 do nms[#nms+1] = string.char(a) end

	for a=32, 47 do sbl[#sbl+1] = string.char(a) end
	for a=58, 64 do sbl[#sbl+1] = string.char(a) end
	for a=91, 96 do sbl[#sbl+1] = string.char(a) end
	for a=123, 126 do sbl[#sbl+1] = string.char(a) end

	vdc = {"l", "n", "s", "ln", "ns", "sl", "lns", "ls", "nl", "sn", "snl"}

--ports | ____"] = ____"]["____"]
	rng = math.random

--save | s["____"] = ____"]
		s["typeof"] = typeof
		s["unpack"] = unpack
		s["type"] = type
	
--kernel
	function k.type(obj)
		local type = s.typeof(obj)
		return (type == "table" and obj["_luaw_"]) or type
	end

	function k.duplicate(num, obj)
		local lt = {}
		for a=1,num do lt[a] = obj end
		return s.unpack(lt)
	end; k.d, k.dup = k.duplicate, k.duplicate

	-- k.md, k.mdup, k.multy_duplicate = k.d(3, function(num, ...)
	-- 	local lt, dlt = {...}, {}
	-- 	for a=1,num do
	-- 		for _,v in lt do
	-- 			dlt[#dlt+1] = v
	-- 		end
	-- 	end; return s.unpack(dlt)
	-- end)

	k.ul, k.unlw, unluaw = k.dup(3, function(...)
		local lt = {...}
		for i,obj in lt do
			if cf.typeof(obj) == "table" and obj["_luaw_"] then
				lt[i] = obj[1]
			end
		end; return s.unpack(lt)
	end)

	k.b, k.blt, k.build = k.dup(3, function(type)
		if type then

		end
	end)

	k.l, k.lw, k.luaw = k.dup(3, function(...)
		local lt = {...}
		for i,obj in lt do
			local type = s.typeof(obj)
			local props = p[type]
			local methods = m[type]
			local operators = op[type]
			
		end
	end)

--normal
	-- local o_r_Heartbeat, o_r_RenderStepped = o.r.Heartbeat, o.r.RenderStepped
	local ft1, ft2 = [[return function(num)
		local event = ]],[[
		if not(num) then return event:Wait()
		else local t, tt = tick(), 0
			while tick() < t+num do
				tt = tt + event:Wait()
			end; return tt
		end
	end]]
	n.qw, n.qwait, n.quick_wait = k.dup(3, loadstring(`{ft1}o_r_Heartbeat{ft2}`))
	n.pw, n.pwait, n.physic_wait = k.dup(3, loadstring(`{ft1}o_r_RenderStepped{ft2}`))
	-- n.tw, n.twait, n.task_wait = k.dup(3, task.wait); ft1 = nil, ft2 = ft1

	n.random_text, n.rtext, n.rt = k.dup(3, function(length, input)
		input = input or "l"
		local output = ""
		if table.find(vdc, input) then
			local lt = {}
			for _,link in input:split("") do
				for _,char in ltls[link] do
					lt[#lt+1] = char
				end
			end; input = lt
		end; local linput = #input
		for a = 1, length or 10 do
			output = output..input[rng(1, linput)]
		end; return output
	end)

print("----------------------------------------------")
local function ppp(...)
	print("------------------------")
	print(...)
	print("------------------------")
end

ppp(n.rt(100))
ppp(n.rt(100, "ln"))
ppp(n.rt(100, "lns"))