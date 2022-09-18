-----------------------------------
-- Area: Davoi (149)
--   NM: Poisonhand Gnadgad
-- Mob ID: 17387644
-- !pos -60 -0.5 41.9 149
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Poisonhand_Gnadgad")

local mobToReplaceName = "Poisonhand_Gnadgad"

m:addOverride(string.format("xi.zones.Davoi.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 195)
    
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
