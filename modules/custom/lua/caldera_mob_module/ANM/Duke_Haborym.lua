-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Duke Haborym
-- Mob ID: 17436923
-- !pos -93 -4.5 35 161
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("Duke_Haborym")

local mobToReplaceName = "Duke_Haborym"

m:addOverride(string.format("xi.zones.Castle_Zvahl_Baileys.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMobLevel(115)
end

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

m:addOverride(string.format("xi.zones.Castle_Zvahl_Baileys.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    -- Set Duke_Haborym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random(75600, 86400))
end

return m
