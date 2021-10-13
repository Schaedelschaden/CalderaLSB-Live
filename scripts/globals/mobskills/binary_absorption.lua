-----------------------------------
-- Binary Absorption
-- Steals hp
-- Type: Magical
-- Utsusemi/Blink absorb: 1 Shadows
-- Range: Melee
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/settings/main")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    -- time to drain HP. 100-200
    local power = math.random(0, 101) + 100
    local dmg = MobFinalAdjustments(power, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.NUMSHADOWS_1)

        skill:setMsg(MobPhysicalDrainMove(mob, target, skill, xi.mobskills.drainType.HP, dmg))

    return dmg
end

return mobskill_object
