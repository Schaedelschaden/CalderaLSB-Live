---------------------------------------------------------------------------------------------------
-- func: !sc
-- desc: Teleports the player to Steam Cleaner's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(346.4950, 0.0000, 339.6586, 127, 177)
end
