local heartDestructionFinal = Action()
function heartDestructionFinal.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(75, 824, 8),
			Position(75, 825, 8),
			Position(75, 826, 8),
			Position(75, 827, 8),
			Position(75, 828, 8),
			Position(76, 824, 8),
			Position(76, 825, 8),
			Position(76, 826, 8),
			Position(76, 827, 8),
			Position(76, 828, 8),
			Position(77, 824, 8),
			Position(77, 825, 8),
			Position(77, 826, 8),
			Position(77, 827, 8),
			Position(77, 828, 8),
		},
		newPos = {x = 76, y = 806, z = 8},
		bossRoomCenterPosition = Position(76, 796, 8),
		rangeX = 12,
		rangeY = 12,
		exitPos = Position(76, 830, 8),
		pushPos = {x = 76, y = 824, z = 8}
	}

	if item.actionid == 14332 then
		if item.itemid == 8911 then
			if player:getPosition().x == config.pushPos.x and player:getPosition().y == config.pushPos.y and player:getPosition().z == config.pushPos.z then

				local storePlayers = {}
				local playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						if playerTile:getStorageValue(Storage.Quest.HeartOfDestruction.WDTimer) > os.time() then
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
						player:setStorageValue(Storage.Quest.HeartOfDestruction.WDTimer, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					addEvent(ClearPlayersInBossRoom, 15 * 60000, playersUidTable, config.bossRoomCenterPosition, config.rangeX, config.rangeY, config.exitPos)

					Game.createMonster("Spark of Destruction", {x = 79, y = 793, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 73, y = 794, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 80, y = 802, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 69, y = 803, z = 8}, false, true)
					Game.createMonster("World Devourer", {x = 75, y = 796, z = 8}, false, true)
					DevourerSummon = 0
					DestructionSummon = 0
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

heartDestructionFinal:aid(14332)
heartDestructionFinal:register()
