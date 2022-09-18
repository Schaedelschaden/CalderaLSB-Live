-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Quu Domi the Gallant
-- Mob ID: 17395870
-- !pos 58 1 -120 151
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Quu_Domi_the_Gallant")

local mobToReplaceName = "Quu_Domi_the_Gallant"

m:addOverride(string.format("xi.zones.Castle_Oztroja.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    
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
