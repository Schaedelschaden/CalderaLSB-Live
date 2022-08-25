-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Jailer of Faith
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
mixins = {require("scripts/mixins/job_special")}
require("modules/module_utils")
-----------------------------------

local m = Module:new("Jailer_of_Faith")


local mobToReplaceName = "Jailer_of_Faith"

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    -- Change animation to open
    mob:setAnimationSub(2)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed
    local randomTime = math.random(45, 180)
    local changeTime = mob:getLocalVar("changeTime")

    if mob:getBattleTime() - changeTime > randomTime then
        -- Change close to open.
        if (mob:getAnimationSub() == 1) then
            mob:setAnimationSub(2)
        else -- Change from open to close
            mob:setAnimationSub(1)
        end
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_JailOfFaith")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_JailOfFaith", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    -- Move QM to random location
    local pos = math.random(1, 5)
    GetNPCByID(ID.npc.JAILER_OF_FAITH_QM):setPos(ID.npc.JAILER_OF_FAITH_QM_POS[pos][1], ID.npc.JAILER_OF_FAITH_QM_POS[pos][2], ID.npc.JAILER_OF_FAITH_QM_POS[pos][3])
end)

return m
