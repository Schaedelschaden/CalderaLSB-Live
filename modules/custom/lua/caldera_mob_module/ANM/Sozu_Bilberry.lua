-----------------------------------
-- Area: Den of Rancor (160)
--   NM: Sozu Bilberry
-- Mob ID: 17432609
-- !pos 98.8 16.8 -40.7 160
-----------------------------------
require("scripts/globals/hunts")
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Sozu_Bilberry")

local mobToReplaceName = "Sozu_Bilberry"

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = xi.jsa.MANAFONT, hpp = math.random(40, 95)},
        },
    })
end

m:addOverride(string.format("xi.zones.Den_of_Rancor.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 393)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
