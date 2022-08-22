---------------------------------------------------------------------------------------------------
-- func: !ixdrg2
-- desc: Teleports the player to the Ix'DRG's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-333, 4, -506, 34, 35)
end
