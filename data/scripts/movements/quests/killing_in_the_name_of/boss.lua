local function roomIsOccupied(centerPosition,
		rangeX, rangeY)
	local spectators = Game.getSpectators(centerPosition, false, true,
		rangeX,
		rangeX, rangeY, rangeY)
	if #spectators ~= 0 then
		return true
	end
	return false
end

local function clearBossRoom(playerId, bossId,
		centerPosition,
		rangeX, rangeY, exitPosition)
	local spectators, spectator = Game.getSpectators(centerPosition, false, false,
		rangeX,
		rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isPlayer() and spectator.uid == playerId then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end
		if spectator:isMonster() and spectator.uid == bossId then
			spectator:remove()
		end
	end
end

local function clearBossRoomOnlyMonster(centerPosition, rangeX, rangeY)
	local spectators, spectator = Game.getSpectators(centerPosition, false, false,
		rangeX,
		rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:remove()
		end
	end
end

local bosses = {
	[3230] = {
		bossName = 'Tromphonyte',
		bossPointsRequired = 1,
		playerPosition = Position(210, 668, 15),
		bossPosition = Position(211, 683, 15),
		centerPosition = Position(209, 665, 15),
		rangeX = 5, rangeY = 11
	},
	[3231] = {
		bossName = 'The Bloodweb',
		bossPointsRequired = 1,
		playerPosition = Position(296, 613, 15),
		bossPosition = Position(296, 605, 15),
		centerPosition = Position(298, 606, 15),
		rangeX = 12, rangeY = 12
	},
	[3232] = {
		bossName = 'Ribstride',
		bossPointsRequired = 1,
		playerPosition = Position(389, 617, 15),
		bossPosition = Position(389, 608, 15),
		centerPosition = Position(390, 609, 15),
		rangeX = 13, rangeY = 13
	},
	[3233] = {
		bossName = 'Esmeralda',
		bossPointsRequired = 1,
		playerPosition = Position(359, 607, 15),
		bossPosition = Position(360, 610, 15),
		centerPosition = Position(360, 609, 15),
		rangeX = 5, rangeY = 5
	},
	[3234] = {
		bossName = 'Bruise Payne',
		bossPointsRequired = 1,
		playerPosition = Position(252, 633, 15),
		bossPosition = Position(266, 643, 15),
		centerPosition = Position(266, 643, 15),
		rangeX = 24, rangeY = 15
	},
	[3235] = {
		bossName = 'Fleshcrawler',
		bossPointsRequired = 1,
		playerPosition = Position(209, 601, 15),
		bossPosition = Position(225, 615, 15),
		centerPosition = Position(217, 607, 15),
		rangeX = 17, rangeY = 15
	},
	[3236] = {
		bossName = 'The Bloodtusk',
		bossPointsRequired = 1,
		playerPosition = Position(337, 604, 15),
		bossPosition = Position(337, 610, 15),
		centerPosition = Position(337, 607, 15),
		rangeX = 7, rangeY = 7
	},
	[3237] = {
		bossName = 'Shardhead',
		bossPointsRequired = 1,
		playerPosition = Position(258, 607, 15),
		bossPosition = Position(264, 607, 15),
		centerPosition = Position(261, 605, 15),
		rangeX = 8, rangeY = 8
	},
	[3238] = {
		bossName = 'Hemming',
		bossPointsRequired = 1,
		playerPosition = Position(300, 685, 15),
		bossPosition = Position(307, 678, 15),
		centerPosition = Position(307, 679, 15),
		rangeX = 12, rangeY = 12
	},
	[3239] = {
		bossName = 'Fazzrah',
		bossPointsRequired = 1,
		playerPosition = Position(253, 675, 15),
		bossPosition = Position(271, 675, 15),
		centerPosition = Position(266, 675, 15),
		rangeX = 18, rangeY = 8
	},
	[3240] = {
		bossName = 'Leviathan',
		bossPointsRequired = 1,
		playerPosition = Position(390, 647, 15),
		bossPosition = Position(379, 648, 15),
		centerPosition = Position(384, 648, 15),
		rangeX = 10, rangeY = 9
	},
	[3241] = {
		bossName = 'Tormentor',
		bossPointsRequired = 1,
		playerPosition = Position(343, 692, 15),
		bossPosition = Position(352, 695, 15),
		centerPosition = Position(349, 698, 15),
		rangeX = 15, rangeY = 17
	},
	[3242] = {
		bossName = 'The Many',
		bossPointsRequired = 2,
		playerPosition = Position(398, 697, 15),
		bossPosition = Position(398, 705, 15),
		centerPosition = Position(398, 700, 15),
		rangeX = 9, rangeY = 9
	},
	[3243] = {
		bossName = 'Stonecracker',
		bossPointsRequired = 2,
		playerPosition = Position(273, 706, 15),
		bossPosition = Position(274, 714, 15),
		centerPosition = Position(274, 711, 15),
		rangeX = 9, rangeY = 9
	},
	[3244] = {
		bossName = 'The Old Widow',
		bossPointsRequired = 2,
		playerPosition = Position(242, 700, 15),
		bossPosition = Position(235, 700, 15),
		centerPosition = Position(239, 700, 15),
		rangeX = 7, rangeY = 7
	},
	[3245] = {
		bossName = 'The Noxious Spawn',
		bossPointsRequired = 2,
		playerPosition = Position(425, 644, 15),
		bossPosition = Position(425, 650, 15),
		centerPosition = Position(425, 647, 15),
		rangeX = 8, rangeY = 8
	},
	[3246] = {
		bossName = 'Gorgo',
		bossPointsRequired = 2,
		playerPosition = Position(452, 697, 15),
		bossPosition = Position(453, 685, 15),
		centerPosition = Position(453, 690, 15),
		rangeX = 12, rangeY = 12
	},
	[3247] = {
		bossName = 'Sulphur Scuttler',
		bossPointsRequired = 2,
		playerPosition = Position(305, 742, 15),
		bossPosition = Position(318, 733, 15),
		centerPosition = Position(313, 734, 15),
		rangeX = 14, rangeY = 14
	},
	[3248] = {
		bossName = 'Bretzecutioner',
		bossPointsRequired = 2,
		playerPosition = Position(254, 751, 15),
		bossPosition = Position(247, 743, 15),
		centerPosition = Position(254, 743, 15),
		rangeX = 15, rangeY = 15
	},
	[3249] = {
		bossName = 'Ethershreck',
		bossPointsRequired = 3,
		playerPosition = Position(434, 625, 15),
		bossPosition = Position(431, 614, 15),
		centerPosition = Position(433, 616, 15),
		rangeX = 15, rangeY = 15
	},
	[3250] = {
		bossName = 'Zanakeph',
		bossPointsRequired = 3,
		playerPosition = Position(381, 738, 15),
		bossPosition = Position(383, 751, 15),
		centerPosition = Position(381, 746, 15),
		rangeX = 20, rangeY = 20
	},
	[3251] = {
		bossName = 'Paiz The Pauperizer',
		bossPointsRequired = 3,
		playerPosition = Position(185, 716, 15),
		bossPosition = Position(197, 716, 15),
		centerPosition = Position(191, 716, 15),
		rangeX = 12, rangeY = 12
	},
	[3252] = {
		bossName = 'Kerberos',
		bossPointsRequired = 3,
		playerPosition = Position(154, 609, 15),
		bossPosition = Position(154, 622, 15),
		centerPosition = Position(155, 617, 15),
		rangeX = 15, rangeY = 15
	},
	[3253] = {
		bossName = 'Ron The Ripper',
		bossPointsRequired = 4,
		playerPosition = Position(468, 613, 15),
		bossPosition = Position(468, 624, 15),
		centerPosition = Position(468, 618, 15),
		rangeX = 4, rangeY = 9
	},
	[3254] = {
		bossName = 'Deadeye Devious',
		bossPointsRequired = 4,
		playerPosition = Position(483, 613, 15),
		bossPosition = Position(483, 624, 15),
		centerPosition = Position(483, 618, 15),
		rangeX = 4, rangeY = 9
	},
	[3255] = {
		bossName = 'Lethal Lissy',
		bossPointsRequired = 4,
		playerPosition = Position(498, 613, 15),
		bossPosition = Position(498, 624, 15),
		centerPosition = Position(498, 618, 15),
		rangeX = 4, rangeY = 9
	},
	[3256] = {
		bossName = 'Brutus Bloodbeard',
		bossPointsRequired = 4,
		playerPosition = Position(513, 613, 15),
		bossPosition = Position(513, 624, 15),
		centerPosition = Position(513, 618, 15),
		rangeX = 4, rangeY = 9
	},

	[3257] = {
		bossName = 'Necropharus',
		bossPointsRequired = 4,
		playerPosition = Position(442, 741, 15),
		bossPosition = Position(443, 734, 15),
		centerPosition = Position(440, 737, 15),
		rangeX = 10, rangeY = 10
	},
	[3258] = {
		bossName = 'Tiquandas Revenge',
		bossPointsRequired = 4,
		playerPosition = Position(190, 750, 15),
		bossPosition = Position(190, 758, 15),
		centerPosition = Position(190, 754, 15),
		rangeX = 8, rangeY = 8
	},
	[3259] = {
		bossName = 'Demodras',
		bossPointsRequired = 4,
		playerPosition = Position(503, 661, 15),
		bossPosition = Position(504, 670, 15),
		centerPosition = Position(503, 666, 15),
		rangeX = 10, rangeY = 10
	},
	[3260] = {
		bossName = 'The Horned Fox',
		bossPointsRequired = 4,
		playerPosition = Position(481, 733, 15),
		bossPosition = Position(482, 744, 15),
		centerPosition = Position(484, 739, 15),
		rangeX = 12, rangeY = 12
	},
}

local boss = MoveEvent()

function boss.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if not boss then
		return true
	end

	if player:getStorageValue(BOSS_POINTS) < boss.bossPointsRequired then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendCancelMessage("You not have enough boss points")
		return true
	end

	if roomIsOccupied(boss.centerPosition, boss.rangeX, boss.rangeY) then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendCancelMessage("Someone challenging this boss now")
		return true
	else
		clearBossRoomOnlyMonster(boss.centerPosition, boss.rangeX, boss.rangeY)
	end

	player:setStorageValue(BOSS_POINTS, player:getStorageValue(BOSS_POINTS) - boss.bossPointsRequired)
	player:teleportTo(boss.playerPosition)
	boss.playerPosition:sendMagicEffect(CONST_ME_TELEPORT)

	local monster = Game.createMonster(boss.bossName, boss.bossPosition)
	if not monster then
		return true
	end

	addEvent(clearBossRoom, 60 * 10 * 1000, player.uid, monster.uid, boss.centerPosition, boss.rangeX, boss.rangeY, fromPosition)
	player:say(
		"You have ten minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.",
		TALKTYPE_MONSTER_SAY
	)
	return true
end

boss:type("stepin")

for index, value in pairs(bosses) do
	boss:uid(index)
end
boss:register()
