---------------------------------------------------------------------------------------------------
-- func: !jofaith
-- desc: Teleports the player to the Jailer of Faith's spawn point.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-260, 0, -655, 190, 35)
end
