local MarketplaceService = game:GetService("MarketplaceService")


game.Players.PlayerAdded:Connect(function(Player) --When player join in game
	local isowner = false
	while Player.Team.Name == "Choosing" do
		wait(1)
	end

	function isowner()
		if Player.UserId == 667764478 then
			isowner = "[OWNER]"
			return isowner
		else
			return ""
		end
	end
	local tags = {
		{
			TagText = workspace.Nations:FindFirstChild(Player.Team.Name):FindFirstChild("Info"):FindFirstChild("Title").Value.. " of ".. Player.Team.Name.." "..isowner(), -- Tag Name, You can change to whatever you like
			TagColor = Player.TeamColor.Color, -- Tag Color, You can change to color you like


		}
	}
	local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService) -- Requires ChatService
	local speaker = nil -- speaker is nil
	while speaker == nil do -- While speaker is nil do..
		speaker = ChatService:GetSpeaker(Player.Name) -- Get speaker from player
		if speaker ~= nil then 
			break -- If speaker is nil then break
		end 
		wait(0.01) -- wait
	end
	speaker:SetExtraData("Tags",tags) -- Set tags
	speaker:SetExtraData("ChatColor",Color3.fromRGB(255, 255, 255)) -- Chat Color, You can change to color you like
end)
