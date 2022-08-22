---------------------------------------------------------------------------------------------------
-- func: !ulli
-- desc: Teleports the player to the room near Ullikummi's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(740, -99, -660, 190, 178)
end
