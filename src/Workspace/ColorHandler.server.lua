local NationsFolder = workspace.Nations
while true do
	wait(.001)
	for i, nation in pairs(NationsFolder:GetChildren()) do
		if nation:FindFirstChild("NotANation") == nil and nation.Name ~= "Choosing" then do
				for i, province in pairs(nation:GetChildren()) do
			
			local Color = nation:WaitForChild("Color")
			if province.Name ~= "Color" then
				if province:FindFirstChild("NotAProvince") == nil then
					if province:IsA("Part") then
						province.Color = Color.Value
				elseif province:IsA("UnionOperation") then
					province.UsePartColor = true
				province.Color = Color.Value
					
							end
						end
					end
				end
			end
		end
	end
end
