---------------------------------------------------------------------------------------------------
-- func: !jotemp1
-- desc: Teleports the player to the Jailer of Temperance's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-420, 0, 744, 194, 34)
end
