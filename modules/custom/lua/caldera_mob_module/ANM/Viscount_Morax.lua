-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Viscount Morax 
-- Mob ID: 17440975
-- !pos -380 -52 -121 162
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("modules/module_utils")
-----------------------------------
local m = Module:new("Viscount_Morax")

local mobToReplaceName = "Viscount_Morax"

m:addOverride(string.format("xi.zones.Castle_Zvahl_Keep.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 356)
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
