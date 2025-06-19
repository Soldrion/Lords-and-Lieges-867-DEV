local player = game.Players.LocalPlayer
local parent = script.Parent
local infoframe = parent.TextLabel
local GUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI")   

local value = false
local check = false

parent.MouseEnter:Connect(function()
	infoframe.Visible = true
	infoframe.Text = ('Click to toggle province info '..'(currently '..tostring(value)..')')
end)
parent.MouseLeave:Connect(function()
	infoframe.Visible = false
end)

parent.MouseButton1Click:Connect(function()
	value = not value
	warn("VALUE IS ",value)
	game.ReplicatedStorage.ProvinceDetectionEvent:FireServer(value)
	infoframe.Text = ('Click to toggle province info '..'(currently '..tostring(value)..')')
	if value == false then
		GUI.ProvinceInfoFrame.Visible = false
	end
end)

while wait(1) and check == false do
	if player.Team.Name == "Choosing" then
		value = false
		parent.Visible = false
	else
		value = true
		parent.Visible = true
		check = true
		game.ReplicatedStorage.ProvinceDetectionEvent:FireServer(value)
	end	
	
end

