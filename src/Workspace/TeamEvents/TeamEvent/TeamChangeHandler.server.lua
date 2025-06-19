local Event = script.Parent
local teams = game:GetService("Teams")
Event.OnServerEvent:Connect(function(player,text)
	for i, team in pairs(game.Teams:GetChildren()) do
		if team.Name == text then do
				local teamnum = teams[team.Name]:GetPlayers()
				if #teamnum == 0 then
					player.TeamColor = team.TeamColor
					wait(1)
				
					player:LoadCharacter() 
					
					return true
				end
			end
		end
	end
end)
