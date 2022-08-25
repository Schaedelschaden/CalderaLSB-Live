-----------------------------------
-- Area: The Garden of Ru'Hmet
--  Mob: Kf'ghrah WHM
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic") -- no spells are currently set due to lack of info
require("modules/module_utils")
-----------------------------------

local m = Module:new("Kfghrah_WHM")


local mobToReplaceName = "Kfghrah_WHM"

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    -- Set core Skin and mob elemental bonus
    mob:AnimationSub(0)
    mob:setLocalVar("roamTime", os.time())
    mob:setModelId(1167) -- light
    
    mob:addMod(xi.mod.DEF, math.random(375, 525))
    mob:addMod(xi.mod.MDEF, math.random(35, 55))
    mob:addMod(xi.mod.EVA, math.random(325, 550))
    mob:addMod(xi.mod.MACC, math.random(700, 850))
    mob:addMod(xi.mod.REFRESH, 15)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobRoam", mobToReplaceName), function(mob)
    local roamTime = mob:getLocalVar("roamTime")
    local roamForm
    if (os.time() - roamTime > 60) then
        roamForm = math.random(1, 3) -- forms 2 and 3 are spider and bird; can change forms at will
        if (roamForm == 1) then
            roamForm = 0 -- We don't want form 1 as that's humanoid - make it 0 for ball
        end
        mob:AnimationSub(roamForm)
        mob:setLocalVar("roamTime", os.time())
    end
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    local changeTime = mob:getLocalVar("changeTime")
    local battleForm

    if (mob:getBattleTime() - changeTime > 60) then
        battleForm = math.random(1, 3) -- same deal as above
        if (battleForm == 1) then
            battleForm = 0
        end
        mob:AnimationSub(battleForm)
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
end)

return m
