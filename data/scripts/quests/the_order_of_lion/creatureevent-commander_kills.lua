local config = {
	firstPlayerPosition = Position(213, 745, 6),
  centerPosition = Position(196, 758, 7), -- Center Room
	exitPosition = Position(214, 744, 6), -- Exit Position
	rangeX = 24,
	rangeY = 20,
}

local lionCommanderDeath = CreatureEvent("lionCommanderDeath")
function lionCommanderDeath.onPrepareDeath(creature)
	local totalCommanders = Game.getStorageValue(Storage.TheOrderOfTheLion.Drume.TotalLionCommanders)
	if totalCommanders > 1 then
		Game.setStorageValue(Storage.TheOrderOfTheLion.Drume.TotalLionCommanders, totalCommanders - 1)
	else
		local spectators = Game.getSpectators(config.centerPosition, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
		for _, cid in pairs(spectators) do
			if cid:isMonster() and not cid:getMaster() then
				cid:remove()
			elseif cid:isPlayer() then
				cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You lost the skirmish.")
				cid:teleportTo(config.exitPosition)
			end
		end
		config.exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
    return true
end
lionCommanderDeath:register()

local usurperCommanderDeath = CreatureEvent("usurperCommanderDeath")
function usurperCommanderDeath.onPrepareDeath(creature)
	local totalCommanders = Game.getStorageValue(Storage.TheOrderOfTheLion.Drume.TotalUsurperCommanders)
	Game.setStorageValue(Storage.TheOrderOfTheLion.Drume.TotalUsurperCommanders, totalCommanders - 1)
	if totalCommanders == 1 then
		Game.createMonster("Drume", Position(196, 760, 7), false, true)
	end
    return true
end
usurperCommanderDeath:register()
