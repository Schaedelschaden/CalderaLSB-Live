-----------------------------------
-- Area: Cloister of Tremors
--  Mob: Titan Prime
-- Involved in Mission: ASA-4 Sugar Coated Directive
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    -- ASA-4: Avatar is Unkillable Until Its Used Astral Flow At Least 5 times At Specified Intervals
    mob:setLocalVar("astralflows", 0)
    mob:setUnkillable(true)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
end

entity.onMobFight = function(mob, target)
    -- ASA-4: Astral Flow Behavior - Guaranteed to Use At Least 5 times before killable, at specified intervals.
    local astralFlows = mob:getLocalVar("astralflows")
    if mob:getCurrentAction() == xi.act.ATTACK then
        if (astralFlows == 0 and mob:getHPP() <= 80)
        or (astralFlows == 1 and mob:getHPP() <= 60)
        or (astralFlows == 2 and mob:getHPP() <= 40)
        or (astralFlows == 3 and mob:getHPP() <= 20)
        or (astralFlows == 4 and mob:getHPP() <= 1) then
            mob:setLocalVar("astralflows", astralFlows + 1)
            mob:useMobAbility(857)
        end
    end

    if astralFlows >= 5 and mob:canUseAbilities() then
        mob:setUnkillable(false)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
