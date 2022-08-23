-----------------------------------
-- Area: VeLugannon Palace
-- NM: Brigandish Blade
-----------------------------------
local ID = require("scripts/zones/VeLugannon_Palace/IDs")
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Brigandish_Blade")


local mobToReplaceName = "Brigandish_Blade"

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.TERROR, {chance = 30, duration = math.random(3,5)})
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    GetNPCByID(ID.npc.QM3):setLocalVar("PillarCharged", 1)
    
    local KillCounter = player:getCharVar("KillCounter_BrigandishBlade")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_BrigandishBlade", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

return m
