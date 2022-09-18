-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Grand Duke Batym
-- Mob ID: 17436927
-- !pos -78 -4 -15 161
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------
local m = Module:new("Grand_Duke_Batym")

local mobToReplaceName = "Grand_Duke_Batym"

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
    -- Set Grand_Duke_Batym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random(75600, 86400))
end

return m
