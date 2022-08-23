-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Seiryu
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Seiryu")


local mobToReplaceName = "Seiryu"

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
--  mob:addMod(xi.mod.ACC, 500)
    mob:addMod(xi.mod.MACC, 500)
    mob:addMod(xi.mod.MATT, 50)
    mob:addMod(xi.mod.REFRESH, 25)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMonsterMagicPrepare", mobToReplaceName), function(mob, target)
    if not mob:hasStatusEffect(xi.effect.HUNDRED_FISTS, 0) then
        local rnd = math.random()
        if rnd < 0.5 then
            return 186 -- aeroga 3
        elseif rnd < 0.7 then
            return 157 -- aero 4
        elseif rnd < 0.9 then
            return 208 -- tornado
        else
            return 237 -- choke
        end
    end
    return 0 -- Still need a return, so use 0 when not casting
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    local damage = 300

    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENAERO)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Seiryu")
    local playerName = player:getName()
    local mobName = mob:getName()
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_Seiryu", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)

    player:addKeyItem(xi.ki.SEIRYUS_NOBILITY)
    player:messageSpecial( ID.text.KEYITEM_OBTAINED, xi.ki.SEIRYUS_NOBILITY )
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 10)
end)

return m
