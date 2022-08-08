local info = {
	bossName = "Scarlett Etzel",
	middle = Position(1221, 1044, 6),
	fromPos = Position(1210, 1034, 6),
	toPos = Position(1231, 1056, 6),
	exitPos = Position(1220, 1066, 6),
	timer = Storage.GraveDanger.CobraBastion.ScarlettTimer,
	armorId = 31482,
	armorPos = Position(1223, 1036, 6),
}

local entry = {
	metalWallId = 31449,
	roomEntryPos = Position(1220, 1062, 6),
	roomExitPos = Position(1220, 1064, 6)
}

local transformTo = {
	[31474] = 31475,
	[31475] = 31476,
	[31476] = 31477,
	[31477] = 31474
}

local function createArmor(id, amount, pos)
	local armor = Game.createItem(id, amount, pos)
	if armor then armor:setActionId(40003) end
end

local graveScarlettUid = Action()
function graveScarlettUid.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 40028 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.middle.x - 1, info.middle.x + 1 do
				for y = info.middle.y - 1, info.middle.y + 1 do
					local sqm = Tile(Position(x, y, 6))
					if sqm and sqm:getGround():getId() == 18013 then
						local player_ = sqm:getTopCreature()
						if player_ and player_:isPlayer() then
							if player_:getStorageValue(info.timer) > os.time() then
								player_:getPosition():sendMagicEffect(CONST_ME_POFF)
								player_:sendCancelMessage('You are still exhausted from your last battle.')
								return true
							end
							table.insert(playersTable, player_:getId())
						end
					end
				end
			end
			for _, p in pairs(playersTable) do
				local nPlayer = Player(p)
				if nPlayer then
					nPlayer:teleportTo(Position(1220, 1052, 6))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local scarlett = Game.createMonster("Scarlett Etzel", Position(1221, 1037, 6))
			if scarlett then
				scarlett:registerEvent('scarlettThink')
				scarlett:registerEvent('scarlettHealth')
				scarlett:setStorageValue(Storage.GraveDanger.CobraBastion.Questline, 1)
			end
			SCARLETT_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

graveScarlettUid:uid(40028)
graveScarlettUid:register()


local mirror = {
	fromPos = Position(1214, 1037, 6),
	toPos = Position(33403, 32655, 6),
	mirrors = {31474, 31475, 31476, 31477}
}

local function backMirror()
	for x = mirror.fromPos.x, mirror.toPos.x do
		for y = mirror.fromPos.y, mirror.toPos.y do
			local sqm = Tile(Position(x, y, 6))
			if sqm then
				for _, id in pairs(mirror.mirrors) do
					local item = sqm:getItemById(id)
					if item then
						item:transform(mirror.mirrors[math.random(#mirror.mirrors)])
						item:getPosition():sendMagicEffect(CONST_ME_POFF)
					end
				end
			end
		end
	end
end

local graveScarlettAid = Action();
function graveScarlettAid.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.actionid == 40003 then
		if isInArray(transformTo, item.itemid) then
			local pilar = transformTo[item.itemid]
			if pilar then
				item:transform(pilar)
				item:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
		elseif item.itemid == info.armorId then
			item:getPosition():sendMagicEffect(CONST_ME_THUNDER)
			item:remove(1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hold the old chestplate of Galthein in front of you. It does not fit and far too old to withstand any attack.")
			addEvent(createArmor, 20*1000, info.armorId, 1, info.armorPos)
			addEvent(backMirror, 10*1000)
			SCARLETT_MAY_TRANSFORM = 1
			addEvent(function()
				SCARLETT_MAY_TRANSFORM = 0
			end, 1 * 1000)
		elseif item.itemid == entry.metalWallId then
			if player:getPosition().y == entry.roomExitPos.y then
				player:teleportTo(entry.roomEntryPos)
			else
				player:teleportTo(entry.roomExitPos)
			end
		end
	end
	return true
end

graveScarlettAid:aid(40003)
graveScarlettAid:register()
