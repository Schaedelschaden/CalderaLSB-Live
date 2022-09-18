-----------------------------------
-- Area: Davoi (149)
--   NM: Hawkeyed Dnatbat
-- Mob ID: 17387567
-- !pos 333.9 -0.6 -144.5 149
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Hawkeyed_Dnatbat")

local mobToReplaceName = "Hawkeyed_Dnatbat"

m:addOverride(string.format("xi.zones.Davoi.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 192)
    
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
