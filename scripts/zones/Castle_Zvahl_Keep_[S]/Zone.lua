-----------------------------------
-- Zone: Castle_Zvahl_Keep_[S] (155)
-----------------------------------
local ID = require('scripts/zones/Castle_Zvahl_Keep_[S]/IDs')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-555.996, -71.691, 60, 255)
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
