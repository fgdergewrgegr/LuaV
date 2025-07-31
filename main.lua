getgenv().__luaw__ = {
	funcs = {
		kenrel = {},
		global = {},
		normal = {}
	},
	objs = {},
	save = {
		funcs = {},
		objs = {}
	},
	data = {
		props = {},
		methods = {},
		operators = {},
		tabes = {},
		metatables = {}
	}
}

local o = __luaw__.objs
local f = __luaw__.funcs
	local k = f.kenrel
	local g = f.global
	local n = f.normal

local s = __luaw__.save
	local so = s.objs
	local sf = s.funcs

local d = __luaw__.data
	local p = d.props
	local m = d.methods
	local op = d.operators
	local t = d.tables
	local mt = d.metatables

-- sf["____"] = getgenv().____
	sf["typeof"] = getgenv().typeof
	sf["unpack"] = getgenv().unpack

-- o["_____"] = cloneref(game:GetService("_____"))
	o["w"] = cloneref(game:GetService("Workspace"))
	o["l"] = cloneref(game:GetService("Lighting"))
	o["p"] = cloneref(game:GetService("Players"))
	o["r"] = cloneref(game:GetService("RunService"))
	o["db"] = cloneref(game:GetService("Debris"))
	o["rs"] = cloneref(game:GetService("ReplicatedStorage"))
	o["rf"] = cloneref(game:GetService("ReplicatedFirst"))
	o["sg"] = cloneref(game:GetService("StarterGui"))
	o["ms"] = cloneref(game:GetService("MaterialService"))
	o["cg"] = gethui() or cloneref(game:GetService("CoreGui"))
	o["cs"] = cloneref(game:GetService("TextChatService"))
	o["ps"] = cloneref(game:GetService("PhysicsService"))
	o["hs"] = cloneref(game:GetService("HttpService"))
	o["ts"] = cloneref(game:GetService("TeleportService"))
	o["uis"] = cloneref(game:GetService("UserInputService"))
	o["vim"] = cloneref(game:GetService("VirtualInputManager"))

-- o["_____"] = 
	o["mhv3"] = Vector3.new("inf", "inf", "inf")
	o["nv3"] = Vector3.new()

-- o["_____"] = o._____.
	o["me"] = o.p.LocalPlayer
	o["old_char"] = o.me.Character
	if o.old_char then
		local char = o.old_char
		o["old_hrp"] = char:FindFirstChild("HumanoidRootPart")
		o["old_hum"] = char:FindFirstChild("Humanoid")
		o["old_hd"] = char:FindFirstChild("Head")
		o["old_tr"] = char:FindFirstChild("Torso")
	end
	o["cam"] = o.w.CurrentCamera
	o["m"] = o.me:GetMouse()
	o["name"] = o.me.Name
	o["dname"] = o.me.DisplayName
	o["pg"] = o.me.PlayerGui
	o["muid"] = o.me.UserId
	o["rt"] = o.p.RespawnTime

	local DCSCE = o.rs:FindFirstChild("DefaultChatSystemChatEvents")
	if DCSCE then
		o["saymsg"] = DCSCE:WaitForChild("SayMessageRequest")
		o["getmsg"] = DCSCE:WaitForChild("SayMessageRequest")
	end; DCSCE = nil
	
function k.type(obj)
	local type = sf.typeof(obj)
	return (type == "table" and obj["_luaw_"]) or type
end

local sf_unpack = sf.unpack
function k.duplicate(num, obj)
	local lt = {}
	for a=1,num do lt[a] = obj end
	return sf_unpack(lt)
end; k.d, k.dup = k.duplicate, k.duplicate

-- k.md, k.mdup, k.multy_duplicate = k.d(3, function(num, ...)
-- 	local lt, dlt = {...}, {}
-- 	for a=1,num do
-- 		for _,v in lt do
-- 			dlt[#dlt+1] = v
-- 		end
-- 	end; return sf.unpack(dlt)
-- end)

k.ul, k.unlw, unluaw = k.dup(3, function(...)
	local lt = {...}
	for i,obj in lt do
		if cf.typeof(obj) == "table" and obj["_luaw_"] then
			lt[i] = obj[1]
		end
	end; return sf_unpack(lt)
end)

k.b, k.blt, k.build = k.dup(3, function(type)
	if type then

end)

local sf_typeof = sf.typeof
k.l, k.lw, k.luaw = k.dup(3, function(...)
	local lt = {...}
	for i,obj in lt do
		local type = sf_typeof(obj)
		local props = p[type]
		local methods = m[type]
		local operators = op[type]
		

end)

local function wait_help(event, num)
	if not(num) then return event:Wait()
	else local t, tt = tick(), 0
		while tick() < t+num do
			tt = tt + event:Wait()
		end; return tt
	end
end; n.qw, n.qwait, n.quick_wait = k.dup(3, function(num) wait_help(o.r.Heartbeat, num) end)
n.pw, n.pwait, n.physic_wait = k.dup(3, function(num) wait_help(o.r.RenderStepped, num) end)

