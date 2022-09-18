-----------------------------------
-- Area: Davoi (149)
--   NM: Steelbiter Gudrud
-- Mob ID: 17387585
-- !pos 244 4 -240 149
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------
local m = Module:new("Steelbiter_Gudrud")

local mobToReplaceName = "Steelbiter_Gudrud"

m:addOverride(string.format("xi.zones.Davoi.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 194)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName = mobName:sub(1, 18)
	local KillCounter = player:getCharVar("KillCounter_"..shortName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end

return m
