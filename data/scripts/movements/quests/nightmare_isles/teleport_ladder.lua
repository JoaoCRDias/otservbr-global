local setting = {
	[64103] = Position(573, 1153, 10),
	[64104] = Position(571, 1159, 9),
	[64105] = Position(561, 1098, 8),
	[64106] = Position(554, 1092, 8),
	[64107] = Position(520, 1094, 8),
	[64108] = Position(528, 1112, 10),
	[64109] = Position(518, 1116, 10),
	[64120] = Position(544, 1128, 11),
	[64121] = Position(558, 1144, 10),
	[64122] = Position(527, 1138, 10),
	[64123] = Position(526, 1145, 8),
	[64124] = Position(533, 1143, 8),
	[64125] = Position(576, 1133, 10),
	[64126] = Position(583, 1141, 8),
	[64127] = Position(550, 1129, 11),
	[64128] = Position(517, 1101, 10)
}

local teleportLadder = MoveEvent()

function teleportLadder.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = setting[item.actionid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	targetPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

teleportLadder:type("stepin")

for index, value in pairs(setting) do
	teleportLadder:aid(index)
end

teleportLadder:register()
