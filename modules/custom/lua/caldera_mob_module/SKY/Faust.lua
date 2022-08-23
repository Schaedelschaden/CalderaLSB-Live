-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- Mob: Faust
-- Pos: 740 0 -100 178
-----------------------------------
-- Faust will use Typhoon 2-3 times in a row every 30s regardless of his TP.
require("modules/module_utils")

local m = Module:new("Faust")

local mobToReplaceName = "Faust"


m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:addMod(xi.mod.ATT, 500)
    mob:setMobMod(xi.mobMod.TP_USE_CHANCE, 1000)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    if (mob:getBattleTime() > 0 and mob:getBattleTime() % 30 == 0) then
        mob:useMobAbility(539)
    end
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobWeaponSkill", mobToReplaceName), function(target, mob, skill)
    
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Faust")
    local playerName = player:getName()
    local mobName = mob:getName()
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_Faust", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDespawn", mobToReplaceName), function( mob )
    mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end)

return m
