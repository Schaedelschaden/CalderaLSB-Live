---------------------------------------------------------------------------------------------------
-- func: !holla
-- desc: Teleports the player to the Crag of Holla
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    -- Teleport target
    -- if (player:getHP() == player:getMaxHP()) then
    local zoneId = player:getZoneID()

    if (zoneId == 255 or zoneId == 146 or zoneId == 6 or zoneId == 8 or zoneId == 207 or zoneId == 203 or zoneId == 201 or zoneId == 202 or zoneId == 211 or
        zoneId == 209 or zoneId == 36 or zoneId == 170 or zoneId == 139 or zoneId == 180 or zoneId == 31 or zoneId == 206 or zoneId == 277 or zoneId == 163 or
        zoneId == 32 or zoneId == 179 or zoneId == 10 or zoneId == 165 or zoneId == 156 or zoneId == 144) then
        player:PrintToPlayer(string.format("That command cannot be used in this zone. Please exit the area and try again."),xi.msg.channel.SYSTEM_3)
        return
    else
        player:setPos(420, 19, 20, 0, 102)
    end
    -- else
        -- player:PrintToPlayer(string.format("You must be at full HP to use that command!"),xi.msg.channel.SYSTEM_3)
    -- end
end
