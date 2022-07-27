local outburstCharge = CreatureEvent("OutburstCharge")
function outburstCharge.onThink(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	if hp <= 80 and OutburstStage == 0 then
		OutburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 132, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 874, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 131, y = 874, z = 8}, false, true)
		Game.createMonster("charging outburst", {x = 135, y = 870, z = 8}, false, true)
		OutburstStage = 1
		ChargingOutKilled = false
	elseif hp <= 60 and OutburstStage == 1 then
		OutburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 132, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 874, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 131, y = 874, z = 8}, false, true)
		Game.createMonster("charging outburst", {x = 135, y = 870, z = 8}, false, true)
		OutburstStage = 2
		ChargingOutKilled = false
	elseif hp <= 40 and OutburstStage == 2 then
		OutburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 132, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 874, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 131, y = 874, z = 8}, false, true)
		Game.createMonster("charging outburst", {x = 135, y = 870, z = 8}, false, true)
		OutburstStage = 3
		ChargingOutKilled = false
	elseif hp <= 20 and OutburstStage == 3 then
		OutburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 132, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 867, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 140, y = 874, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 131, y = 874, z = 8}, false, true)
		Game.createMonster("charging outburst", {x = 135, y = 870, z = 8}, false, true)
		OutburstStage = 4
		ChargingOutKilled = false
	end
	return true
end

outburstCharge:register()
