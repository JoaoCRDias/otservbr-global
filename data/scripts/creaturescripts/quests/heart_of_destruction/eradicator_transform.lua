local eradicatorTransform = CreatureEvent("EradicatorTransform")
function eradicatorTransform.onThink(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	if EradicatorReleaseT == true then
		if EradicatorWeak == 0 then
			local pos = creature:getPosition()
			local health = creature:getHealth()
			creature:remove()

			local monster = Game.createMonster("eradicator2", pos, false, true)
			monster:addHealth(-monster:getHealth() + health, COMBAT_PHYSICALDAMAGE)
			Game.createMonster("spark of destruction", {x = 114, y = 903, z = 8}, false, true)
			Game.createMonster("spark of destruction", {x = 106, y = 903, z = 8}, false, true)
			Game.createMonster("spark of destruction", {x = 106, y = 911, z = 8}, false, true)
			Game.createMonster("spark of destruction", {x = 114, y = 910, z = 8}, false, true)
			EradicatorWeak = 1 -- Eradicator form
			EradicatorReleaseT = false -- Release spell
			AreaEradicator = addEvent(function() EradicatorReleaseT = true end, 9000)
		elseif EradicatorWeak == 1 then
			local pos = creature:getPosition()
			local health = creature:getHealth()

			creature:remove()

			local monster = Game.createMonster("eradicator", pos, false, true)
			monster:addHealth(-monster:getHealth() + health, COMBAT_PHYSICALDAMAGE)
			EradicatorWeak = 0
			EradicatorReleaseT = false -- Release spell
			AreaEradicator = addEvent(function() EradicatorReleaseT = true end, 40000)
		end
	end
	return true
end

eradicatorTransform:register()
