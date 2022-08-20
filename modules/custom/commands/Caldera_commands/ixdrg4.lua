---------------------------------------------------------------------------------------------------
-- func: !ixdrg4
-- desc: Teleports the player to the Ix'DRG's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-506, 4, -373, 160, 35)
end
