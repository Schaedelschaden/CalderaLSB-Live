---------------------------------------------------------------------------------------------------
-- func: !zipeast
-- desc: Teleports the player to the eastern side of Zipacna's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(195.4935, -1.1250, 460.1288, 255, 177)
end
