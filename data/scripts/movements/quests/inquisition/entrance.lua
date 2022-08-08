local throneStorages = {
	Storage.PitsOfInferno.Throne1,
	Storage.PitsOfInferno.Throne2,
	Storage.PitsOfInferno.Throne3,
	Storage.PitsOfInferno.Throne4,
	Storage.PitsOfInferno.Throne5
}

local function hasTouchedOneThrone(player)
	for i = 1, #throneStorages do
		if player:getStorageValue(throneStorages[i]) == 1 then
			return true
		end
	end
	return false
end

local entrance = MoveEvent()

function entrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if hasTouchedOneThrone(player) and player:getLevel() >= 100 then
		local destination = Position(803, 995, 13)
		player:teleportTo(destination)
		position:sendMagicEffect(CONST_ME_TELEPORT)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	else
		player:teleportTo(fromPosition, true)
		player:say("At least one POI throne needed to access this teleport.", TALKTYPE_MONSTER_SAY)
		position:sendMagicEffect(CONST_ME_TELEPORT)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end



end

entrance:type("stepin")
entrance:uid(9014)
entrance:register()
