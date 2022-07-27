local heartDestructionOutburst = Action()
function heartDestructionOutburst.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(108, 870, 8),
			Position(108, 871, 8),
			Position(108, 872, 8),
			Position(108, 873, 8),
			Position(108, 874, 8)
		},
		newPos = {x = 128, y = 871, z = 8},
		bossRoomCenterPosition = Position(136, 870, 8),
		rangeX = 11,
		rangeY = 11,
		exitPos = Position(108, 876, 8),
		pushPos = {x = 108, y = 870, z = 8}
	}

	if item.actionid == 14331 then
		if item.itemid == 8911 then
			if player:getPosition().x == config.pushPos.x and player:getPosition().y == config.pushPos.y and player:getPosition().z == config.pushPos.z then

				local storePlayers = {}
				local playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						if playerTile:getStorageValue(Storage.Quest.HeartOfDestruction.OutburstTimer) > os.time() then
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
						player:setStorageValue(Storage.Quest.HeartOfDestruction.OutburstTimer, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					addEvent(ClearPlayersInBossRoom, 15 * 60000, playersUidTable, config.bossRoomCenterPosition, config.rangeX, config.rangeY, config.exitPos)

					Game.createMonster("Spark of Destruction", {x = 132, y = 867, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 140, y = 867, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 140, y = 874, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 131, y = 874, z = 8}, false, true)
					Game.createMonster("Outburst", {x = 135, y = 870, z = 8}, false, true)

					OutburstStage = 0
					OutburstHealth = 290000

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

heartDestructionOutburst:aid(14331)
heartDestructionOutburst:register()





