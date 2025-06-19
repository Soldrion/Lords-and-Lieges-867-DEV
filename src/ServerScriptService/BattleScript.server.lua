local RE = game.ReplicatedStorage.BattleEvent
RE.OnServerEvent:Connect(function(player,province,attacker,defender)
	print(player,province,attacker,defender)
end)