---------------------------------------------------------------------------------------------------
-- func: !jojust
-- desc: desc: Teleports the player to the Jailer of Justice's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-285, 0, -455, 32, 33)
end
