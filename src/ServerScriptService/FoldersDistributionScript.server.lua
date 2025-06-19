for Index, Nation in ipairs(game.Workspace.Nations:GetChildren()) do
	if Nation:FindFirstChild("Info") then
		
	else
		local infofolder = Instance.new("Folder") infofolder.Name = "Info" infofolder.Parent = Nation
		
	end
	local war = Instance.new("Folder")
	local diplo = Instance.new("Folder")
	local truces = Instance.new("Folder")
	local playerpos = Instance.new("Vector3Value")
	war.Name = "Wars"
	diplo.Name = "Alliances"
	truces.Name = "Truces"
	playerpos.Name = "PlayerStartPosition"
	war.Parent = Nation.Info
	diplo.Parent = Nation.Info
	truces.Parent = Nation.Info
	playerpos.Parent = Nation.Info
end

game.Workspace.Nations.ChildAdded:Connect(function()
	
end)