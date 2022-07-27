local function outExplode()
	local upConer = {x = 125, y = 860, z = 8}       -- upLeftCorner
	local downConer = {x = 146, y = 881, z = 8}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k= upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								c:teleportTo({x = 135, y = 866, z = 8})
							elseif isMonster(c) and c:getName() == "Charging Outburst" then
								c:teleportTo({x = 135, y = 865, z = 8})
							end
						end
					end
				end
			end
		end
	end
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PURPLEENERGY)

local arr = {
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
combat:setArea(area)

local function delayedCastSpell(creature, var)
	if not creature then
		return
	end
	creature:say("BOOM.", TALKTYPE_MONSTER_SAY)
	return combat:execute(creature, positionToVariant(creature:getPosition()))
end

function removeOutburst(cid)
	local creature = Creature(cid)
	if not isCreature(creature) then return false end
	creature:remove()
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local from = creature:getId()

	outExplode()
	delayedCastSpell(creature, var)
	ChargingOutKilled = true
	addEvent(removeOutburst, 1000, creature.uid)

	local monster = Game.createMonster("Outburst", {x = 135, y = 870, z = 8}, false, true)
	monster:addHealth(-monster:getHealth() + OutburstHealth, COMBAT_PHYSICALDAMAGE)
	return true
end

spell:name("outburst explode")
spell:words("###449")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
