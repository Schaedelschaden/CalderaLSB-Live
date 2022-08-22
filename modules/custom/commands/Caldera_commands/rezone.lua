---------------------------------------------------------------------------------------------------
-- func: !rezone
-- desc: Zones the player and returns them to the exact same spot
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function error(player)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("You must have full HP to use this command!")
end

function onTrigger(player)
    if (player:getHP() < player:getMaxHP()) then
        player:PrintToPlayer(string.format("You must have full HP to use this command!", player))
        return
    end
    
    if (player:hasStatusEffect(xi.effect.BUST)) then
        player:PrintToPlayer(string.format("You must wait for certain status effects to wear off before using that command.", player))
        return
    end
    
    local party = player:getParty()
    
    for i, member in pairs(party) do
        if (member:hasEnmity() and player:getGMLevel() < 1) then
            player:PrintToPlayer(string.format("You cannot use that command while a member of your party is in combat.", player))
            return
        end
    end
    
    player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
end
