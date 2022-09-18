-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Baron Vapula
-- Mob ID: 17440963
-- !pos -241 -52 84 162
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------
local m = Module:new("Baron_Vapula")

local mobToReplaceName = "Baron_Vapula"

m:addOverride(string.format("xi.zones.Castle_Zvahl_Keep.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 354)
    player:addTitle(xi.title.HELLSBANE)
    
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
