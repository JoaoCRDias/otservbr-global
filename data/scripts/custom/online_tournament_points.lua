local config = {
	storage = Storage.OnlineTournamentPoints,
	pointsPerHour = 1,
}

local onlinePointsEvent = GlobalEvent("GainPointPerHour")

function onlinePointsEvent.onThink(interval)
	local players = Game.getPlayers()
	if #players == 0 then
			return true
	end

	for _, player in pairs(players) do
		local seconds = math.max(0, player:getStorageValue(config.storage))
		if seconds >= 3600 then
				player:setStorageValue(config.storage, 0)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce recebeu " .. config.pointsPerHour .. " Tournament Point por estar online por uma hora.")
				player:addTournamentBalance(1, true)
				return true
		end
		player:setStorageValue(config.storage, seconds + math.ceil(interval/1000))
	end
	return true
end

onlinePointsEvent:interval(60000)
onlinePointsEvent:register()
