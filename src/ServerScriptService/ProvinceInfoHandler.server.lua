local event = game.ReplicatedStorage.ProvinceDetectionEvent
local d
local p



event.OnServerEvent:Connect(function(player,data)
	p = player
	d = data
	event:FireClient(p,d)
end)