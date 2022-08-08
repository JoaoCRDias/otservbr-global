local rewards = {
	[1] = {item = {28557}, charges = 1000},
	[2] = {item = {28556}, charges = 1000},
	[3] = {item = {28555}, charges = 1000},
	[4] = {item = {28554, 28553, 28552}, charges = 1000},
}

local freeExercise = CreatureEvent("FreeQuests")

function freeExercise.onLogin(player)
	if player:getStorageValue(Storage.FreeExercise) == 1 or player:getVocation():getId() < 1 or player:getVocation():getId() > 4 then
		return true
	end

	local reward = rewards[player:getVocation():getId()]
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You got a free exercise weapon, good game")
	local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
	for k, v in pairs(reward.item) do
		local it = inbox:addItem(v, reward.charges)
		it:setAttribute(ITEM_ATTRIBUTE_ACTIONID, Storage.UnmoveableExercise)
	end
	player:setStorageValue(Storage.FreeExercise, 1)
	return true
end

freeExercise:register()
