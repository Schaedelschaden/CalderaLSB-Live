-----------------------------------
-- Area: Davoi (149)
--   NM: Tigerbane Bakdak
-- Mob ID: 17387606
-- !pos 174 2 -20 149
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Tigerbane_Bakdak")

local mobToReplaceName = "Tigerbane_Bakdak"

m:addOverride(string.format("xi.zones.Davoi.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 193)
    
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
