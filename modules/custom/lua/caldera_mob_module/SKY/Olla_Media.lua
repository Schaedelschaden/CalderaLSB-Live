-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Olla Media
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/settings")
require("modules/module_utils")

local m = Module:new("Olla_Media")

local mobToReplaceName = "Olla_Media"


m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMod(xi.mod.REFRESH, 10)
    mob:setMod(xi.mod.REGAIN, 300)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    if (isKiller) then
        SpawnMob(mob:getID() + 1):updateClaim(player)
    end
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDespawn", mobToReplaceName), function( mob )
    if (not GetMobByID(mob:getID() + 1):isSpawned()) then -- if this Media despawns and Grande is not alive, it would be because it despawned outside of being killed.
        GetNPCByID(ID.npc.OLLAS_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
    end
end)

return m
