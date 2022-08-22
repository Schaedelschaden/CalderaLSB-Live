---------------------------------------------------------------------------------------------------
-- func: !johope
-- desc: Teleports the player to the Jailer of Hope's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-682, 0, -63, 131, 33)
end
