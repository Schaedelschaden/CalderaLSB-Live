---------------------------------------------------------------------------------------------------
-- func: !av
-- desc: Teleports the player to Absolute Virtue's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(469, 0, -576, 99, 33)
end