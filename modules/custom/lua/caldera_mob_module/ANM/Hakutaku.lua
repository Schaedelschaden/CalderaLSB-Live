-----------------------------------
-- Area: Den of Rancor (160)
--  Mob: Hakutaku
-- Mob ID: 17433005
-- !pos 24 25 -306 160
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("Hakutaku")

local mobToReplaceName = "Hakutaku"

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
 
    local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
