local shocksDeath = CreatureEvent("ShocksDeath")
function shocksDeath.onDeath(creature)
	if not creature or not creature:isMonster() then
		return true
	end

	local name = creature:getName():lower()
	if name == "foreshock" and RealityQuakeStage == 0 then
		local monster = Game.createMonster("aftershock", {x = 202, y = 883, z = 8}, false, true)
		monster:addHealth(-monster:getHealth() + AftershockHealth, COMBAT_PHYSICALDAMAGE)
		Game.createMonster("spark of destruction", {x = 199, y = 880, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 199, y = 887, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 206, y = 881, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 206, y = 886, z = 8}, false, true)
	elseif name == "aftershock" and RealityQuakeStage == 0 then
		local monster = Game.createMonster("foreshock", {x = 202, y = 883, z = 8}, false, true)
		monster:addHealth(-monster:getHealth() + ForeshockHealth, COMBAT_PHYSICALDAMAGE)
		Game.createMonster("spark of destruction", {x = 199, y = 880, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 199, y = 887, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 206, y = 881, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 206, y = 886, z = 8}, false, true)
	end
	RealityQuakeStage = RealityQuakeStage + 1

	if RealityQuakeStage == 2 then
		local pos = creature:getPosition()
		local monster = Game.createMonster("realityquake", pos, false, true)
		Game.createMonster("spark of destruction", {x = 199, y = 880, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 199, y = 887, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 206, y = 881, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 206, y = 886, z = 8}, false, true)
	end
	return true
end

shocksDeath:register()
