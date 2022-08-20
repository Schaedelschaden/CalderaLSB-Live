---------------------------------------------------------------------------------------------------
-- func: !joprud
-- desc: Teleports the player to the Jailer of Prudence's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(700, 0, 9, 208, 33)
end
