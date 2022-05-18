local aol = TalkAction("!food")

function aol.onSay(player, words, param)
    if player:removeMoneyBank(1000) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        player:addItem(3725, 100)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought 100 brown mushroom for 1K!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

aol:register()
