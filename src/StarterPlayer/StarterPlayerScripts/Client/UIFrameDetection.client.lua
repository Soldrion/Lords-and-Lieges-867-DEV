local UserInputService = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()
local event = game.ReplicatedStorage.ProvinceDetectionEvent
local Folder = workspace.Nations -- The folder where your GUI is stored
local GUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI")
local state = true
local detectmouse
local troopselect
local ArmyGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI"):FindFirstChild("ArmyFrame")
local movingtroops = false
local DiploFrame = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI"):FindFirstChild("DiploFrame")
local NAButton = DiploFrame.NAButton
local AllianceButton = DiploFrame.AllianceButton
local WarLabel = DiploFrame.WarButton
local RankLabel = DiploFrame.RankLabel
local RealmLabel = DiploFrame.RealmLabel

local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local RS = game:GetService("RunService")
local HL = Instance.new("Highlight")
HL.Parent = plr
HL.FillTransparency = 1
--[[game["Run Service"].Heartbeat:Connect(function()
	
end)]]

--PLEASE ADD WAR AND BATTLES -Sincerely, Past Me

--THIS DISABLES THE INVENTORY FROM POPPING UP
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Captures, false)

event.OnClientEvent:Connect(function(data)
	detectmouse = data
end)

local function showGUI()
	if mouse.Target.Name ~= "Ocean" and mouse.Target.Parent.Name ~= "Army" then
		if ArmyGUI.Visible == false then
			DiploFrame = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI"):FindFirstChild("DiploFrame")
			RankLabel = DiploFrame.RankLabel
			DiploFrame.Visible = false
			RealmLabel = GUI.DiploFrame.RealmLabel
			RealmLabel.Text = mouse.Target.Parent.Name
			if mouse.Target.Parent.Info:FindFirstChild("Rank") then
				RankLabel.Text = mouse.Target.Parent.Info.Rank.Value
			end

			local team = game.Players.LocalPlayer.Team
			GUI:WaitForChild("ProvinceInfoFrame").Visible = state
			GUI.ProvinceInfoFrame.MainFrame.RecruitTroopsButton.Visible = false
			GUI.ProvinceInfoFrame.TopFrame.NameLabel.Text = mouse.Target.Name
			GUI.ProvinceInfoFrame.MainFrame.CNumLabel.Text = mouse.Target:GetAttribute("Culture")
			GUI.ProvinceInfoFrame.MainFrame.RNumLabel.Text = mouse.Target:GetAttribute("Religion")
			GUI.ProvinceInfoFrame.MainFrame.UNumLabel.Text = mouse.Target:GetAttribute("Unrest")
			if team.Name == mouse.Target.Parent.Name then
				GUI.ProvinceInfoFrame.MainFrame.RecruitTroopsButton.Visible = true
			end
			if mouse.Target.Name == "Part" or mouse.Target.Name == "Union" or mouse.Target.Name == "Province" then
				GUI.ProvinceInfoFrame.TopFrame.WarningLabel.Visible = true
				print("unnamed tile")
			else
				GUI.ProvinceInfoFrame.TopFrame.WarningLabel.Visible = false
			end

			if mouse.Target:FindFirstChild("Capital") then
				GUI.ProvinceInfoFrame.TopFrame.NameLabel.TextColor = BrickColor.Yellow()
				GUI.ProvinceInfoFrame.OwnedByLabel.Text = ("Capital of " .. mouse.Target.Parent.Name)
			else
				GUI.ProvinceInfoFrame.TopFrame.NameLabel.TextColor = BrickColor.Black()
				GUI.ProvinceInfoFrame.OwnedByLabel.Text = ("Province in " .. mouse.Target.Parent.Name)
			end
		else
			DiploFrame = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ProvinceGUI"):FindFirstChild("DiploFrame")
			state = false

			DiploFrame.Visible = false
		end
	end
end
ArmyGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI"):FindFirstChild("ArmyFrame")
local function ShowArmyGUI()
	DiploFrame.Visible = false
	state = false
	local ArmyGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI"):FindFirstChild("ArmyFrame")
	ArmyGUI.Visible = true
	troopselect = mouse.Target.Parent
	mouse.Target.Parent.SelectedEvent:FireServer(true)
	ArmyGUI.UnitMakeupFrame.LIAmtLabel.Text = mouse.Target.Parent:GetAttribute("Light_Infantry")
	ArmyGUI.UnitMakeupFrame.HIAmtLabel.Text = mouse.Target.Parent:GetAttribute("Heavy_Infantry")
	ArmyGUI.UnitMakeupFrame.LCAmtLabel.Text = mouse.Target.Parent:GetAttribute("Light_Cavalry")
	ArmyGUI.UnitMakeupFrame.HCAmtLabel.Text = mouse.Target.Parent:GetAttribute("Heavy_Cavalry")
	ArmyGUI.UnitMakeupFrame.ARAmtLabel.Text = mouse.Target.Parent:GetAttribute("Archers")
	ArmyGUI.UnitMakeupFrame.PMAmtLabel.Text = mouse.Target.Parent:GetAttribute("Pikemen")
	ArmyGUI.UnitMakeupFrame.HAAmtLabel.Text = mouse.Target.Parent:GetAttribute("Horse_Archers")
	ArmyGUI.UnitMakeupFrame.CCAmtLabel.Text = mouse.Target.Parent:GetAttribute("Camel_Cavalry")
	ArmyGUI:FindFirstChild("OwnedLabel").Text = mouse.Target.Parent.Parent.Parent.Name
end

local function partClicked(part)
	local parent = part.Parent
	if parent.Name == "Army" then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("ProvinceGUI").DiploFrame.Visible = false
	end
	if state == true and parent.Parent == Folder then
		showGUI()
	end
end

UserInputService.InputBegan:Connect(function(input)
	mouse.Move:Connect(function()
		local target = mouse.Target
		HL.Adornee = target
	end)
	GUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI")
	local MousePos = game:GetService("UserInputService"):GetMouseLocation()
		- game:GetService("GuiService"):GetGuiInset()
	local getGUI
	getGUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetGuiObjectsAtPosition(MousePos.X, MousePos.Y)
	if #getGUI == 0 then
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local mouseTarget = mouse.Target
			if mouseTarget and mouseTarget.Parent.Name == "Army" then
				DiploFrame.Visible = false
				if mouseTarget.Parent.Parent.Parent.Name == game.Players.LocalPlayer.Team.Name then
					ShowArmyGUI()
				end
			end

			if mouseTarget and mouseTarget.Parent.Parent == Folder and detectmouse == true then
				state = true
				partClicked(mouseTarget)
				ArmyGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI"):FindFirstChild("ArmyFrame")
			end
			if
				mouseTarget
				and (mouseTarget.Name == "Ocean" or mouseTarget.Name == "UnplayableDesert")
				and detectmouse == true
			then
				state = false
				partClicked(mouseTarget)
				ArmyGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("ProvinceGUI"):FindFirstChild("ArmyFrame")
			end
		end
	end
end)
