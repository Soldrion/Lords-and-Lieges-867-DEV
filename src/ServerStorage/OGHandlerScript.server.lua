--[[

local NationsFolder = workspace.Nations
local y = 10
function destroyWall(name)
	for i, thing in pairs(NationsFolder:GetDescendants()) do
		if thing.Parent.Name == name then
			thing:Destroy()
		end
	end
end
for i, nation in pairs(NationsFolder:GetChildren()) do
	
	local firstPart = true
	local x, xmin, z, zmin

	for i, child in pairs(nation:GetChildren()) do
		
		wait(.00001)
		if child:IsA("Part") or child:IsA("UnionOperation") then
			if firstPart then
				firstPart = false
				x = child.Position.X
				xmin = child.Position.X
				z = child.Position.Z
				zmin = child.Position.Z
			else
				local xpos = child.Position.X
				local zpos = child.Position.Z

				if xpos > x then
					x = xpos
				elseif xpos < xmin then
					xmin = xpos
				end

				if zpos > z then
					z = zpos
				elseif zpos < zmin then
					zmin = zpos
				end
			end
		end
	end

	local wall = Instance.new("Part")
	wall.Name = "Wall"
	wall.CanCollide = false
	wall.CanQuery = false
	wall.CanTouch = false
	wall.Anchored = true
	wall.Size = Vector3.new(x - xmin, 0.5, z - zmin)
	wall.Position = Vector3.new((x + xmin)/2, y, (z + zmin)/2)
	wall.Parent = nation
	wall.Transparency = 1
	wall.Rotation = Vector3.new()
	local surfaceGui = Instance.new("SurfaceGui")
	surfaceGui.Parent = wall
	surfaceGui.Face = "Top"
	
	local textLabel = Instance.new("TextLabel")
	textLabel.Rotation = -90
	textLabel.BackgroundTransparency = 1
	textLabel.Parent = surfaceGui
	textLabel.Text = nation.Name
	textLabel.Size = UDim2.new(1,0,1,0)
	textLabel.Font = "SourceSans"
	textLabel.TextScaled = true
end

while wait(1) do
	for i, nation in pairs(NationsFolder:GetChildren()) do
		nation.ChildAdded:Connect(function()
			destroyWall(nation)
			local firstPart = true
		local x, xmin, z, zmin

		for i, child in pairs(nation:GetChildren()) do
			wait(.00001)
			if child:IsA("Part") or child:IsA("UnionOperation") then
				if firstPart then
					firstPart = false
					x = child.Position.X
					xmin = child.Position.X
					z = child.Position.Z
					zmin = child.Position.Z
				else
					local xpos = child.Position.X
					local zpos = child.Position.Z

					if xpos > x then
						x = xpos
					elseif xpos < xmin then
						xmin = xpos
					end

					if zpos > z then
						z = zpos
					elseif zpos < zmin then
						zmin = zpos
					end
				end
			end
		end

		local wall = Instance.new("Part")
		wall.Name = "Wall"
		wall.CanCollide = false
		wall.CanQuery = false
		wall.CanTouch = false
		wall.Anchored = true
		wall.Size = Vector3.new(x - xmin, 0.5, z - zmin)
		wall.Position = Vector3.new((x + xmin)/2, y, (z + zmin)/2)
		wall.Parent = nation
		wall.Transparency = 1
		wall.Rotation = Vector3.new()
		local surfaceGui = Instance.new("SurfaceGui")
		surfaceGui.Parent = wall
		surfaceGui.Face = "Top"

		local textLabel = Instance.new("TextLabel")
		textLabel.Rotation = -90
		textLabel.BackgroundTransparency = 1
		textLabel.Parent = surfaceGui
		textLabel.Text = nation.Name
		textLabel.Size = UDim2.new(1,0,1,0)
		textLabel.Font = "SourceSans"
		textLabel.TextScaled = true
		end)
		
		nation.ChildRemoved:Connect(function()
			destroyWall(nation)
			local firstPart = true
			local x, xmin, z, zmin

			for i, child in pairs(nation:GetChildren()) do
				wait(.00001)
				if child:IsA("Part") or child:IsA("UnionOperation") then
					if firstPart then
						firstPart = false
						x = child.Position.X
						xmin = child.Position.X
						z = child.Position.Z
						zmin = child.Position.Z
					else
						local xpos = child.Position.X
						local zpos = child.Position.Z

						if xpos > x then
							x = xpos
						elseif xpos < xmin then
							xmin = xpos
						end

						if zpos > z then
							z = zpos
						elseif zpos < zmin then
							zmin = zpos
						end
					end
				end
			end

			local wall = Instance.new("Part")
			wall.Name = "Wall"
			wall.CanCollide = false
			wall.CanQuery = false
			wall.CanTouch = false
			wall.Anchored = true
			wall.Size = Vector3.new(x - xmin, 0.5, z - zmin)
			wall.Position = Vector3.new((x + xmin)/2, y, (z + zmin)/2)
			wall.Parent = nation
			wall.Transparency = 1
			wall.Rotation = Vector3.new()
			local surfaceGui = Instance.new("SurfaceGui")
			surfaceGui.Parent = wall
			surfaceGui.Face = "Top"

			local textLabel = Instance.new("TextLabel")
			textLabel.Rotation = -90
			textLabel.BackgroundTransparency = 1
			textLabel.Parent = surfaceGui
			textLabel.Text = nation.Name
			textLabel.Size = UDim2.new(1,0,1,0)
			textLabel.Font = "SourceSans"
			textLabel.TextScaled = true
		end)
		
		end
			
	end

	]]--