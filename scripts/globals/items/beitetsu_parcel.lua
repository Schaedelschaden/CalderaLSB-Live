-----------------------------------
-- ID: 6181
-- Beitetsu Parcel
-- Breaks up a Beitetsu Parcel
-----------------------------------
require('scripts/globals/items')
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = xi.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

item_object.onItemUse = function(target)
    target:addItem(xi.items.BEITETSU, math.random(3, 15))
end

return item_object
