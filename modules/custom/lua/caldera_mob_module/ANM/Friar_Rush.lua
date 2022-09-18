------------------------------
-- Area: Den of Rancor (160)
--   NM: Friar Rush
-- Mob ID: 17432640
-- !pos -86 16 2 160
------------------------------
require("scripts/globals/hunts")
require("modules/module_utils")
-----------------------------------
local m = Module:new("Friar_Rush")

local mobToReplaceName = "Friar_Rush"

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
 
    xi.hunts.checkHunt(mob, player, 394)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
