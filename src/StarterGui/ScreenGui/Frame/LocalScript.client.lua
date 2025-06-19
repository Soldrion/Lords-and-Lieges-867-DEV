script.Parent.TextButton.MouseButton1Click:Connect(function()
	local report = script.Parent.TextBox.Text
	
	game.ReplicatedStorage.BugReport:FireServer(report)
	script.Parent.Visible = false
end)