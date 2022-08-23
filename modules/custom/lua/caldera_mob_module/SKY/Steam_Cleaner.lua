-----------------------------------
-- Area: Ve'Lugannon Palace
-- NM: Steam Cleaner
-- Pos: 317 -1 361 177
require("modules/module_utils")
-----------------------------------

local m = Module:new("Steam_Cleaner")


local mobToReplaceName = "Steam_Cleaner"

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMod(xi.mod.REFRESH, 10)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.TP_DRAIN, {chance = 100, power = math.random(50, 120)})
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_SteamCleaner")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_SteamCleaner", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end)

return m
