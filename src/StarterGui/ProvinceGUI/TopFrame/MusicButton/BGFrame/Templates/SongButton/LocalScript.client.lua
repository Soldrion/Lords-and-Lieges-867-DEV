local button = script.Parent
local d = button.SongID.Value
local RE = game.ReplicatedStorage.SpecificSongPlay

button.MouseButton1Click:Connect(function(d)
	d = button.SongID.Value
	local starttime = os.time()
	
	RE:FireServer(d,starttime)
end)