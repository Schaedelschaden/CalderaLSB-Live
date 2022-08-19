---------------------------------------------------------------------------------------------------
-- func: !faust
-- desc: Teleports the player to the room near Faust's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(740, 0, -20, 62, 178)
end
