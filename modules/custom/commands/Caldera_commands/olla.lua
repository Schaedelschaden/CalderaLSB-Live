---------------------------------------------------------------------------------------------------
-- func: !olla
-- desc: Teleports the player to Olla's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(852.4382, 0.4000, 93.2792, 95, 178)
end
