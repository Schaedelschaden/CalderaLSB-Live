-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--   NM: Jailer of Temperance
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/globals")
require("scripts/globals/status")
require("scripts/globals/magic")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Jailer_of_Temperance")


local mobToReplaceName = "Jailer_of_Temperance"

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    -- Set AnimationSub to 0, put it in pot form
    -- Change it's damage resists. Pot for take

    -- Change animation to pot
    mob:setAnimationSub(0)
    -- Set the damage resists
    mob:setMod(xi.mod.HTH_SDT, 1000)
    mob:setMod(xi.mod.SLASH_SDT, 0)
    mob:setMod(xi.mod.PIERCE_SDT, 0)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:addMod(xi.mod.EVA, math.random(100, 200))
    -- Set the magic resists. It always takes no damage from direct magic
    for n =1, #xi.magic.resistMod, 1 do
        mob:setMod(xi.magic.resistMod[n], 0)
    end
    for n =1, #xi.magic.specificDmgTakenMod, 1 do
        mob:setMod(xi.magic.specificDmgTakenMod[n], 10000)
    end
end)

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    -- Forms: 0 = Pot (Blunt/H2H only) 1 = Pot (Blunt/H2H only) 2 = Poles (Piercing Only) 3 = Rings (Slashing only)
    local PotAbilities = {1463, 1465} -- Reactor Cool, Optic Induration
    local PolesAbilities = {1463, 1466, 1467} -- Reactor Cool, Static Filament, Decayed Filament
    local RingsAbilities = {1463, 1468, 1469} -- Reactor Cool, Reactor Overload, Reactor Overheat
    
    local randomTime = math.random(30, 180)
    local changeTime = mob:getLocalVar("changeTime")
    local twoHours = mob:getLocalVar("2hrs")
    local isBusy = false
    
    if act == xi.act.MOBABILITY_START or act == xi.act.MOBABILITY_USING or act == xi.act.MOBABILITY_FINISH or act == xi.act.MAGIC_START
       or act == xi.act.MAGIC_CASTING or act == xi.act.MAGIC_START then
        isBusy = true -- Set to true if mob is in any stage of using a mobskill or casting a spell
    end

    -- If we're in a pot form, but going to change to either Rings/Poles
    if ((mob:getAnimationSub() == 0 or mob:getAnimationSub() == 1) and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(2, 3)
        mob:setAnimationSub(aniChange)

        -- We changed to Poles. Make it only take piercing.
        if (aniChange == 2) then
            mob:setMod(xi.mod.HTH_SDT, 0)
            mob:setMod(xi.mod.SLASH_SDT, 0)
            mob:setMod(xi.mod.PIERCE_SDT, 1000)
            mob:setMod(xi.mod.IMPACT_SDT, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        else -- We changed to Rings. Make it only take slashing.
            mob:setMod(xi.mod.HTH_SDT, 0)
            mob:setMod(xi.mod.SLASH_SDT, 1000)
            mob:setMod(xi.mod.PIERCE_SDT, 0)
            mob:setMod(xi.mod.IMPACT_SDT, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    -- We're in poles, but changing
    elseif (mob:getAnimationSub() == 2 and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(0, 1)

        -- Changing to Pot, only take Blunt damage
        if (aniChange == 0) then
            mob:setAnimationSub(0)
            mob:setMod(xi.mod.HTH_SDT, 1000)
            mob:setMod(xi.mod.SLASH_SDT, 0)
            mob:setMod(xi.mod.PIERCE_SDT, 0)
            mob:setMod(xi.mod.IMPACT_SDT, 1000)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        else -- Going to Rings, only take slashing
            mob:setAnimationSub(3)
            mob:setMod(xi.mod.HTH_SDT, 0)
            mob:setMod(xi.mod.SLASH_SDT, 1000)
            mob:setMod(xi.mod.PIERCE_SDT, 0)
            mob:setMod(xi.mod.IMPACT_SDT, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    -- We're in rings, but going to change to pot or poles
    elseif (mob:getAnimationSub() == 3 and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(0, 2)
        mob:setAnimationSub(aniChange)

        -- We're changing to pot form, only take blunt damage.
        if (aniChange == 0 or aniChange == 1) then
            mob:setMod(xi.mod.HTH_SDT, 1000)
            mob:setMod(xi.mod.SLASH_SDT, 0)
            mob:setMod(xi.mod.PIERCE_SDT, 0)
            mob:setMod(xi.mod.IMPACT_SDT, 1000)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        else -- Changing to poles, only take piercing
            mob:setMod(xi.mod.HTH_SDT, 0)
            mob:setMod(xi.mod.SLASH_SDT, 0)
            mob:setMod(xi.mod.PIERCE_SDT, 1000)
            mob:setMod(xi.mod.IMPACT_SDT, 0)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    end
    
    if (mob:getHPP() <= 80 and twoHours == 0) then
        mob:useMobAbility(730)
        mob:setLocalVar("2hrs", 1)
    elseif (mob:getHPP() <= 60 and twoHours == 1) then
        mob:useMobAbility(730)
        mob:setLocalVar("2hrs", 2)
    elseif (mob:getHPP() <= 40 and twoHours == 2) then
        mob:useMobAbility(730)
        mob:setLocalVar("2hrs", 3)
    elseif (mob:getHPP() <= 20 and twoHours == 3) then
        mob:useMobAbility(730)
        mob:setLocalVar("2hrs", 4)
    end
    
    if (isBusy == false and mob:hasStatusEffect(xi.effect.MEIKYO_SHISUI)) then      
        -- Forms: 0 = Pot (Blunt/H2H only) 1 = Pot (Blunt/H2H only) 2 = Poles (Piercing Only) 3 = Rings (Slashing only)
        if (mob:getAnimationSub() == 0 or mob:getAnimationSub() == 1) then
            mob:useMobAbility(PotAbilities[math.random(#PotAbilities)])
            mob:useMobAbility(PotAbilities[math.random(#PotAbilities)])
            mob:useMobAbility(PotAbilities[math.random(#PotAbilities)])
            mob:delStatusEffect(xi.effect.MEIKYO_SHISUI)
        elseif (mob:getAnimationSub() == 2) then
            mob:useMobAbility(PolesAbilities[math.random(#PolesAbilities)])
            mob:useMobAbility(PolesAbilities[math.random(#PolesAbilities)])
            mob:useMobAbility(PolesAbilities[math.random(#PolesAbilities)])
            mob:delStatusEffect(xi.effect.MEIKYO_SHISUI)
        elseif (mob:getAnimationSub() == 3) then
            mob:useMobAbility(RingsAbilities[math.random(#RingsAbilities)])
            mob:useMobAbility(RingsAbilities[math.random(#RingsAbilities)])
            mob:useMobAbility(RingsAbilities[math.random(#RingsAbilities)])
            mob:delStatusEffect(xi.effect.MEIKYO_SHISUI)
        end
    end
end)

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_JailOfTemp")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_JailOfTemp", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    local ph = mob:getLocalVar("ph")
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(ph, false)
    GetMobByID(ph):setRespawnTime(GetMobRespawnTime(ph))
    mob:setLocalVar("pop", os.time() + 900) -- 15 mins
    huxzoiGlobal.pickTemperancePH()
end)

return m
