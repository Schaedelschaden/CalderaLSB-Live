-----------------------------------
-- Area: Beadeaux (147)
--   NM: Bi'Gho Headtaker
-- Mob ID: 17379351
-- !pos -97 1 78 147
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
require("modules/module_utils")
-----------------------------------
local m = Module:new("BiGho_Headtaker")

local mobToReplaceName = "BiGho_Headtaker"

m:addOverride(string.format("xi.zones.Beadeaux.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 239)
    
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
