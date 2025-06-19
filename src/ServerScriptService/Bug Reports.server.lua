
local http = game:GetService("HttpService")
local link = "https://api.trello.com/1/cards"
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local debounce = false
game.ReplicatedStorage.BugReport.OnServerEvent:Connect(function(player, report)
	if debounce then return end -- Cooldown so people can't spam messages
	debounce = true

	local data = {
		["name"] = player.Name .. " - " .. os.date().. " Gamemode:".. " ".. GameName, -- Concatenate name and date
		["desc"] = report,
		["key"] = "55daa7abe447fb07041ac7177b42c0e6",
		["token"] = "6c7f7b035fd323815925b77fee52bac0a50a7618146375d8d0bdd4a779708b3e",
		["pos"] = "bottom",
		["idList"] = "",
	}
	local jsonData = http:JSONEncode(data)

	local success, response = pcall(function()
		return http:PostAsync(link, jsonData)
	end)

	if success then
		print("Card created successfully:", response)
	else
		print("Failed to create card:", response)
	end

	wait(10) -- Cooldown time
	debounce = false
end)
