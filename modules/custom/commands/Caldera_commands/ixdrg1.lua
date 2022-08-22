---------------------------------------------------------------------------------------------------
-- func: !ixdrg1
-- desc: Teleports the player to the Ix'DRG's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-334, 4, -374, 224, 35)
end
