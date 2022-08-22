---------------------------------------------------------------------------------------------------
-- func: !jolove
-- desc: desc: Teleports the player to the Jailer of Love's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(435, 0, -599, 89, 33)
end
