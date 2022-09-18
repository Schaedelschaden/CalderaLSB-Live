-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Yaa Haqa the Profane
-- Mob ID: 17395954
-- !pos -28 -15 -136 151
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Yaa_Haqa_the_Profane")

local mobToReplaceName = "Yaa_Haqa_the_Profane"

m:addOverride(string.format("xi.zones.Castle_Oztroja.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
   
    xi.hunts.checkHunt(mob, player, 305)
    
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
