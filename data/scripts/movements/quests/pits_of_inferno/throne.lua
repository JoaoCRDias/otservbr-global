local setting = {
	[2080] = {
		storage = Storage.PitsOfInferno.Throne1,
		text = "You have touched one of the five thrones and absorbed some of darkness power.",
		effect = CONST_ME_FIREAREA,
		toPosition = Position(1018, 1189, 11)
	},
	[2081] = {
		storage = Storage.PitsOfInferno.Throne2,
		text = "You have touched one of the five thrones and absorbed some of darkness power.",
		effect = CONST_ME_MORTAREA,
		toPosition = Position(1039, 1159, 11)
	},
	[2082] = {
		storage = Storage.PitsOfInferno.Throne3,
		text = "You have touched one of the five thrones and absorbed some of darkness power.",
		effect = CONST_ME_POISONAREA,
		toPosition = Position(1045, 1187, 11)
	},
	[2083] = {
		storage = Storage.PitsOfInferno.Throne4,
		text = "You have touched one of the five thrones and absorbed some of darkness power.",
		effect = CONST_ME_EXPLOSIONAREA,
		toPosition = Position(1107, 1136, 11)
	},
	[2085] = {
		storage = Storage.PitsOfInferno.Throne5,
		text = "You have touched one of the five thrones and absorbed some of darkness power.",
		effect = CONST_ME_FIREAREA,
		toPosition = Position(1107, 1226, 11)
	}
}

local throne = MoveEvent()

function throne.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local throne = setting[item.uid]
	if not throne then
		return true
	end

	if player:getStorageValue(throne.storage) ~= 1 then
		player:setStorageValue(throne.storage, 1)
		player:getPosition():sendMagicEffect(throne.effect)
		player:say(throne.text, TALKTYPE_MONSTER_SAY)
	else
		player:teleportTo(throne.toPosition)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		player:say("Begone!", TALKTYPE_MONSTER_SAY)
	end
	return true
end

throne:type("stepin")

for index, value in pairs(setting) do
	throne:uid(index)
end

throne:register()
