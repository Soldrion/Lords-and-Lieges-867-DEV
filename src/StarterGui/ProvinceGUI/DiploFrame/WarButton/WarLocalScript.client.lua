script.Parent.MouseButton1Click:Connect(function()
	local attacker = game.Players.LocalPlayer.Team.Name
	local defender = script.Parent.Parent.RealmLabel.Text
	game.ReplicatedStorage.WarEvent:FireServer(attacker,defender)
end)