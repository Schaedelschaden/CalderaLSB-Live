---------------------------------------------------------------------------------------------------
-- func: !suzaku
-- desc: Teleports the player to Suzaku's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-510, -70, -266, 63, 130)
end
