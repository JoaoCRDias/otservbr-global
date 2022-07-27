local heartDestructionRupture = Action()
function heartDestructionRupture.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(172, 913, 8),
			Position(172, 914, 8),
			Position(172, 915, 8),
			Position(172, 916, 8),
			Position(172, 917, 8)
		},
		newPos = {x = 191, y = 915, z = 8},
		bossRoomCenterPosition = Position(198, 915, 8),
		rangeX = 11,
		rangeY = 11,
		exitPos = Position(172, 919, 8),
		pushPos = {x = 172, y = 913, z = 8}
	}

	if item.actionid == 14327 then
		if item.itemid == 8911 then
			if player:getPosition().x == config.pushPos.x and player:getPosition().y == config.pushPos.y and player:getPosition().z == config.pushPos.z then

				local storePlayers = {}
				local playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						if playerTile:getStorageValue(Storage.Quest.HeartOfDestruction.RuptureTimer) > os.time() then
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
						player:setStorageValue(Storage.Quest.HeartOfDestruction.RuptureTimer, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					addEvent(ClearPlayersInBossRoom, 15 * 60000, playersUidTable, config.bossRoomCenterPosition, config.rangeX, config.rangeY, config.exitPos)

					Game.createMonster("Spark of Destruction", {x = 194, y = 913, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 195, y = 919, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 203, y = 918, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 202, y = 912, z = 8}, false, true)
					Game.createMonster("Rupture", {x = 197, y = 916, z = 8}, false, true)

					RuptureResonanceStage = 0
					ResonanceActive = false

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

heartDestructionRupture:aid(14327)
heartDestructionRupture:register()


