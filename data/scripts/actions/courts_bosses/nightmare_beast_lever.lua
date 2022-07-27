local config = {
	leverAid = 14835,
	bossName = "The Nightmare Beast",
	bossPosition = Position(449, 803, 8),
	storageTimer = Storage.Quest.TheDreamCourts.NightmareBeastTimer,
	playerPositions = {
		Position(448, 774, 8),
		Position(446, 774, 8),
		Position(447, 774, 8),
		Position(449, 774, 8),
		Position(450, 774, 8),
		Position(446, 775, 8),
		Position(447, 775, 8),
		Position(448, 775, 8),
		Position(449, 775, 8),
		Position(450, 775, 8)
	},
	newPos = Position(449, 811, 8),
	bossRoomCenterPosition = Position(449, 804, 8),
	rangeX = 18,
	rangeY = 11,
	exitPos = Position(448, 777, 8),
	pushPos = Position(448, 774, 8)
}

local malofurLever = Action()
function malofurLever.onUse(player, item, fromPosition, itemEx, toPosition)
	if item.actionid == config.leverAid then
		if item.itemid == 8911 then
			if player:getPosition().x == config.pushPos.x and player:getPosition().y == config.pushPos.y and player:getPosition().z == config.pushPos.z then

				local storePlayers = {}
				local playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						if playerTile:getStorageValue(config.storageTimer) > os.time() then
							player:getPosition():sendMagicEffect(CONST_ME_POFF)
							player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You or a member in your team have to wait 20 hours to face this boss again!")
							return true
						end
						table.insert(storePlayers, playerTile)
					end
				end

				if CheckBossRoom(config.bossRoomCenterPosition, config.rangeX, config.rangeY) == false then
					ClearMonstersInBossRoom(config.bossRoomCenterPosition, config.rangeX, config.rangeY)


					local playersUidTable = {}
					for i = 1, #storePlayers do
						local player = storePlayers[i]
						config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
						table.insert(playersUidTable, player.uid)
						player:teleportTo(config.newPos)
						player:setStorageValue(config.storageTimer, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					addEvent(ClearPlayersInBossRoom, 15 * 60000, playersUidTable, config.bossRoomCenterPosition, config.rangeX, config.rangeY, config.exitPos)

					Game.createMonster(config.bossName, config.bossPosition, false, true)

					AnomalyStage = 0

				else
					player:sendTextMessage(19, "Someone is in the area.")
				end
			else
				player:sendCancelMessage("You need to stay in front of lever")
				return true
			end
		end
		item:transform(item.itemid == 8911 and 8912 or 8911)
	end
	return true
end

malofurLever:aid(config.leverAid)
malofurLever:register()
