local config = {
	[110] = {type = "item", id = {3043, 2}, msg = "Voce ganhou 20k por alcancar o level 20!"},
	-- [30] = {type = "bank", id = {20000, 0}, msg = "Foi depositado em seu bank 20000 gold coints!"},
	[111] = {type = "mount", id = {13, 0}, msg = "Voce recebeu a montaria do donkey!"},
	[114] = {type = "item", id = {2478, 1}, aid = Storage.WeaponsChest, msg = "Voce recebeu uma caixa de armas!"},
	[113] = {type = "item", id = {3043, 5}, msg = "Voce recebeu 50k!"},
	[118] = {type = "item", id = {8778, 1}, msg = "Voce recebeu um addon doll!"},
}

local storage = Storage.LevelReward

local advanceLevelReward = CreatureEvent("AdvanceLevelReward")

function advanceLevelReward.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end
	for level, _ in pairs(config) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if config[level].type == "item" then
				local item = player:addItem(config[level].id[1], config[level].id[2], true)
				if(config[level].aid) then
					item:setAttribute(ITEM_ATTRIBUTE_ACTIONID, config[level].aid)
				end
			elseif config[level].type == "mount" then
				player:addMount(config[level].id[1])
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config[level].msg)
			player:setStorageValue(storage, level)
		end
	end

	player:save()

	return true
end

advanceLevelReward:register()
