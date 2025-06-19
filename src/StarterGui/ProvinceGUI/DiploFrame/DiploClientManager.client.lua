local player = game.Players.LocalPlayer
local frame = script.Parent
local target = frame.RealmLabel.Text


frame.NAButton.MouseButton1Click:Connect(function()
	target = frame.RealmLabel.Text
	if player.Team.Name == target then
		frame.AlarmLabel.Visible = true
		task.wait(1)
		frame.AlarmLabel.Visible = false
	end
end)
frame.WarButton.MouseButton1Click:Connect(function()
	if player.Team.Name == target then
		frame.AlarmLabel.Visible = true
		task.wait(1)
		frame.AlarmLabel.Visible = false
	end
end)
frame.AllianceButton.MouseButton1Click:Connect(function()
	if player.Team.Name == target then
		frame.AlarmLabel.Visible = true
		task.wait(1)
		frame.AlarmLabel.Visible = false
	end
end)
