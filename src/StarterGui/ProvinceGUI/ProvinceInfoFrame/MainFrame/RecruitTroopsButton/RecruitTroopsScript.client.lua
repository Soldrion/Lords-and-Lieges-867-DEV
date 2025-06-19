local player = game.Players.LocalPlayer
local parent = script.Parent
local infoframe = parent.TextLabel

parent.MouseEnter:Connect(function()
	infoframe.Visible = true
end)
parent.MouseLeave:Connect(function()
	infoframe.Visible = false
end)

parent.MouseButton1Click:Connect(function()
	
end)
