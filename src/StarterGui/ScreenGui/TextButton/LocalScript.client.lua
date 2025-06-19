script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent.Frame.Visible = not script.Parent.Parent.Frame.Visible
	script.Parent.Parent.Frame.TextBox.Text = ""
end)