---------------------------------------------------------------------------------------------------
-- func: !despot
-- desc: Teleports the player to the room near Faust's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-0.1810, -41.2010, -320.0249, 193, 130)
end
