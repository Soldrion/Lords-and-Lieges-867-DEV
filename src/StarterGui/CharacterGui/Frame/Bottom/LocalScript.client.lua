local player = game.Players.LocalPlayer
while wait(.1) do
	local team = player.Team.Name
	script.Parent.Text = team
end