local teleports = {
	[64001] = {x = 596, y = 1127, z = 8},
	[64002] = {x = 692, y = 986, z = 7}
}

local teleport = MoveEvent()

function teleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end



	local toPosition = teleports[item.uid]
	if toPosition then
		player:teleportTo(toPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

teleport:uid(64001, 64002)
teleport:register()
