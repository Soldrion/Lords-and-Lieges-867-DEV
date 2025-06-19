game.ReplicatedStorage.CheckWarFunction.OnInvoke = function(p1,p2,method)
print(p1.Name,p2.Name,method)
if method == 1 then
		print("first method")
		if p1 and p2 then
			warn(p1.Name, p2.Name)
			if p1.Parent == workspace.Nations then
				if p1.Info then
					if p1.Info.Wars then
						for i, v in ipairs(p1:FindFirstChild("Info"):FindFirstChild("Wars"):GetChildren()) do
							if #p1:FindFirstChild("Info"):FindFirstChild("Wars"):GetChildren() > 0 then
								if v.Value == p2.Name then
									return true
									end
								end
							end
						end	
					end		
				end
		end	
		if method == 2 then
			print("second method")
			warn(p1,p2,p1.Parent,p2.Parent)
			if p1 and p2 and p1.Parent and p2.Parent then
				warn("P1 AND P2 TEST PASSED")
			if p1.Parent == workspace.Nations and p2.Parent == workspace.Nations then
					if p1:FindFirstChild("Info") then
						
						if p1:FindFirstChild("Info"):FindFirstChild("Wars") then
							print(#p1:FindFirstChild("Info"):FindFirstChild("Wars"):GetChildren(),"wars going on")
							if #p1:FindFirstChild("Info"):FindFirstChild("Wars"):GetChildren() > 0 then
								print("there are wars, and there are more than zero.")
								for i, v in ipairs(p1:FindFirstChild("Info"):FindFirstChild("Wars"):GetChildren()) do
									print(v.Value,p2.Name)
								if v.Value == p2.Name then
									return "skibidi"
								end
							end
							else
							return 1
						end
						else
						return 2
					end
					else
					return 3
				end
				else
					return 4
				end
				
			end
		
			
		end
	end
end
	