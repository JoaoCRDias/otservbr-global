local heartDestructionEradicator = Action()
function heartDestructionEradicator.onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(135, 907, 8),
			Position(135, 908, 8),
			Position(135, 909, 8),
			Position(135, 910, 8),
			Position(135, 911, 8)
		},
		newPos = {x = 117, y = 907, z = 8},
		bossRoomCenterPosition = Position(110, 906, 8),
		rangeX = 11,
		rangeY = 11,
		exitPos = Position(135, 913, 8),
		pushPos = {x = 135, y = 907, z = 8}
	}

	if item.actionid == 14330 then
		if item.itemid == 8911 then
			if player:getPosition().x == config.pushPos.x and player:getPosition().y == config.pushPos.y and player:getPosition().z == config.pushPos.z then

				local storePlayers = {}
				local playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						if playerTile:getStorageValue(Storage.Quest.HeartOfDestruction.EradicatorTimer) > os.time() then
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
						player:setStorageValue(Storage.Quest.HeartOfDestruction.EradicatorTimer, os.time() + 20*60*60)
					end
					Position(config.newPos):sendMagicEffect(11)

					addEvent(ClearPlayersInBossRoom, 15 * 60000, playersUidTable, config.bossRoomCenterPosition, config.rangeX, config.rangeY, config.exitPos)

					Game.createMonster("Spark of Destruction", {x = 114, y = 903, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 106, y = 903, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 106, y = 911, z = 8}, false, true)
					Game.createMonster("Spark of Destruction", {x = 114, y = 910, z = 8}, false, true)
					Game.createMonster("Eradicator", {x = 110, y = 906, z = 8}, false, true)

					EradicatorReleaseT = false -- Liberar Spell
					EradicatorWeak = 0 -- Eradicator Form
					AreaEradicator = addEvent(function() EradicatorReleaseT = true end, 40000)

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

heartDestructionEradicator:aid(14330)
heartDestructionEradicator:register()
