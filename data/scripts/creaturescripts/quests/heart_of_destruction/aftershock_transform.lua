local aftershockTransform = CreatureEvent("AftershockTransform")
function aftershockTransform.onThink(creature)
	if not creature:isMonster() then
		return true
	end

	local sparkOfDestructionPositions = {
		{x = 199, y = 880, z = 8},
		{x = 199, y = 887, z = 8},
		{x = 206, y = 881, z = 8},
		{x = 206, y = 886, z = 8}
	}

	local monsterTable = {
		[80] = {fromStage = 0, toStage = 1},
		[60] = {fromStage = 1, toStage = 2},
		[40] = {fromStage = 2, toStage = 3},
		[25] = {fromStage = 3, toStage = 4},
		[10] = {fromStage = 4, toStage = 5}
	}

	for index, value in pairs(monsterTable) do
		local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
		if RealityQuakeStage == 0 then
			local aftershockHealth = creature:getHealth()
			if hp <= index and ShockStage == value.fromStage then
				creature:remove()
				for i = 1, #sparkOfDestructionPositions do
					Game.createMonster("spark of destruction", sparkOfDestructionPositions[i], false, true)
				end
				local monster = Game.createMonster("Foreshock", {x = 202, y = 883, z = 8}, false, true)
				monster:addHealth(-monster:getHealth() + aftershockHealth, COMBAT_PHYSICALDAMAGE)
				ShockStage = value.toStage
				AftershockHealth = aftershockHealth
				return true
			end
		end
	end
	return true
end

aftershockTransform:register()
