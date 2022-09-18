-----------------------------------
-- Area: Beadeaux (147)
--   NM: Da'Dha Hundredmask
-- Mob ID: 17379427
-- !pos -184 1 -136 147
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------
local m = Module:new("BiGho_Headtaker")

local mobToReplaceName = "BiGho_Headtaker"

m:addOverride(string.format("xi.zones.Beadeaux.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 241)
    
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    local shortName = mobName:sub(1, 18)
    local KillCounter = player:getCharVar("KillCounter_"..shortName)
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_"..shortName, KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
