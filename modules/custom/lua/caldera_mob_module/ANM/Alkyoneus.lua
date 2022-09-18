-----------------------------------
-- Area: Upper Delkfutt's Tower (158)
--   NM: Alkyoneus
-- Mob ID: 17424480
-- !pos -300 -175 22 158
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Alkyoneus")

local mobToReplaceName = "Alkyoneus"

m:addOverride(string.format("xi.zones.Upper_Delkfutts_Tower.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
	mob:setMobMod(xi.mobMod.NO_DESPAWN, 1)
	mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 86400)
end

m:addOverride(string.format("xi.zones.Upper_Delkfutts_Tower.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
