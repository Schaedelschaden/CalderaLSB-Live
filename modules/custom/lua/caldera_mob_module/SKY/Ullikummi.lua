-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- Mob: Ullikummi
-- Pos: 740.0909, -99.4242, -580.0308, 205, 178
-- Force spawned using Diorite (ID: 2388)
-----------------------------------
-- Ullikummi exclusively uses Heavy Strike on a regular basis.
require("scripts/globals/status")
require("modules/module_utils")

local m = Module:new("Ullikummi")

local mobToReplaceName = "Ullikummi"

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMod(xi.mod.REFRESH, 10)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    local isBusy = false
    local act = mob:getCurrentAction()
    
    if act == xi.act.MOBABILITY_START or act == xi.act.MOBABILITY_USING or act == xi.act.MOBABILITY_FINISH then -- or act == xi.act.MAGIC_START or act == xi.act.MAGIC_CASTING or act == xi.act.MAGIC_START
        isBusy = true -- Set to true if Ullikummi is in any stage of using a mobskill or casting a spell
    end
    
    if (mob:getBattleTime() > 30 and mob:getBattleTime() % 15 == 0 and isBusy == false) then
        mob:useMobAbility(675)
    end
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobWeaponSkill", mobToReplaceName), function(target, mob, skill)
    
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Ullikummi")
    local playerName = player:getName()
    local mobName = mob:getName()
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_Ullikummi", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDespawn", mobToReplaceName), function( mob )
    
end)

return m
