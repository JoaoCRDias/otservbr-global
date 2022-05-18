local bp = TalkAction("!bp")

local backpacks = {
	["green"] = 2865,
	["yellow"] = 2866,
	["red"] = 2867,
	["purple"] = 2868,
	["blue"] = 2869,
	["grey"] = 2870,
	["golden"] = 2871,
	["camouflage"] = 2872,
	["beach"] = 5949,
	["fur"] = 7342,
	["brocade"] = 8860,
	["orange"] = 9602
}

function bp.onSay(player, words, param)
	if param == "" then
		player:addItem(2854, 1)
		return true
	end

	local backpackType = backpacks[param:lower()]
	if backpackType then
		player:addItem(backpackType, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You bought " .. param:lower() .. " backpack.")
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	else
		player:sendCancelMessage("Invalid backpack name.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end

bp:separator(" ")
bp:register()
