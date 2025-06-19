local player = game.Players.LocalPlayer
while wait(.1) do
	local team = player.Team.Name
	local nation = workspace.Nations:WaitForChild(team)
	local info = nation:WaitForChild("Info")
	local rank = info:WaitForChild("Rank")
	script.Parent.Text = rank.Value
end