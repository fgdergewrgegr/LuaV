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

-- sf["____"] = getgenv().____
	sf["typeof"] = getgenv().typeof

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
