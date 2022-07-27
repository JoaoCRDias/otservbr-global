DeeplingBossesDays = {
	["Monday"] = "Tanjis",
	["Tuesday"] = "Obujos",
	["Wednesday"] = "Jaul",
	["Thursday"] = "Tanjis",
	["Friday"] = "Obujos",
	["Saturday"] = "Jaul"
}

DeeplingBossesPositions = {
	["Tanjis"] = {position = {x = 314, y = 548, z = 8}},
	["Obujos"] = {position = {x = 276, y = 543, z = 8}},
	["Jaul"] = {position = {x = 301, y = 588, z = 8}}
}

local deeplingBosses = GlobalEvent("GrayIslandBosses")
function deeplingBosses.onStartup()
	local boss = DeeplingBossesDays[os.date("%A")]
	if boss then
		Game.createMonster(boss, DeeplingBossesPositions[boss].position, false, true)
	end
	return true
end

deeplingBosses:register()
