local army = script.Parent
local decal = game.ServerStorage.ControlDecal

local HitDetector = army.HitDetector



HitDetector.Touched:Connect(function(part)
	local controlling = false
	if part.Parent.Parent == workspace.Nations then
		if part.Name == "Army" then
			
		else
			local p1 = script.Parent.Parent.Parent
			local p2 = part.Parent

			local result = game.ReplicatedStorage.CheckWarFunction:Invoke(p1,p2,1)
			print(result)
			if result == true then
				local progress = 0
				while progress < 100 and progress ~= -50 do
					wait(1)
					progress += 20
					print (progress)
					for i, v in ipairs(HitDetector:GetTouchingParts()) do
					if v.Name == part.Name then
						controlling = true
						end
						HitDetector.TouchEnded:Connect(function()
							progress = -40
							controlling = false
						end)
					end
					
				end
				
				if (part.Position-HitDetector.Position).Magnitude <= 6 and controlling == true or progress > 100 then
					local decaltwo = decal:Clone()
					decaltwo.Parent = part
					decaltwo.Color3 = army.Parent.Parent.Color.Value
					decaltwo.Face = Enum.NormalId.Top
				end
			end
		end
	end
end)
