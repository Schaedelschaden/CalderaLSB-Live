-----------------------------------
-- Area: Upper Delkfutt's Tower (158)
--   NM: Pallas
-- Mob ID: 17424444
-- !pos -300 -159 21 158
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Pallas")

local mobToReplaceName = "Pallas"

m:addOverride(string.format("xi.zones.Upper_Delkfutts_Tower.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local playerName = player:getName()
    local mobName = mob:getName()
    local KillCounter = player:getCharVar("KillCounter_"..mobName)
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_"..mobName, KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m