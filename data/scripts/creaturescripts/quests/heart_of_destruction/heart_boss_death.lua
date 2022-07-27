local bosses = {
	["anomaly"] = {
		storage = 14326,
		centerPos = Position(196, 850, 8)
	},
	["rupture"] = {
		storage = 14327,
		centerPos = Position(198, 915, 8)
	},
	["realityquake"] = {
		storage = 14328,
		centerPos = Position(202, 883, 8)
	},
	["eradicator"] = {
		storage = 14330,
		centerPos = Position(110, 906, 8)
	},
	["outburst"] = {
		storage = 14332,
		centerPos = Position(136, 870, 8)
	}
}

local heartBossDeath = CreatureEvent("HeartBossDeath")

function heartBossDeath.onDeath(creature)
	if not creature or not creature:getMonster() then
		return true
	end

	local monsterName = creature:getName():lower()
	local bossName = bosses[monsterName]
	if bossName then
		local spectators = Game.getSpectators(bossName.centerPos, false, false, 12, 12, 12, 12)
		for _, spectator in pairs(spectators) do
			if spectator:isPlayer() then
				spectator:setStorageValue(bossName.storage, 1)
			end
		end
	end
	return true
end

heartBossDeath:register()
