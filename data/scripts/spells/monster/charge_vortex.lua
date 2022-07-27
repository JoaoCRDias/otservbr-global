local mathCount = 0

local positions = {}

local function createVortex()
	local storedPositions = {
		{x = 199, y = 845, z = 8},
		{x = 193, y = 843, z = 8},
		{x = 202, y = 852, z = 8},
		{x = 197, y = 852, z = 8},
		{x = 191, y = 849, z = 8},
		{x = 194, y = 860, z = 8},
		{x = 205, y = 852, z = 8},
		{x = 189, y = 854, z = 8},
		{x = 199, y = 844, z = 8},
		{x = 191, y = 851, z = 8},
		{x = 201, y = 855, z = 8},
	}

	if mathCount == 0 then
		positions = storedPositions
	end

	local r1 = math.random(#positions)

	local tile = Tile(positions[r1])

	if tile then
		local ground = tile:getGround()
		if ground then
			ground:transform(22894)
		    addEvent(function()
			ground:transform(23049)
			end, 10*1000) -- 10*1000 = 10 SECONDS
			mathCount = mathCount + 1
			table.remove(positions, r1)
		end
	end

	if mathCount == 11 then
		mathCount = 0
	end
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	createVortex()
end

spell:name("charge vortex")
spell:words("###451")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
