local config = {
	[3255] = {position = Position(1234, 974, 8)},
	[57602] = {position = Position(1215, 961, 9)},
	[57604] = {position = Position(1250, 971, 9)},
	[57699] = {position = Position(1195, 954, 8)}
}

local falconCastle = MoveEvent()

function falconCastle.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	for index, value in pairs(config) do
		if item.actionid == index then
			if(item.actionid == 57604)then
				if(player:getStorageValue(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer) > os.time())then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have faced this boss in the last 20 hours.")
					player:teleportTo(fromPosition, true)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					return false
				end
			end
			doSendMagicEffect(player:getPosition(), CONST_ME_TELEPORT)
			player:teleportTo(value.position)
			doSendMagicEffect(value.position, CONST_ME_TELEPORT)
		end
	end
end

falconCastle:type("stepin")

for index, value in pairs(config) do
	falconCastle:aid(index)
end

falconCastle:register()
