-----------------------------------
-- Ability: Majesty
-- Description: Increases Cure potency and reduces Cure recast time. Additionally, causes Cure and Protect spells to affect party members in area of effect.
-- Obtained: PLD Level 70
-- Recast Time: 00:01:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/job_utils/paladin")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    xi.job_utils.paladin.useMajesty(player, target, ability)
end

return ability_object
