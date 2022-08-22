---------------------------------------------------------------------------------------------------
-- func: !genbu
-- desc: Teleports the player to Genbu's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(255, -70, 514, 176, 130)
end
