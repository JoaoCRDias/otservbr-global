local config = {
	leverAid = 14855,
	bossName = "King Zelos",
	bossPosition = Position(396, 697, 8),
	storageTimer = Storage.Quest.GraveDanger.ZelosTimer,
	playerPositions = {
		Position(438, 698, 8),
		Position(438, 697, 8),
		Position(438, 696, 8),
		Position(439, 696, 8),
		Position(439, 697, 8),
		Position(439, 698, 8),
		Position(439, 699, 8),
		Position(439, 700, 8),
		Position(438, 700, 8),
		Position(438, 699, 8)
	},
	newPos = Position(396, 703, 8),
	bossRoomCenterPosition = Position(396, 697, 8),
	rangeX = 11,
	rangeY = 11,
	exitPos = Position(441, 698, 8),
	pushPos = Position(438, 698, 8)
}

local alptramunLever = Action()
function alptramunLever.onUse(player, item, fromPosition, itemEx, toPosition)



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

alptramunLever:aid(config.leverAid)
alptramunLever:register()