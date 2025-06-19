local folders = workspace.Nations:GetChildren()
local team = Instance.new("Team")

for i, folder in pairs(folders) do
	local localteam = team:Clone()
	local color = folder:WaitForChild("Color")
	localteam.TeamColor = BrickColor.new(color.Value)
	localteam.Name = folder.Name
	localteam.Parent = game.Teams
	localteam.AutoAssignable = false
	
end