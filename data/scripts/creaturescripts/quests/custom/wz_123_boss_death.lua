local Wz123BossDeath = CreatureEvent("Wz123BossDeath")

local function respawn()
	local randomNumber = math.random(1,3)
	Game.createMonster(WZ123BossesPositions[randomNumber].bossName, WZ123BossesPositions[randomNumber].position, false, true)
	broadcastMessage("The " .. WZ123BossesPositions[randomNumber].bossName.. " was spawned!", MESSAGE_EVENT_ADVANCE)
	return true
end

function Wz123BossDeath.onDeath(creature)
	if not creature then
		return true
	end
	broadcastMessage("The " .. creature:getName() .. " was killed, next WZ 1, 2, 3 boss in 2 hours!", MESSAGE_EVENT_ADVANCE)
	addEvent(respawn, 2 * 60 * 60 * 1000)
	return true
end

Wz123BossDeath:register()
