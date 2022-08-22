---------------------------------------------------------------------------------------------------
-- func: !seiryu
-- desc: Teleports the player to Seiryu's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(567, -70, -80, 33, 130)
end
