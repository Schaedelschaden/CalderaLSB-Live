---------------------------------------------------------------------------------------------------
-- func: !kirin
-- desc: Teleports the player to Kirin's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-80, 32, -2, 214, 178)
end
