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
    player:setPos(-143, 0, -340, 128, 35)
end
