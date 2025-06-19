local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local RS = game:GetService("RunService")
local HL = Instance.new("Highlight")
HL.Parent = plr
HL.FillTransparency = 1
game["Run Service"].Heartbeat:Connect(function()
	local target = mouse.Target
	HL.Adornee = target
end)
