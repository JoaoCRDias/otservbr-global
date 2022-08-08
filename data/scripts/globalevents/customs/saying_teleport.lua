local effects = {
	{position = Position(1008, 1004, 7), text = 'Trainers', effect = CONST_ME_GROUNDSHAKER},
	{position = Position(1008, 1002, 7), text = 'Hunts', effect = CONST_ME_GROUNDSHAKER},
	{position = Position(1000, 1000, 7), text = 'Bem vindo', effect = CONST_ME_GROUNDSHAKER},
	{position = Position(1008, 1000, 7), text = 'Task bosses', effect = CONST_ME_GROUNDSHAKER},
	{position = Position(1008, 998, 7), text = 'Mounts', effect = CONST_ME_GROUNDSHAKER},
	{position = Position(1008, 996, 7), text = 'Bosses', effect = CONST_ME_GROUNDSHAKER},
}

local sayingTps = GlobalEvent("sayingTps")
function sayingTps.onThink(interval, lastExecution)
	for i = 1, #effects do
		local settings = effects[i]
		local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
		if #spectators > 0 then
				if settings.text then
						for i = 1, #spectators do
								spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
						end
				end
				if settings.effect then
						settings.position:sendMagicEffect(settings.effect)
				end
		end
end
return true
end

sayingTps:interval(4000)
sayingTps:register()
