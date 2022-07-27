local DeeplingBossesDeath = CreatureEvent("DeeplingBossesDeath")

local function respawn(monsterName)
	local boss = DeeplingBossesDays[os.date("%A")]
	if boss then
		Game.createMonster(boss, DeeplingBossesPositions[boss].position, false, true)
		broadcastMessage("The " .. boss .. " spawned!", MESSAGE_EVENT_ADVANCE)
	end
	return true
end

function DeeplingBossesDeath.onDeath(creature)
	if not creature then
		return true
	end
	broadcastMessage("The " .. creature:getName() .. " was killed, next boss in 3 hours!", MESSAGE_EVENT_ADVANCE)
	addEvent(respawn, 3 * 60 * 60 * 1000, creature:getName())
	return true
end

DeeplingBossesDeath:register()
