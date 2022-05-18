local internalNpcName = "Captain Chelop"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 289,
	lookHead = 2,
	lookBody = 67,
	lookLegs = 39,
	lookFeet = 76,
	lookAddons = 1
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'By direct edict of the honorable Henricus, we are ordered to give passage for all recruits to Thais.'}
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

-- Travel
local travelKeyword = keywordHandler:addKeyword({'kingsman'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Kingsman for |TRAVELCOST|?', cost = 210})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = 210, destination = Position(1038, 970, 6)})
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'By direct edict of the honorable Henricus himself... well, you know.', reset = true})
keywordHandler:addAliasKeyword({'town'})

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(869, 1382, 7)}})

-- Basic
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = "I can bring you back to {Kingsman} if you are weary or you can stay and fight. What shall it be?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Chelop and I am a captain of this {inquisition} ship."})

keywordHandler:addKeyword({'roshamuul'}, StdModule.say, {npcHandler = npcHandler, text = "This is the island you are currently on, just in case you forgot."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, recruit |PLAYERNAME|. Where can I {sail} you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "On behalf of the inquisition, I bid you farewell.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye then.")
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
