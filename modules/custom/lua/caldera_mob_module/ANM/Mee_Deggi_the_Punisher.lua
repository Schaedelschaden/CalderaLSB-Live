-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Mee Deggi the Punisher
-- Mob ID: 17395800
-- !pos -223 1 119 151
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Mee_Deggi_the_Punisher")

local mobToReplaceName = "Mee_Deggi_the_Punisher"

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
