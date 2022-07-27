local monsterTable = {
	[1] = 72500,
	[2] = 145000,
	[3] = 217500,
	[4] = 275500
}

local chargedAnomalyDeath = CreatureEvent("ChargedAnomalyDeath")

function chargedAnomalyDeath.onDeath(creature)
	if not creature then
		return true
	end
	for storageValue, health in pairs(monsterTable) do
		if AnomalyStage == storageValue then
			local monster = Game.createMonster("anomaly", {x = 197, y = 850, z = 8}, false, true)
			monster:addHealth(-health)
		end
	end
	return true
end

chargedAnomalyDeath:register()
