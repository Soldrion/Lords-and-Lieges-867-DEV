local Module = require(workspace.GameData.namesModuleScript)

local culture = "greek"
local name
function GenChar(c,g)
	if c == "greek" then
		if g == "m" then
			 name = Module.cg_byzantine.c_greek.names.m[math.random(1,#Module.cg_byzantine.c_greek.names.m)]
		elseif g == "f" then
			 name = Module.cg_byzantine.c_greek.names.f[math.random(1,#Module.cg_byzantine.c_greek.names.f)]
			
		end
	end
	return name
end

workspace.CharacterGenEvent:Connect(GenChar())