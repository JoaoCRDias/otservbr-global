local messages = {
	"Reporte bugs (Ctrl + Z) e receba uma recompensa de acordo com o bug reportado!",
	"Acesso o discord oficial do servidor atraves do link https://discord.gg/ny9r3bBSXX"
}

local infoSystem = GlobalEvent("globalAnnouncer")
function infoSystem.onThink(interval, lastExecution)
		local randomMessage = messages[math.random(#messages)]
    Game.broadcastMessage('[Info System] ' .. randomMessage, MESSAGE_EVENT_ADVANCE)
		Spdlog.info("[InfoSystem]: \"" .. randomMessage .. "\"")
    return true
end

infoSystem:interval(10 * 60 * 1000)
infoSystem:register()
