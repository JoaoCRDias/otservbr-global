local ruptureResonance = CreatureEvent("RuptureResonance")
function ruptureResonance.onThink(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	if hp <= 80 and RuptureResonanceStage == 0 and ResonanceActive == false then
		Game.createMonster("spark of destruction", {x = 194, y = 913, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 195, y = 919, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 203, y = 918, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 202, y = 912, z = 8}, false, true)
		Game.createMonster("damage resonance", {x = 197, y = 916, z = 8}, false, true)
		RuptureResonanceStage = 1
		ResonanceActive = true
	elseif hp <= 60 and RuptureResonanceStage == 1 and ResonanceActive == false then
		Game.createMonster("spark of destruction", {x = 194, y = 913, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 195, y = 919, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 203, y = 918, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 202, y = 912, z = 8}, false, true)
		Game.createMonster("damage resonance", {x = 197, y = 916, z = 8}, false, true)
		RuptureResonanceStage = 2
		ResonanceActive = true
	elseif hp <= 40 and RuptureResonanceStage == 2 and ResonanceActive == false then
		Game.createMonster("spark of destruction", {x = 194, y = 913, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 195, y = 919, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 203, y = 918, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 202, y = 912, z = 8}, false, true)
		Game.createMonster("damage resonance", {x = 197, y = 916, z = 8}, false, true)
		RuptureResonanceStage = 3
		ResonanceActive = true
	elseif hp <= 25 and RuptureResonanceStage == 3 and ResonanceActive == false then
		Game.createMonster("spark of destruction", {x = 194, y = 913, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 195, y = 919, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 203, y = 918, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 202, y = 912, z = 8}, false, true)
		Game.createMonster("damage resonance", {x = 197, y = 916, z = 8}, false, true)
		RuptureResonanceStage = 4
		ResonanceActive = true
	elseif hp <= 10 and RuptureResonanceStage == 4 and ResonanceActive == false then
		Game.createMonster("spark of destruction", {x = 194, y = 913, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 195, y = 919, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 203, y = 918, z = 8}, false, true)
		Game.createMonster("spark of destruction", {x = 202, y = 912, z = 8}, false, true)
		Game.createMonster("damage resonance", {x = 197, y = 916, z = 8}, false, true)
		RuptureResonanceStage = -1
		ResonanceActive = true
	end

	return true
end

ruptureResonance:register()
