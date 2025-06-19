local InfoEvent = game.ReplicatedStorage.InfoEvent
local parent = script.Parent
local province = parent.Text
local player = game.Players.LocalPlayer
local team = player.Team.Name
--[[parent.MouseButton1Click:Connect(function()
	InfoEvent:FireServer(province, team, player)
	print(province)
	print(team)
end)]]