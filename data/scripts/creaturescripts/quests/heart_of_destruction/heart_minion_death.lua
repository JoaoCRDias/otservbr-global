local heartMinionDeath = CreatureEvent("HeartMinionDeath")
function heartMinionDeath.onDeath(creature)
	if not creature or not creature:isMonster() then -- éMonstro!
		return true
	end
	local monster = creature:getName():lower()
	if monster == "damage resonance" then
		ResonanceActive = false
	elseif monster == "disruption" or monster == "charged disruption" or monster == "overcharged disruption" then
		DestructionSummon = DestructionSummon - 1
		DevourerSummon = DevourerSummon - 1
	end
	return true
end

heartMinionDeath:register()
