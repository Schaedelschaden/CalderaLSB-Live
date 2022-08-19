---------------------------------------------------------------------------------------------------
-- func: !byakko
-- desc: Teleports the player to Byakko's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-410, -70, 397, 173, 130)
end
