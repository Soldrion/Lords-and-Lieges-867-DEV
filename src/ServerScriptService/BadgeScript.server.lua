local badge = game:GetService("BadgeService")
local id = 3825978909 --badge id here
game.Players.PlayerAdded:Connect(function(plr)
	if not badge:UserHasBadgeAsync(plr.UserId, id) then
		badge:AwardBadge(plr.UserId,id)
	end
end)