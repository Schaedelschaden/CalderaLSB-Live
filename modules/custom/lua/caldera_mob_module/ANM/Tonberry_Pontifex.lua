-----------------------------------
-- Area: Den of Rancor (160)
--   NM: Tonberry Pontifex
-- Mob ID: 17433003
-- !pos -209.5 11.9 -95.7 160
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("scripts/globals/regimes")
require("modules/module_utils")
-----------------------------------
local m = Module:new("Tonberry_Pontifex")

local mobToReplaceName = "Tonberry_Pontifex"

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
	mob:setMod(xi.mod.MATT, 0)
end

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 798, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 799, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 800, 2, xi.regime.type.GROUNDS)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobDespawn", mobToReplaceName), function( mob )
    -- mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end

return m
