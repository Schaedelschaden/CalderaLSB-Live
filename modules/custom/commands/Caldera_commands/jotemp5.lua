---------------------------------------------------------------------------------------------------
-- func: !jotemp5
-- desc: Teleports the player to the Jailer of Temperance's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-783, 0, 459, 130, 34)
end
