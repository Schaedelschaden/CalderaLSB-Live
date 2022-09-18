------------------------------
-- Area: Upper Delkfutts Tower (158)
--   NM: Ixtab
-- Mob ID: 17424512
-- !pos -360 -175.5 78 158
------------------------------
require("scripts/globals/hunts")
require("modules/module_utils")
-----------------------------------
local m = Module:new("Ixtab")

local mobToReplaceName = "Ixtab"

m:addOverride(string.format("xi.zones.Upper_Delkfutts_Tower.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
 
    xi.hunts.checkHunt(mob, player, 332)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
