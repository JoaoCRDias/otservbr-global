local config = {
	[1006] = {
		wallPositions = {
			Position(426, 672, 9),
			Position(427, 672, 9),
			Position(428, 672, 9),
			Position(429, 672, 9),
			Position(430, 672, 9),
			Position(431, 672, 9),
			Position(432, 672, 9),
			Position(433, 672, 9),
			Position(434, 672, 9),
			Position(435, 672, 9),
			Position(436, 672, 9),
			Position(437, 672, 9),
			Position(438, 672, 9)
		},
		wallDown = 2162,
		wallUp = 1295
	},
	[1007] = {
		wallPositions = {
			Position(423, 675, 9),
			Position(423, 676, 9),
			Position(423, 677, 9),
			Position(423, 678, 9),
			Position(423, 679, 9),
			Position(423, 680, 9),
			Position(423, 681, 9),
			Position(423, 682, 9),
			Position(423, 683, 9)
		},
		wallDown = 2164,
		wallUp = 1294
	},
	[1008] = {
		wallPositions = {
			Position(426, 686, 9),
			Position(427, 686, 9),
			Position(428, 686, 9),
			Position(429, 686, 9),
			Position(430, 686, 9),
			Position(431, 686, 9),
			Position(432, 686, 9),
			Position(433, 686, 9),
			Position(434, 686, 9),
			Position(435, 686, 9),
			Position(436, 686, 9),
			Position(437, 686, 9),
			Position(438, 686, 9)
		},
		wallDown = 2162,
		wallUp = 1295
	},
	[1009] = {
		wallPositions = {
			Position(441, 675, 9),
			Position(441, 676, 9),
			Position(441, 677, 9),
			Position(441, 678, 9),
			Position(441, 679, 9),
			Position(441, 680, 9),
			Position(441, 681, 9),
			Position(441, 682, 9),
			Position(441, 683, 9)
		},
		wallDown = 2164,
		wallUp = 1294
	}
}

local inquisitionBrother = Action()

function inquisitionBrother.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetLever = config[item.uid]
	if not targetLever then
		return true
	end

	local tile, thing
	for i = 1, #targetLever.wallPositions do
		tile = Tile(targetLever.wallPositions[i])
		if tile then
			thing = tile:getItemById(item.itemid == 2772 and targetLever.wallDown or targetLever.wallUp)
			if thing then
				thing:transform(item.itemid == 2772 and targetLever.wallUp or targetLever.wallDown)
			end
		end
	end

	item:transform(item.itemid == 2772 and 2773 or 2772)
	return true
end

for uniqueId, info in pairs(config) do
	inquisitionBrother:uid(uniqueId)
end

inquisitionBrother:register()
