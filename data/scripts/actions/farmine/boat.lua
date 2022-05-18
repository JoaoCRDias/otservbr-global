local config = {
    [57601] = Position(1100, 930, 7),
    [57602] = Position(1269, 921, 7),
    [57603] = Position(1260, 939, 7),
    [57604] = Position(1231, 977, 7),
}

local boat = Action()

function boat.onUse(player, item, fromPosition, itemEx, toPosition)
    for actionId, destination in pairs(config) do
        if item.actionid == actionId then
            player:teleportTo(destination)
            destination:sendMagicEffect(CONST_ME_POFF)
            fromPosition:sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end
end

boat:aid(57601, 57602, 57603, 57604)
boat:register()
