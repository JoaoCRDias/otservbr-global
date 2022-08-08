local config = {
	lionPosition = {
		Position(205, 757, 7),
		Position(208, 750, 7),
		Position(184, 762, 7),
	},
	usurperPosition = {
		Position(208, 755, 7),
		Position(187, 757, 7),
		Position(190, 771, 7)
	},
	firstPlayerPosition = Position(213, 745, 6),
  centerPosition = Position(196, 758, 7), -- Center Room
	exitPosition = Position(214, 744, 6), -- Exit Position
	newPosition = Position(208, 745, 7),
	rangeX = 24,
	rangeY = 20,
	timeToKill = 15, -- time in minutes to remove the player
}

local function RoomIsOccupied(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(config.centerPosition, false, true, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
	if #spectators ~= 0 then
		return true
	end

	return false
end


local function clearRoomDrume(centerPosition, rangeX, rangeY, resetGlobalStorage)
	local spectators,
	spectator = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:remove()
		end
		if spectator:isPlayer() then
			spectator:teleportTo(config.exitPosition)
			spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your time is over.")
		end
	end
	if Game.getStorageValue(resetGlobalStorage) == 1 then
		Game.setStorageValue(resetGlobalStorage, -1)
	end
end

local drumeAction = Action()
function drumeAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getPosition() ~= config.firstPlayerPosition then return false end
	if RoomIsOccupied(config.centerPosition, config.rangeX, config.rangeY) then
		player:sendCancelMessage("There's someone already in the skirmish.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	local tempPos, tempTile, tempCreature
	local players = {}
	for x = config.firstPlayerPosition.x, config.firstPlayerPosition.x + 4 do
		tempPos = Position(x, config.firstPlayerPosition.y, config.firstPlayerPosition.z)
		tempTile = Tile(tempPos)
		if tempTile then
			tempCreature = tempTile:getTopCreature()
			if tempCreature and tempCreature:isPlayer() then
				table.insert(players, tempCreature)
			end
		end
	end
	if #players == 0 then return false end
	for _, pi in pairs(players) do
		if pi:getStorageValue(Storage.TheOrderOfTheLion.Drume.Timer) > os.time() then
			player:sendCancelMessage("Someone of your team has already fought in the skirmish in the last 20h.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end
	end
	local spectators = Game.getSpectators(config.centerPosition, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
	for _, creature in pairs(spectators) do
		if creature:isMonster() then
			creature:remove()
		end
	end
	local totalLion = 0
	local totalUsurper = 0
	local tempMonster
	for _, pos in pairs(config.lionPosition) do
		tempMonster = Game.createMonster("Lion Commander", pos)
		if not tempMonster then
			player:sendCancelMessage("There was an error, contact an admin.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end
		totalLion = totalLion + 1
	end
	for _, pos in pairs(config.usurperPosition) do
		tempMonster = Game.createMonster("Usurper Commander", pos)
		if not tempMonster then
			player:sendCancelMessage("There was an error, contact an admin.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end
		totalUsurper = totalUsurper + 1
	end
	for _, pi in pairs(players) do
		pi:setStorageValue(Storage.TheOrderOfTheLion.Drume.Timer, os.time() + (20 * 60 * 60))
		pi:teleportTo(config.newPosition)
		addEvent(clearRoomDrume, config.timeToKill * 60 * 1000, config.centerPosition, config.rangeX, config.rangeY, 59601)
		pi:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have " ..config.timeToKill.." minutes to defeat Drume.")

	end
	config.newPosition:sendMagicEffect(CONST_ME_TELEPORT)
	toPosition:sendMagicEffect(CONST_ME_POFF)
	Game.setStorageValue(Storage.TheOrderOfTheLion.Drume.TotalLionCommanders, totalLion)
	Game.setStorageValue(Storage.TheOrderOfTheLion.Drume.TotalUsurperCommanders, totalUsurper)
	return true
end
drumeAction:aid(59601)
drumeAction:register()
