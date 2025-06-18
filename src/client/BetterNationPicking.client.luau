local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local nationgui = plr.PlayerGui:WaitForChild("NationGui")
local frame = nationgui.Frame
local NNL = frame.TitleLabel
local TeamEvent = game.Workspace.TeamEvents.TeamEvent
local button = frame.TextButton
local team = nil
local cooldown = false
while wait(0.05) and cooldown == false do
	local target = mouse.Target
	local frame = nationgui:FindFirstChild("Frame")
	if plr.Team.Name == "Choosing" and frame ~= nil then
		mouse.Button1Up:Connect(function()
			if mouse.Target.Name == "Ocean" then
				frame.Visible = false
				NNL.Text = " "
			else
				cooldown = true
				frame.Visible = true
				NNL.Text = mouse.Target.Parent.Name
				local rulerinfo = mouse.Target.Parent:FindFirstChild("Info"):FindFirstChild("RulerInfo")
				local frame = nationgui:FindFirstChild("Frame")
				if rulerinfo and frame ~= nil then
					local religion = rulerinfo.Religion.Value
					local name = rulerinfo.RulerFName.Value
					local dyn = rulerinfo.RulerDynasty.Value
					local rank = mouse.Target.Parent.Info.Rank.Value
					local title = mouse.Target.Parent.Info.Title.Value
					local RL = frame.RulerLabel
					local sigma = title .. " " .. name .. " " .. dyn
					local BL = frame.blabel
					RL.Text = sigma
					BL.Text = religion .. " " .. title
					local team = NNL.Text
					cooldown = false
				elseif rulerinfo == nil then
					frame.blabel.Text = "Not Found"
					frame.RulerLabel.Text = "Not Found"
					warn(mouse.Target.Parent.Name, "has no ruler info")
					cooldown = false
				else
					cooldown = false
				end
			end
		end)
	end
	button.MouseButton1Click:Connect(function()
		if plr.Team.Name == "Choosing" and frame.TitleLabel.Text ~= "sigma" and cooldown == false then
			TeamEvent:FireServer(NNL.Text)
			frame:Destroy()
			script:Destroy()
		end
	end)
end
