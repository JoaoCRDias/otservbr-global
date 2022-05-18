local internalNpcName = "Exercise Weapons"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 131,
	lookHead = 95,
	lookBody = 119,
	lookLegs = 117,
	lookFeet = 114,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Come into my store and buy some equipement!'}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my store. Say {trade} to see offers.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please come back from time to time.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Please come back from time to time.")

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	--Rings
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 7560000, count = 14400 },
	{ itemName = "exercise axe", clientId = 28553, buy = 262500, count = 500 },
	{ itemName = "exercise bow", clientId = 28555, buy = 262500, count = 500 },
	{ itemName = "exercise club", clientId = 28554, buy = 262500, count = 500 },
	{ itemName = "exercise sword", clientId = 28552, buy = 262500, count = 500 },
	{ itemName = "durable exercise axe", clientId = 35280, buy = 945000, count = 1800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 945000, count = 1800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 945000, count = 1800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 945000, count = 1800 },
	{ itemName = "lasting exercise rod", clientId = 35289, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise wand", clientId = 35290, buy = 7560000, count = 14400 },
	{ itemName = "exercise rod", clientId = 28556, buy = 262500, count = 500 },
	{ itemName = "exercise wand", clientId = 28557, buy = 262500, count = 500 },
	{ itemName = "durable exercise rod", clientId = 35283, buy = 945000, count = 1800 },
	{ itemName = "durable exercise wand", clientId = 35284, buy = 945000, count = 1800 },
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Bought %ix %s for %i %s.", amount, name, totalCost, ItemType(npc:getCurrency()):getPluralName():lower()))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, subtype, amount, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
