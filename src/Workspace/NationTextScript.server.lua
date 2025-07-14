local NationsFolder = workspace.Nations
local y = 10
local walls = {}  -- Store the created walls
local areaThreshold = 1500  --the threshold for changing the text size behavior
local scaleFactor = 10   -- Define the scale factor for text size

-- Function to create a wall based on a nation
local function createWall(nation)
	
	local firstPart = true
	local x, xmin, z, zmin
	local wall = Instance.new("SpawnLocation")
	print(wall:IsA("SpawnLocation"))
	
	wall.AllowTeamChangeOnTouch = false
	wall.Neutral = false
	
	wall.Name = "Wall"
	wall.CanCollide = false
	wall.Anchored = true
	wall.CanQuery = false
	wall.CanTouch = false
	
	for i, child in pairs(nation:GetChildren()) do
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

	if x and xmin then
		local playerspawnposition = nation:WaitForChild("Info"):WaitForChild("PlayerStartPosition")
		wall.Size = Vector3.new(x - xmin, 0.5, z - zmin)
		wall.Position = Vector3.new((x + xmin) / 2, y, (z + zmin) / 2)
		
		playerspawnposition.Value = Vector3.new((x / 2), y+10, (z / 2))
		wall.Parent = nation
		wall.CanCollide = false
		wall.CanTouch = false
		wall.CanQuery = false
		wall.Transparency = 1
		wall.AllowTeamChangeOnTouch = false
		wall.Neutral = false
		
		walls[nation.Name] = wall

		-- Create a SurfaceGui to display the nation's name
		local surfaceGui = Instance.new("SurfaceGui")
		surfaceGui.Name = "SurfaceGui"
		surfaceGui.Parent = wall
		surfaceGui.Face = "Top"
		surfaceGui.AlwaysOnTop = true
		local textLabel = surfaceGui:FindFirstChild("TextLabel") or Instance.new("TextLabel")
		textLabel.Rotation = -90
		textLabel.Name = "TextLabel"
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = nation.Name
		textLabel.Font = Enum.Font.Antique
		textLabel.TextScaled = true
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		-- Enable rich text for small nations
		local nationArea = (x - xmin) * (z - zmin)
		if nationArea < areaThreshold then
			textLabel.RichText = true
			textLabel.TextScaled = true
			wall.Size = Vector3.new(12,.5,12)
			playerspawnposition.Value = wall.Position
		else
			textLabel.RichText = false
		end

		textLabel.Parent = surfaceGui
	end
end


local function destroyWall(nationName)-- Function to destroy a wall and remove it from the storage
	wait(.0001)
	local wall = walls[nationName]
	if wall then
		wall:Destroy()
		walls[nationName]:Destroy()
	end
end

function globalUpdateWalls()
	warn("GLOBALLY UPDATING ALL WALLS")
	for i, nation in pairs(NationsFolder:GetChildren()) do
		wait(0.000001)
		print(nation.Name)
		destroyWall(nation)
		createWall(nation)
	end
end

workspace.UpdateWallEvent.Event:Connect(function()
	globalUpdateWalls()
end)



function initial()
-- Initial wall creation and connections
for i, nation in pairs(NationsFolder:GetChildren()) do
	createWall(nation)

end
end


initial()