
local config = {
	newPos = {x = 76, y = 831, z = 8},



}

local teleportHeart = MoveEvent()

function teleportHeart.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(14326) == 1 and player:getStorageValue(14327) == 1 and player:getStorageValue(14328) == 1 and player:getStorageValue(14330) == 1 and player:getStorageValue(14332) == 1 then
		player:teleportTo(config.newPos)
		Position(config.newPos):sendMagicEffect(11)
	else
		player:sendCancelMessage('You need to kill all HoD bosses before challenge world devourer')
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end


	return true
end

teleportHeart:type("stepin")
teleportHeart:aid(14352)
teleportHeart:register()
