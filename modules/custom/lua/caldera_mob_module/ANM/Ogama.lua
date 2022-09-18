------------------------------
-- Area: Den of Rancor (160)
--   NM: Ogama
-- Mob ID: 17432974
-- !pos -32 36 -369.7 160
------------------------------
require("scripts/globals/hunts")
require("modules/module_utils")
-----------------------------------
local m = Module:new("Ogama")

local mobToReplaceName = "Ogama"

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 398)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
