---------------------------------------------------------------------------------------------------
-- func: !zipwest
-- desc: Teleports the player to the western side of Zipacna's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-194.6016, -1.3750, 459.9443, 118, 177)
end
