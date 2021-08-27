-----------------------------------
-- ID: 15838
-- Item: Protect Earring
-- Item Effect: Protect
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    local power = 20
    local tier = 1
    local buff = 0
    if target:getMod(xi.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
        buff = 2 -- 2x Tier from MOD
    end

    power = power + (buff * tier)

    if (target:addStatusEffect(xi.effect.PROTECT, power, 0, 1800, 0, 0, tier)) then
        target:messageBasic(xi.msg.basic.GAINS_EFFECT_OF_STATUS, xi.effect.PROTECT)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return item_object
