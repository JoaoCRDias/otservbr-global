local heartDestructionAnomaly = Action()
function heartDestructionAnomaly.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(170, 846, 8),
			Position(170, 847, 8),
			Position(170, 848, 8),
			Position(170, 849, 8),
			Position(170, 850, 8)
		},
		newPos = {x = 188, y = 851, z = 8},
		bossRoomCenterPosition = Position(196, 850, 8),
		rangeX = 11,
		rangeY = 11,
		exitPos = Position(170, 852, 8),
		pushPos = {x = 170, y = 846, z = 8}
	}

	if item.actionid == 14325 then
		if item.itemid == 8911 then
			if player:getPosition().x == config.pushPos.x and player:getPosition().y == config.pushPos.y and player:getPosition().z == config.pushPos.z then

				local storePlayers = {}
				local playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						if playerTile:getStorageValue(Storage.Quest.HeartOfDestruction.AnomalyTimer) > os.time() then
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
						player:setStorageValue(Storage.Quest.HeartOfDestruction.AnomalyTimer, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					addEvent(ClearPlayersInBossRoom, 15 * 60000, playersUidTable, config.bossRoomCenterPosition, config.rangeX, config.rangeY, config.exitPos)

					Game.createMonster("Spark of Destruction", {x = 199, y = 846, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 191, y = 846, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 201, y = 854, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 193, y = 856, z = 8}, false, true)
					Game.createMonster("Anomaly", {x = 197, y = 850, z = 8}, false, true)

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

heartDestructionAnomaly:aid(14325)
heartDestructionAnomaly:register()
