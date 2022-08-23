-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Kirin
-----------------------------------
require("modules/module_utils")
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
-----------------------------------
local m = Module:new("kirin")

local mobToReplaceName = "Kirin"

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMod(xi.mod.WIND_MEVA, -64)
    mob:setMod(xi.mod.SILENCERES, 35)
    mob:setMod(xi.mod.PETRIFYRES, 85)
    mob:setMod(xi.mod.STUNRES, 85)
    mob:setMod(xi.mod.BINDRES, 35)
    mob:setMod(xi.mod.GRAVITYRES, 35)
    -- mob:setMod(xi.mod.HPP, 300)
    mob:setMod(xi.mod.DMGPHYS, -25)
    mob:setMod(xi.mod.DMGRANGE, -25)
    mob:setMod(xi.mod.DMGMAGIC, -30)
--  mob:addMod(xi.mod.ACC, 500)
--  mob:addMod(xi.mod.EVA, 100)
    mob:addMod(xi.mod.MACC, 500)
--  mob:addMod(xi.mod.MEVA, 300)
--  mob:addMod(xi.mod.MDEF, 15)
    -- mob:addMod(xi.mod.EARTHATT, 500)
    -- mob:addMod(xi.mod.EARTHACC, 1000)
    mob:addMod(xi.mod.MATT, 100)
    -- mob:addStatusEffect(xi.effect.REGEN, 500, 3, 0)
    mob:addMod(xi.mod.REFRESH, 25)
    mob:setLocalVar("numAdds", 90) -- Based off Kirin's HPP now. Spawns first "pet" at 90% HP
    
    mob:setHP(999999999)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    -- Spawn gods as pets
    local numAdds = mob:getLocalVar("numAdds")
    if (mob:getHPP() <= numAdds) then
        local godsRemaining = {}
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining,i)
            end
        end
        if (#godsRemaining > 0) then
            local g = godsRemaining[math.random(#godsRemaining)]
            local god = SpawnMob(ID.mob.KIRIN + g)
            god:updateEnmity(target)
            mob:setLocalVar("add"..g, 1)
            mob:setLocalVar("numAdds", numAdds - 10)
            
            local godName = god:getName()
            if (godName == 'Byakko') then
                god:setPos(mob:getXPos() - 5, mob:getYPos(), mob:getZPos())
            elseif (godName == 'Genbu') then
                god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() + 5)
            elseif (godName == 'Seiryu') then
                god:setPos(mob:getXPos() + 5, mob:getYPos(), mob:getZPos())
            elseif (godName == 'Suzaku') then
                god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() - 5)
            elseif (godName == 'Kirins_Avatar') then
                god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() - 3)
            end
        end
    end

    -- Ensure all spawned pets are doing stuff
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        local god = GetMobByID(i)
        if (god:getCurrentAction() == xi.act.ROAMING) then
            god:updateEnmity(target)
        end
    end
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    params = {}
    params.power = 75
    params.chance = 100

    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENSTONE)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Kirin")
    local playerName = player:getName()
    local mobName = mob:getName()
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_Kirin", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)

    player:addTitle( xi.title.KIRIN_CAPTIVATOR )
    player:addKeyItem( xi.ki.KIRINS_FERVOR )
    player:messageSpecial( ID.text.KEYITEM_OBTAINED, xi.ki.KIRINS_FERVOR )
    player:showText( mob, ID.text.KIRIN_OFFSET + 1 )
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDespawn", mobToReplaceName), function( mob )
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end)

return m
