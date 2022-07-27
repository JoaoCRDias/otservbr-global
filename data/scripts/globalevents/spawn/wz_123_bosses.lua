WZ123BossesPositions = {
	[1] = {bossName = "Deathstrike", position = {x = 214, y = 562, z = 8}},
	[2] = {bossName = "Gnomevil", position = {x = 165, y = 551, z = 8}},
	[3] = {bossName = "Abyssador", position = {x = 123, y = 554, z = 8}},
}

local deeplingBosses = GlobalEvent("WZ123Bosses")
function deeplingBosses.onStartup()
	local randomNumber = math.random(1,3)
	Game.createMonster(WZ123BossesPositions[randomNumber].bossName, WZ123BossesPositions[randomNumber].position, false, true)
	return true
end

deeplingBosses:register()
