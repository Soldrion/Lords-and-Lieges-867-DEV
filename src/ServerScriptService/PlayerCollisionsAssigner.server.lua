local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)

	player.CharacterAdded:Connect(function(character)

		for i, v in character:GetChildren() do
			if v:IsA("BasePart") then
				v.CollisionGroup = "Players"
			end
		end

	end)

end)