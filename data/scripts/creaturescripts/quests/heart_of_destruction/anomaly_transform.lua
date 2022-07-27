local anomalyTransform = CreatureEvent("AnomalyTransform")
function anomalyTransform.onThink(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	if hp <= 75 and AnomalyStage == 0 then
		creature:remove()
		Game.createMonster("spark of destruction", {x = 199, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 191, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 201, y = 854, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 193, y = 856, z = 8}, false, true)
		Game.createMonster("charged anomaly", {x = 197, y = 850, z = 8}, false, true)
		AnomalyStage = 1
	elseif hp <= 50 and AnomalyStage == 1 then
		creature:remove()
		Game.createMonster("spark of destruction", {x = 199, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 191, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 201, y = 854, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 193, y = 856, z = 8}, false, true)
		Game.createMonster("charged anomaly", {x = 197, y = 850, z = 8}, false, true)
		AnomalyStage = 2
	elseif hp <= 25 and AnomalyStage == 2 then
		creature:remove()
		Game.createMonster("spark of destruction", {x = 199, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 191, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 201, y = 854, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 193, y = 856, z = 8}, false, true)
		Game.createMonster("charged anomaly", {x = 197, y = 850, z = 8}, false, true)
		AnomalyStage = 3
	elseif hp <= 5 and AnomalyStage == 3 then
		creature:remove()
		Game.createMonster("spark of destruction", {x = 199, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 191, y = 846, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 201, y = 854, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 193, y = 856, z = 8}, false, true)
		Game.createMonster("charged anomaly", {x = 197, y = 850, z = 8}, false, true)
		AnomalyStage = 4
	end
	return true
end

anomalyTransform:register()
