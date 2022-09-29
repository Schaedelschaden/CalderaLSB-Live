-----------------------------------
-- ID: 27556
-- Item: echad ring
-- Experience point bonus
-----------------------------------
-- Bonus: +150%
-- Duration: 720 min
-- Max bonus: 30000 exp
-----------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/item_utils")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.DEDICATION) then
        result = xi.msg.basic.ITEM_UNABLE_TO_USE_2
    end
    return result
end

item_object.onItemUse = function(target)
    local effect    = xi.effect.DEDICATION
    local power     = 150
    local duration  = 43200
    local subpower  = 30000

    xi.item_utils.addItemExpEffect(target, effect, power, duration, subpower)
end

return item_object
