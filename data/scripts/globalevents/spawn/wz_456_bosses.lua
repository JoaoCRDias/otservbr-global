WZ456BossesPositions = {
	[1] = {bossName = "The Baron from Below", position = {x = 112, y = 715, z = 8}},
	[2] = {bossName = "The Count Of The Core", position = {x = 144, y = 747, z = 8}},
	[3] = {bossName = "The Duke Of The Depths", position = {x = 176, y = 715, z = 8}},
}

local deeplingBosses = GlobalEvent("WZ456Bosses")
function deeplingBosses.onStartup()
	local randomNumber = math.random(1,3)
	Game.createMonster(WZ456BossesPositions[randomNumber].bossName, WZ456BossesPositions[randomNumber].position, false, true)
	return true
end

deeplingBosses:register()
