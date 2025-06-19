local RE = game.ReplicatedStorage.WarEvent
local d = Instance.new("StringValue")
RE.OnServerEvent:Connect(function(plr,attacker,defender)
	local attacktern = game.Workspace.Nations:FindFirstChild(attacker)
	local warsfolderatt = attacktern:FindFirstChild("Info"):FindFirstChild("Wars")
	local clonea = d:Clone()
	clonea.Value = defender
	local defendern = game.Workspace.Nations:FindFirstChild(defender)
	local warsfolderdef = defendern:FindFirstChild("Info"):FindFirstChild("Wars")
	local cloneb = d:Clone()
	cloneb.Value = attacker
	if clonea.Value ~= cloneb.Value then
		print(clonea.Value,cloneb.Value)
		
		clonea.Parent = warsfolderatt 
		cloneb.Parent = warsfolderdef
	else
		warn(plr.Name, "tried to declare war on themself")
	end
	
end)