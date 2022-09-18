-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Andrealphus
-- Mob ID: 17436966
-- !pos 20.7 -24 19.5 161
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("Marquis_Andrealphus")

local mobToReplaceName = "Marquis_Andrealphus"

m:addOverride(string.format("xi.zones.Castle_Zvahl_Baileys.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
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
