-----------------------------------
-- Area: Davoi (149)
--   NM: Blubbery Bulge
-- Mob ID: 17387920
-- !pos -225.2 2.3 -294.7 149
-- Involved in Quest: The Miraculous Dale
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Blubbery_Bulge")

local mobToReplaceName = "Blubbery_Bulge"

m:addOverride(string.format("xi.zones.Davoi.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 196)
    
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    local shortName = mobName:sub(1, 18)
    local KillCounter = player:getCharVar("KillCounter_"..shortName)
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_"..shortName, KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    
end

return m
