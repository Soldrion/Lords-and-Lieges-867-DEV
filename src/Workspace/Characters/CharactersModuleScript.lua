--skin tone, gender, culture, traits, titles
local namesMod = require(workspace.GameData.namesModuleScript)



local characters = {
	template = {
		
	};
	
	
}
function characters.generateCharacter(gender,culture,titles,spouse)
	local name = workspace.CharacterGenEvent:Fire(culture,gender)
end


return characters

