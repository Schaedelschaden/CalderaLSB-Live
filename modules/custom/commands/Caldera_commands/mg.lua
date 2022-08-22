---------------------------------------------------------------------------------------------------
-- func: !mg
-- desc: Teleports the player to the room near Mother Globe's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(859.8726, -99.6000, -660.1444, 191, 178)
end
