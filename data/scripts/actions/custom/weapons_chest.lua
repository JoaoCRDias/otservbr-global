local rewards = {
	[0] = {items = {}},
	[1] = {items = {8094}},
	[2] = {items = {8082}},
	[3] = {items = {8027}},
	[4] = {items = {7389, 7384, 7415}},
}

local weaponsChest = Action()

function weaponsChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local vocation = player:getVocation():getBaseId()
	local reward = rewards[vocation];
	for k, v in pairs(reward.items) do
		player:addItem(v, 1, true)
	end
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received your weapons.')
	return true
end

weaponsChest:aid(Storage.WeaponsChest)
weaponsChest:register()
