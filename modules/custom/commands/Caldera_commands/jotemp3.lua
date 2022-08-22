---------------------------------------------------------------------------------------------------
-- func: !jotemp3
-- desc: Teleports the player to the Jailer of Temperance's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-259, 0, 56, 65, 34)
end
