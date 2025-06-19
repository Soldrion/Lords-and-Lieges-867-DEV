
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
		["key"] = "db6d594b0f12ca4b8e58c8bf8667ed7a",
		["token"] = "ATTAf4019192f38686bb485911b87536d012703e05b42cc7290d6e44c0d482afd5011C01DB3E",
		["pos"] = "bottom",
		["idList"] = "65f53a2848500eb882f938af",
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
