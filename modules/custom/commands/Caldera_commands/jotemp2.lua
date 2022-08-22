---------------------------------------------------------------------------------------------------
-- func: !jotemp2
-- desc: Teleports the player to the Jailer of Temperance's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-56, 0, 460, 255, 34)
end
