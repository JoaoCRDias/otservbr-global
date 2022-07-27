local heartDestructionQuake = Action()
function heartDestructionQuake.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(175, 880, 8),
			Position(175, 881, 8),
			Position(175, 882, 8),
			Position(175, 883, 8),
			Position(175, 884, 8)
		},
		newPos = {x = 194, y = 884, z = 8},
		bossRoomCenterPosition = Position(202, 883, 8),
		rangeX = 11,
		rangeY = 11,
		exitPos = Position(175, 886, 8),
		pushPos = {x = 175, y = 880, z = 8}
	}

	if item.actionid == 14329 then
		if item.itemid == 8911 then
			if player:getPosition().x == config.pushPos.x and player:getPosition().y == config.pushPos.y and player:getPosition().z == config.pushPos.z then

				local storePlayers = {}
				local playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						if playerTile:getStorageValue(Storage.Quest.HeartOfDestruction.QuakeTimer) > os.time() then
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
						player:setStorageValue(Storage.Quest.HeartOfDestruction.QuakeTimer, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					addEvent(ClearPlayersInBossRoom, 15 * 60000, playersUidTable, config.bossRoomCenterPosition, config.rangeX, config.rangeY, config.exitPos)

					Game.createMonster("Spark of Destruction", {x = 199, y = 880, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 199, y = 887, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 206, y = 881, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 206, y = 886, z = 8}, false, true)
					Game.createMonster("Foreshock", {x = 202, y = 883, z = 8}, false, true)

					AftershockHealth = 105000
					ForeshockHealth = 105000
					RealityQuakeStage = 0
					ForeshockStage = 0
					ShockStage = 0

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

heartDestructionQuake:aid(14329)
heartDestructionQuake:register()
