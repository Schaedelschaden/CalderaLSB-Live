-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Suzaku
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Suzaku")


local mobToReplaceName = "Suzaku"

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
--  mob:addMod(xi.mod.ACC, 500)
    mob:addMod(xi.mod.MACC, 500)
    mob:addMod(xi.mod.MATT, 100)
    mob:addMod(xi.mod.REFRESH, 25)
end)

-- Return the selected spell ID.
m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMonsterMagicPrepare", mobToReplaceName), function(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    local rnd = math.random()

    if rnd < 0.5 then
        return 176 -- firaga 3
    elseif rnd < 0.7 then
        return 147 -- fire 4
    elseif rnd < 0.9 then
        return 204 -- flare
    else
        return 235 -- burn
    end
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    local damage = 300

    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENFIRE)
end)

m:addOverride(string.format("xi.zones.RuAun_Gardens.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Suzaku")
    local playerName = player:getName()
    local mobName = mob:getName()
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_Suzaku", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)

    player:addKeyItem( xi.ki.SUZAKUS_BENEFACTION )
    player:messageSpecial( ID.text.KEYITEM_OBTAINED, xi.ki.SUZAKUS_BENEFACTION )
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 8)
end)

return m
