getgenv().__luav__ = {
	funcs = {
		core = {},
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
		operators = {}
	}
}

local o = __luav__.objs
local f = __luav__.funcs
	local c = f.core
	local g = f.global
	local n = f.normal

local s = __luav__.save
	local so = s.objs
	local sf = s.funcs

local d = __luav__.data
	local p = d.props
	local m = d.methods
	local op = d.operators

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
	
function c.type(obj)
	local type = sf.typeof(obj)
	return (type == "table" and (obj["_luav_"] or type)) or type
end

function c.duplicate(num, obj)
	local lt = {}
	for a=1,num do lt[a] = obj end
	return sf.unpack(lt)
end; c.d, c.dup = c.duplicate, c.duplicate

c.qw, c.qwait, c.quick_wait = c.dup(3, function(num)
	if not(num) then return o.r.Heartbeat:Wait()
	else local t, tt = tick(), 0
		while tick() < t+num do
			tt = tt + o.r.Heartbeat:Wait()
		end; return tt
	end
end)

c.pw, c.pwait, c.physic_wait = c.dup(3, function(num)
	if not(num) then return o.r.RenderStepped:Wait()
	else local t, tt = tick(), 0
		while tick() < t+num do
			tt = tt + o.r.RenderStepped:Wait()
		end; return tt
	end
end)

c.ul, c.unlv, unluav = c.dup(3, function(...)
	local lt = {...}
	for i,obj in lt do
		if cf.typeof(obj) == "table" and obj["luav"] then
			lt[i] = obj[1]
		end
	end; return unpack(lt)
end)

local sftypeof = sf.typeof
c.l, c.lv, c.luav = c.dup(3, function(...)
	local lt = {...}
	for i,obj in lt do
		local type = sftypeof(obj)
		local props = p[type]
		local methods = m[type]
		local operators = op[type]

end)