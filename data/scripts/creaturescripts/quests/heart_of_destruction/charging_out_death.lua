local chargingOutDeath = CreatureEvent("ChargingOutDeath")
function chargingOutDeath.onDeath(creature)
	if ChargingOutKilled == false then
		local monster = Game.createMonster("outburst", {x = 135, y = 870, z = 8}, false, true)
		monster:addHealth(-monster:getHealth() + OutburstHealth, COMBAT_PHYSICALDAMAGE)
	end
	return true
end
chargingOutDeath:register()
