wait(3)
local player = game.Players.LocalPlayer
local parent = script.Parent
local infoframe = parent.TextLabel
local frame = parent.Parent.Parent.Parent.Parent.CharacterGui.Frame

parent.MouseEnter:Connect(function()
	infoframe.Visible = true
end)
parent.MouseLeave:Connect(function()
	infoframe.Visible = false
end)

parent.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

while wait(1) do
	if player.Team.Name == "Choosing" then
		parent.Visible = false
	else
		parent.Visible = true
	end	
	
end

