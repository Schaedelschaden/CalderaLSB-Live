---------------------------------------------------------------------------------------------------
-- func: !jotemp4
-- desc: Teleports the player to the Jailer of Temperance's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-579, 0, 55, 65, 34)
end
