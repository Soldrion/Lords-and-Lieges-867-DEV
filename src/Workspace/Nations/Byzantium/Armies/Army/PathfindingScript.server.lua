local pfs = game:GetService("PathfindingService")
local NPC = script.Parent
local selected = NPC.Selected.Value
local animation = script:WaitForChild("RunAnim")
local model = NPC.Humanoid:LoadAnimation(animation)
local path = pfs:CreatePath({
	Costs = {
		Ocean = math.huge}
})
NPC.SelectedEvent.OnServerEvent:Connect(function(player,val)
	selected = val
	NPC.Selected.Value = selected
end)
game.ReplicatedStorage.PathfindingEvent.OnServerEvent:Connect(function(player,part,team)
	NPC.Selected.Value = selected
	if team == NPC.Parent.Parent.Name then 
		if selected == true then
			NPC.Humanoid:MoveTo(NPC.HumanoidRootPart.Position)
			NPC.Selected.Value = false
			path:ComputeAsync(NPC.HumanoidRootPart.Position, part)

			for _, waypoint in pairs (path:GetWaypoints()) do
				NPC.Humanoid:MoveTo(waypoint.Position)
				model:Play()
				NPC.Humanoid.MoveToFinished:Wait()
			end
			model:Stop()

		end
	end

end)

