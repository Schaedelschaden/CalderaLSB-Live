-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Byakko
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
require("modules/module_utils")

-----------------------------------

local m = Module:new("Byakko")


local mobToReplaceName = "Byakko"

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
--  mob:addMod(xi.mod.ACC, 500)
    mob:addMod(xi.mod.MACC, 500)
    mob:addMod(xi.mod.MATT, 50)
    mob:addMod(xi.mod.REFRESH, 25)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    local damage = 300
    
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENLIGHT)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Byakko")
    local playerName = player:getName()
    local mobName = mob:getName()
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_Byakko", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)

    player:addKeyItem( xi.ki.BYAKKOS_PRIDE )
    player:messageSpecial( ID.text.KEYITEM_OBTAINED, xi.ki.BYAKKOS_PRIDE )
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 12)
end)

return m
