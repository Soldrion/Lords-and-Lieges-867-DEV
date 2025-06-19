local button = script.Parent
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local clicking = false
button.Parent.CancelButton.MouseButton1Click:Connect(function()
	print("cancel")
	for Index, Value in ipairs(game.Workspace.Nations:FindFirstChild(player.Team.Name).Armies:GetChildren()) do
		if Value.Name == "Army" then
			Value.SelectedEvent:FireServer(false)
		end
	end
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("ProvinceGUI"):FindFirstChild("ArmyFrame").Visible = false
end)


button.MouseButton1Click:Connect(function()
	clicking = false
	print(clicking)
	local targetpart = game.ReplicatedStorage.TargetPart:Clone()
	targetpart.Rotation = Vector3.new(0,0,90)
	targetpart.Parent = workspace
	while task.wait(.0001) and clicking == false do
		targetpart.CFrame = mouse.Hit
		mouse.Button1Down:Connect(function()
			clicking = true
		end)
	end
	
	
	
	game.ReplicatedStorage.PathfindingEvent:FireServer(targetpart.Position,player.Team.Name)
	targetpart:Destroy()
	clicking = false
	for i,v in ipairs(workspace.Nations:FindFirstChild(player.Team.Name).Armies:GetChildren()) do
		print(v.Name)
		for e,x in ipairs(v:GetChildren()) do
			if x.Name == "Army" then
				x.SelectedEvent:FireServer(false)
			end
		end
	end
	clicking = false
end)


