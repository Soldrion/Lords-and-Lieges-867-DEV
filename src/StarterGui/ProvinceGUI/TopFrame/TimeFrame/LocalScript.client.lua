game.ReplicatedStorage.TimeUpdate.OnClientEvent:Connect(function(month,day,year)
	script.Parent.DLabel.Text = day
	script.Parent.MLabel.Text = month
	script.Parent.YLabel.Text = year
end)

