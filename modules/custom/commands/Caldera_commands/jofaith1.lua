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
    player:setPos(-419, 0, -143, 63, 35)
end
