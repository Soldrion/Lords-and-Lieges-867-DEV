local army = script.Parent
local HitDetector = army.HitDetector
local checking = true
function checkForBattle()
	while checking == true do
		wait(1)
		warn("searching")
		for i, v in ipairs(HitDetector:GetTouchingParts()) do
			if v.Parent.Name == "Army" and v.Parent ~= army then
				print(v.Name,v.Parent.Name,v.Parent.Parent.Name)
				if v.Parent.Parent.Parent.Parent ~= army.Parent.Parent then
					
					if v.Parent.Parent.Parent ~= army.Parent.Parent then
						warn("Another nation's army")
						
						local result = game.ReplicatedStorage.CheckWarFunction:Invoke(army.Parent,v.Parent.Parent,2)
						if result == "skibidi" then
							print("true and factual")
						else
							print(result)
						end
					end
				end
				
			end
		end
	end
end

checkForBattle()