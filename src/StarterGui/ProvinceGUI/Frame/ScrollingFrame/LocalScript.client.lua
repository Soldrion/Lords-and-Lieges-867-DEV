local template = game.ReplicatedStorage.Template
local player = game.Players.LocalPlayer
local team = player.Team
local folder = workspace.Nations:WaitForChild(team.Name)
local boolean = script.Parent.Parent.Visible
local parent = script.Parent
local guiElements = {} -- Store the GUI elements

local function populateGUI()
	for _, child in pairs(folder:GetChildren()) do
		if child.Name ~= "Color" and not child:FindFirstChild("NotANation") then
			local templato = template:Clone()
			templato.Text = child.Name
			templato.Parent = script.Parent
			if templato.Text == "Wall" then
				templato:Destroy()
			else
				table.insert(guiElements, templato)
			end
		end
	end

	-- Remove old GUI elements
	for i, element in ipairs(guiElements) do
		if not folder:FindFirstChild(element.Text) then
			element:Destroy()
			table.remove(guiElements, i)
		end
	end
end

populateGUI() -- Populate the GUI initially

folder.ChildAdded:Connect(populateGUI)
folder.ChildRemoved:Connect(populateGUI)

while true do
	wait(.1)

	if script.Parent.Parent.Visible ~= boolean then
		boolean = parent.Parent.Visible
		populateGUI()
	end
end
