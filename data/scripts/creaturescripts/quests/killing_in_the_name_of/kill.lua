local killingInTheNameOfKill = CreatureEvent("KillingInTheNameOfKill")

function killingInTheNameOfKill.onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	local targetName, taskId = target:getName():lower()
	local startedTasks = player:getStartedTasks()

	for i = 1, #startedTasks do
		taskId = startedTasks[i]
		if isInArray(tasks[taskId].creatures, targetName) then
			local killAmount = player:getStorageValue(KILLSSTORAGE_BASE + taskId)
			if killAmount < tasks[taskId].killsRequired then
				-- Set max kills to adm
				-- if (player:getAccountType() >= ACCOUNT_TYPE_GOD) then
				-- 	player:setStorageValue(KILLSSTORAGE_BASE + taskId, tasks[taskId].killsRequired)
				-- 	return true
				-- end
				player:setStorageValue(KILLSSTORAGE_BASE + taskId, killAmount + 1)
				player:sendCancelMessage('You killed ' .. killAmount + 1 .. '/' .. tasks[taskId].killsRequired .. ' creatures of ' .. tasks[taskId].raceName)
			else
				player:sendCancelMessage('You already finished ' .. tasks[taskId].raceName .. ' task')
			end
		end
	end
	return true
end

killingInTheNameOfKill:register()
