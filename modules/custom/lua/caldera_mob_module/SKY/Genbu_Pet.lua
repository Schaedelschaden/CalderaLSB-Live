-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Genbu (Pet version)
-----------------------------------
require("scripts/globals/status");
require("modules/module_utils")
-----------------------------------

local m = Module:new("Genbu")

local mobToReplaceName = "Genbu"

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMod(xi.mod.SILENCERES, 35)
    mob:setMod(xi.mod.STUNRES, 35)
    mob:setMod(xi.mod.BINDRES, 35)
    mob:setMod(xi.mod.GRAVITYRES, 35)
    mob:setMod(xi.mod.DMGPHYS, -25)
    mob:setMod(xi.mod.DMGRANGE, -25)
    mob:setMod(xi.mod.DMGMAGIC, -30)
--  mob:addMod(xi.mod.ACC, 500)
--  mob:addMod(xi.mod.MACC, 500)
    mob:addMod(xi.mod.MATT, 150)
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    -- Link Kirin and other pet gods if aggro'd
--    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
--        local god = GetMobByID(i);
--        if (god:getCurrentAction() == xi.act.ROAMING) then
--            god:updateEnmity(target);
--        end
--    end

    local isBusy = false
    local has2Hrd = mob:getLocalVar("has2Hrd")
    local act = mob:getCurrentAction()
    
    if act == xi.act.MOBABILITY_START or act == xi.act.MOBABILITY_USING or act == xi.act.MOBABILITY_FINISH or act == xi.act.MAGIC_START or act == xi.act.MAGIC_CASTING or act == xi.act.MAGIC_START then
        isBusy = true -- Set to true if Seiryu is in any stage of using a mobskill or casting a spell
    end
    
    if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
        mob:useMobAbility(694)
        mob:setLocalVar("has2Hrd", 1)
    end
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMonsterMagicPrepare", mobToReplaceName), function(mob,target)
    if (mob:hasStatusEffect(xi.effect.INVINCIBLE,0) == false) then
        local rnd = math.random();
        if (rnd < 0.3) then
            return 203; -- Waterga V
        elseif (rnd < 0.4) then
            return 229; -- Poisonga V
        elseif (rnd < 0.6) then
            return 173; -- Water V
        elseif (rnd < 0.8) then
            return 215; -- Flood II
        else
            return 240; -- Drown
        end
    end
    return 0; -- Still need a return, so use 0 when not casting
end)

m:addOverride(string.format("xi.zones.The_Shrine_of_RuAvitau.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
end)

return m
