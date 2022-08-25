-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Justice
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("modules/module_utils")
-----------------------------------

local m = Module:new("Jailer_of_Justice")


local mobToReplaceName = "Jailer_of_Justice"

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMobLevel(120)
    mob:addMod(xi.mod.ATT, math.random(25, 175))
    mob:addMod(xi.mod.DEF, math.random(275, 450))
    mob:addMod(xi.mod.MDEF, math.random(75, 125))
    mob:addMod(xi.mod.EVA, math.random(150, 275))
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    local popTime = mob:getLocalVar("lastPetPop")
    -- ffxiclopedia says 30 sec, bgwiki says 1-2 min..
    -- Going with 60 seconds until I see proof of retails timing.
    if (os.time() - popTime > 60) then
        local alreadyPopped = false
        for Xzomit = mob:getID()+1, mob:getID()+6 do
            if (alreadyPopped == true) then
                break
            else
                if (not GetMobByID(Xzomit):isSpawned()) then
                    SpawnMob(Xzomit, 300):updateEnmity(target)
                    mob:setLocalVar("lastPetPop", os.time())
                    alreadyPopped = true
                end
            end
        end
    end
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_JailOfJust")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_JailOfJust", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

return m
