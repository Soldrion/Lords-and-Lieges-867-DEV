local RE = game.ReplicatedStorage.SpecificSongPlay

RE.OnServerEvent:Connect(function(player,d,starttime)
	
	RE:FireClient(player,d,starttime)
end)