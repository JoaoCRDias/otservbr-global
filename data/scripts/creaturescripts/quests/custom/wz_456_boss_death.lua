local Wz456BossDeath = CreatureEvent("Wz456BossDeath")

local function respawn()
	local randomNumber = math.random(1,3)
	Game.createMonster(WZ456BossesPositions[randomNumber].bossName, WZ456BossesPositions[randomNumber].position, false, true)
	broadcastMessage("The " .. WZ456BossesPositions[randomNumber].bossName.. " was spawned!", MESSAGE_EVENT_ADVANCE)
	return true
end

function Wz456BossDeath.onDeath(creature)
	if not creature then
		return true
	end
	broadcastMessage("The " .. creature:getName() .. " was killed, next WZ 4, 5, 6 boss in 4 hours!", MESSAGE_EVENT_ADVANCE)
	addEvent(respawn, 4 * 60 * 60 * 1000)
	return true
end

Wz456BossDeath:register()
