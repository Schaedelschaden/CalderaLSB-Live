-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Amon
-- Mob ID: 17436918
-- !pos -30.7 -4.5 -20.5 161
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("Marquis_Amon")

local mobToReplaceName = "Marquis_Amon"

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

m:addOverride(string.format("xi.zones.Castle_Zvahl_Baileys.mobs.%s.onMobDespawn", mobToReplaceName), function( mob )
    -- Set Marquis_Amon's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random(75600, 86400))
end

return m
