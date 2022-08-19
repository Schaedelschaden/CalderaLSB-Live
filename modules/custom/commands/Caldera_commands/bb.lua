---------------------------------------------------------------------------------------------------
-- func: !bb
-- desc: Teleports the player to Brigandish Blade's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(53.9329, 0.0000, -341.4825, 131, 177)
end