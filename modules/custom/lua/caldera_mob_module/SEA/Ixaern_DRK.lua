-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Ix'aern DRK
-- !pos -240 5.00 440 35
-- !pos -280 5.00 240 35
-- !pos -560 5.00 239 35
-- !pos -600 5.00 440 35
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Ixaern_DRK")


local mobToReplaceName = "Ixaern_DRK"


m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:addListener("DEATH", "AERN_DEATH", function(mob)
        local timesReraised = mob:getLocalVar("AERN_RERAISES")
        if (math.random (1, 10) < 4 and timesReraised < 3) then
            -- reraise
            local target = mob:getTarget()
            local targetid = 0
            if target then
                targetid = target:getShortID()
            end
            mob:setMobMod(xi.mobMod.NO_DROPS, 1)
            mob:timer(9000, function(mob)
                mob:setHP(mob:getMaxHP())
                mob:setAnimationSub(3)
                mob:resetAI()
                mob:stun(3000)
                local new_target = mob:getEntity(targetid)
                if new_target and mob:checkDistance(new_target) < 40 then
                    mob:updateClaim(new_target)
                    mob:updateEnmity(new_target)
                end
                mob:triggerListener("AERN_RERAISE", mob, timesReraised)
            end)
        else
            -- death
            mob:setMobMod(xi.mobMod.NO_DROPS, 0)
            DespawnMob(QnAernA)
            DespawnMob(QnAernB)
        end
    end)
    mob:addListener("AERN_RERAISE", "IX_DRK_RERAISE", function(mob, timesReraised)
        mob:setLocalVar("AERN_RERAISES", timesReraised + 1)
        mob:timer(5000, function(mob)
            mob:setAnimationSub(1)
        end)
    end)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setAnimationSub(1)

    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = xi.jsa.BLOOD_WEAPON_IXDRK,
                hpp = math.random(90, 95),
                cooldown = 120,
                endCode = function(mob)
                    mob:SetMagicCastingEnabled(false)
                    mob:timer(30000, function(mob)
                        mob:SetMagicCastingEnabled(true)
                    end)
                end,
            }
        }
    })
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_IxAernDRK")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_IxAernDRK", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    mob:setLocalVar("AERN_RERAISES", 0)
end)

return m
