local internalNpcName = "Rings and Amulets"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 58,
	lookBody = 68,
	lookLegs = 109,
	lookFeet = 115,
	lookAddons = 0
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
	{ itemName = "axe ring", clientId = 3092, buy = 200 },
	{ itemName = "club ring", clientId = 3093, buy = 200 },
	{ itemName = "dwarven ring", clientId = 3097, buy = 2000 },
	{ itemName = "energy ring", clientId = 3051, buy = 2000 },
	{ itemName = "life ring", clientId = 3052, buy = 1000 },
	{ itemName = "might ring", clientId = 3048, buy = 5000 },
	{ itemName = "power ring", clientId = 3050, buy = 200 },
	{ itemName = "prismatic ring", clientId = 16114, buy = 100000 },
	{ itemName = "ring of healing", clientId = 3098, buy = 2000 },
	{ itemName = "stealth ring", clientId = 3049, buy = 2000 },
	{ itemName = "sword ring", clientId = 3091, buy = 200 },
	{ itemName = "time ring", clientId = 3053, buy = 2000 },

	--Amulets
	{ itemName = "amulet of loss", clientId = 3057, buy = 10000 },
	{ itemName = "garlic necklace", clientId = 3083, buy = 200 },
	{ itemName = "gill necklace", clientId = 16108, buy = 10000 },
	{ itemName = "prismatic necklace", clientId = 16113, buy = 20000 },
	{ itemName = "stone skin amulet", clientId = 3081, buy = 5000 },
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
