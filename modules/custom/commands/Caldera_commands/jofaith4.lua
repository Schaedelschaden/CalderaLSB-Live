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
    player:setPos(-580, 0, -654, 189, 35)
end
