-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Naberius
-- Mob ID: 17436876
-- !pos 80 -8 160 161
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------
local m = Module:new("Marquis_Naberius")

local mobToReplaceName = "Marquis_Naberius"

m:addOverride(string.format("xi.zones.Castle_Zvahl_Baileys.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

m:addOverride(string.format("xi.zones.Castle_Zvahl_Baileys.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENAERO)
end

m:addOverride(string.format("xi.zones.Castle_Zvahl_Baileys.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 350)
    
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
    -- mob:setRespawnTime(math.random(3600, 7200)) -- 1 to 2 hours
end

return m
