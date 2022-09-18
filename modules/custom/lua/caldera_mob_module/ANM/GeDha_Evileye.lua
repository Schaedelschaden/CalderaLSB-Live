-----------------------------------
-- Area: Beadeaux (147)
--   NM: Ge'Dha Evileye
-- Mob ID: 17379450
-- !pos -242.8 1 -198 147
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
require("modules/module_utils")
-----------------------------------
local m = Module:new("GeDha_Evileye")

local mobToReplaceName = "GeDha_Evileye"

m:addOverride(string.format("xi.zones.Beadeaux.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 240)
    
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
