local annexCmd = "/annex"
local annexCapturedCmd = "/takecapture"
local kickCmd = "/kick"

local allowedplayers = {452839718,667764478}
local function checkplayer(val)
	for _, player in ipairs(allowedplayers) do
		if val == player then
			return true
		end
	end
end
game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		if msg:sub(1, annexCmd:len()):lower() == annexCmd:lower() then
			print("annex requested")
			local target = msg:sub(annexCmd:len() + 2)
			local allowed = checkplayer(player.UserId)
			print(allowed)
			if player.Team.Name == "Choosing" or player.Team.Name == target and allowed == true then
				print("annex denied")
			else
				local function annex(target)
					print("annexing", target)
					if target == "all" then
						for i, child in pairs(workspace.Nations:GetChildren()) do
							for i, childrensquared in pairs(child:GetChildren()) do
								if childrensquared.Name ~= "Color" and childrensquared.Name ~= "Info" then
									task.wait(0.1)
									
								else
									childrensquared:Destroy()
									if childrensquared.Parent == nil then
										childrensquared:Destroy()
									end
									childrensquared.Parent = workspace.Nations:WaitForChild(player.Team.Name)
								end
							end
						end
					else
						print("annexing", target)
						local Nation = workspace.Nations:WaitForChild(player.Team.Name)
						local NationToAnnex = workspace.Nations:WaitForChild(target)

						for i, province in pairs(NationToAnnex:GetChildren()) do
							if province.Name ~= "Color" and province.Name ~= "Info" and province.Name ~= "Wall" then
								task.wait(.1)
								province.Parent = Nation
							else
								if province.Name == "Wall" then
									province:Destroy()
								end
							end
						end
					end
				end
			
				annex(target)
			end
		end
		if msg:sub(1, annexCapturedCmd:len()):lower() == annexCapturedCmd:lower() then
			print("annexation of captured land requested")
			local allowed = checkplayer(player.UserId)
			if player.Team.Name == "Choosing" or allowed == false then
				print("failed")
			else
				local function conquer()
					local wall
					local team = workspace.Nations:FindFirstChild(player.Team.Name)
					local war_folder = team.Info.Wars
					local function do_the_stuff() 
						for i, child in ipairs(war_folder:GetChildren()) do
							for i, child_squared in ipairs(workspace.Nations:FindFirstChild(child.Value):GetChildren()) do
								print(child_squared.Name)
								for i, child_cubed in ipairs(child_squared:GetChildren()) do
									print(child_cubed.Name)
									if child_cubed:IsA("Decal") then
										if BrickColor.new(child_cubed.Color3) == player.Team.TeamColor then
											child_squared.Parent = team
											child_cubed:Destroy()
											
											child:Destroy()
											
										end
									end
								end
							end
						end
					end
					do_the_stuff()
				end
				conquer()
			end
		end
	end)
end)





game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		if player.UserId == 667764478 then
			if msg:sub(1, kickCmd:len()):lower() == kickCmd:lower() then
				local target = game.Players:FindFirstChild(msg:sub(kickCmd:len()+2))
				print(target.Name)
				if target then
					target:Kick()
				end
			end
		end
	end)
end)


--[[

local annexCmd = "/rome"
game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		
		if msg:sub(1, annexCmd:len()):lower() == annexCmd:lower() then
			print("rome requested")
			local target = workspace.Nations:FindFirstChild(player.Team.Name)

			if player.Team.Name == "Choosing" then 


				print("rome denied")
			else
				local function rome(target)
					target.Name = "Roman Empire"
					local info = target:FindFirstChild("Info")
					local Rank = info:FindFirstChild("Rank")
					Rank.Value = "Empire"
					local Title = info:FindFirstChild("Title")
					Title.Value = "Emperor"
					local color = target:FindFirstChild("Color")
					color.Value = Color3.new(0.513725, 0.0156863, 0)
					player.Team.TeamColor = BrickColor.new("Bright reddish lilac")
					player.Team.Name = "Roman Empire"
					for i, v in pairs(target:GetChildren()) do
						if v.Name == "Wall" then
							local SurfaceGui = v:FindFirstChild("SurfaceGui")
							local TextLabel = SurfaceGui:FindFirstChild("TextLabel")
							TextLabel.Text = "Roman Empire"
							end
						end
					end
			


				rome(target)

				end
			end 

		end
	)
end)
]]