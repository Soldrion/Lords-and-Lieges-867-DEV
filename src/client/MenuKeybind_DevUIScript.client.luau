local UserInputService = game:GetService("UserInputService")
while game.Players.LocalPlayer.Team.Name == "Choosing" do
	wait(1)
end
UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode.Value == 109 then --code for M
		local GUI = game.Players.LocalPlayer.PlayerGui.BetaUI
		local Menu = GUI.MenuFrame
		Menu.Visible = not Menu.Visible
	end
end)
--everything above works perfectly, do not touch

local GUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("BetaUI")
local Menu = GUI.MenuFrame
local button = Menu.Frame.Frame.EnableDevUIButton
local devframe = button.Parent.Frame

--below are the dev mode stuffs

button.MouseButton1Click:Connect(function()
	local GUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("BetaUI")
	devframe.Visible = true
end)

devframe.NButton.MouseButton1Click:Connect(function()
	devframe.Visible = false
end)

devframe.YButton.MouseButton1Click:Connect(function()
	devframe.Visible = false
	print(game.Players.LocalPlayer.Name .. " is now in dev mode!") --placeholder, need to add dev mode functionality
end)
