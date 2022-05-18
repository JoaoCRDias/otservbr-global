local taskTalkAction = TalkAction("!task")



function taskTalkAction.onSay(player, words, param)

	local title = "Task system!"
	local message = "Select a task"

	local modal = ModalWindow {
		title = title,
		message = message
	}

	local startedTasks = player:getStartedTasks()

	for key, value in ipairs(tasks) do
		local task = getTaskByName(value.raceName)
		if isInArray(startedTasks, task) then
			local killedCreatures = player:getStorageValue(KILLSSTORAGE_BASE + task)
			modal:addChoice(string.format('[%d/%d] %s',killedCreatures, value.killsRequired, value.raceName))
		else
			modal:addChoice(string.format('%s', value.raceName))
		end

	end

	local internalConfirm = function(button, choice)
		if player:canStartTask(choice.text) then
			player:setStorageValue(QUESTSTORAGE_BASE + choice.id, 1)
			player:setStorageValue(KILLSSTORAGE_BASE + choice.id, 0)
			player:sendCancelMessage("Task started")
		else
			player:sendCancelMessage("You can not start this task.")
		end
	end

	local internalCancel = function(btn, choice)
		if isInArray(startedTasks, choice.id) then
			player:setStorageValue(QUESTSTORAGE_BASE + choice.id, 0)
			player:setStorageValue(KILLSSTORAGE_BASE + choice.id, 0)
			player:sendCancelMessage("You cancelled this task.")
		end
	end

	local internalReport = function(btn, choice)
		local killedCreatures = player:getStorageValue(KILLSSTORAGE_BASE + choice.id)
		if killedCreatures >= tasks[choice.id].killsRequired then
			for j = 1, #tasks[choice.id].rewards do
				local reward = tasks[choice.id].rewards[j]
				local deny = false
				if reward.storage then
					if player:getStorageValue(reward.storage[1]) >= reward.storage[2] then
						deny = true
					end
				end
				if isInArray({REWARD_MONEY, "money"}, reward.type:lower()) and not deny then
					player:addMoney(reward.value[1])
				elseif isInArray({REWARD_EXP, "exp", "experience"}, reward.type:lower()) and not deny then
					player:addExperience(reward.value[1], true)
				elseif isInArray({REWARD_ACHIEVEMENT, "achievement", "ach"}, reward.type:lower()) and not deny then
					player:addAchievement(reward.value[1])
				elseif isInArray({REWARD_STORAGE, "storage", "stor"}, reward.type:lower()) and not deny then
					player:setStorageValue(reward.value[1], reward.value[2])
				elseif isInArray({REWARD_POINT, "points", "point"}, reward.type:lower()) and not deny then
					player:setStorageValue(POINTSSTORAGE, getPlayerTasksPoints(creature) + reward.value[1])
				elseif isInArray({REWARD_ITEM, "item", "items", "object"}, reward.type:lower()) and not deny then
					player:addItem(reward.value[1], reward.value[2])
				end

				if reward.storage then
					player:setStorageValue(reward.storage[1], reward.storage[2])
				end
			end
			player:setStorageValue(QUESTSTORAGE_BASE + choice.id, 0)
			player:setStorageValue(KILLSSTORAGE_BASE + choice.id, 0)
		else
			player:sendCancelMessage('You did not finished this task')
		end
	end

	modal:addButton('Close')
	modal:setDefaultEscapeButton('Close')
	modal:addButton('Report',internalReport)
	modal:addButton('Start',internalConfirm)
	modal:setDefaultEnterButton('Start')
	modal:addButton('Cancel',internalCancel)


	modal:sendToPlayer(player)

	return true
end

taskTalkAction:register()
