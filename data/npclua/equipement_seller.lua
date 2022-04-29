local internalNpcName = "Equipement Seller"
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

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my store. Say {trade} to see offers?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please come back from time to time.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Please come back from time to time.")

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	--Backpacks
	{ itemName = "backpack", clientId = 2854, buy = 20 },
	{ itemName = "beach backpack", clientId = 5949, buy = 20 },
	{ itemName = "blue backpack", clientId = 2869, buy = 20 },
	{ itemName = "brocade backpack", clientId = 8860, buy = 20 },
	{ itemName = "camouflage backpack", clientId = 2872, buy = 20 },
	{ itemName = "demon backpack", clientId = 9601, buy = 20 },
	{ itemName = "dragon backpack", clientId = 10326, buy = 20 },
	{ itemName = "expedition backpack", clientId = 10324, buy = 20 },
	{ itemName = "fur backpack", clientId = 7342, buy = 20 },
	{ itemName = "golden backpack", clientId = 2871, buy = 20 },
	{ itemName = "green backpack", clientId = 2865, buy = 20 },
	{ itemName = "grey backpack", clientId = 2870, buy = 20 },
	{ itemName = "minotaur backpack", clientId = 10327, buy = 20 },
	{ itemName = "orange backpack", clientId = 9602, buy = 20 },
	{ itemName = "purple backpack", clientId = 2868, buy = 20 },
	{ itemName = "red backpack", clientId = 2867, buy = 20 },
	{ itemName = "yellow backpack", clientId = 2866, buy = 20 },
	--Canivetes
	{ itemName = "whacking driller of fate", clientId = 9598, buy = 200000 },
	{ itemName = "squeezing gear of girlpower", clientId = 9596, buy = 200000 },
	{ itemName = "sneaky stabber of eliteness", clientId = 9594, buy = 200000 },
	--Equipamentos
	{ itemName = "rope", clientId = 3003, buy = 50 },
	{ itemName = "shovel", clientId = 3457, buy =  50},
	{ itemName = "machete", clientId = 3308, buy = 50 },
	{ itemName = "pick", clientId = 3456, buy = 50 },
	{ itemName = "scythe", clientId = 3453, buy = 50 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150 },
	{ itemName = "worm", clientId = 3492, buy = 1 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
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
