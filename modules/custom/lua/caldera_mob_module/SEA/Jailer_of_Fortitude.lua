-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Jailer of Fortitude
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/limbus")
require("scripts/globals/status")
require("scripts/globals/magic")
require("modules/module_utils")

local m = Module:new("Jailer_of_Fortitude")


local mobToReplaceName = "Jailer_of_Fortitude"


m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = xi.jsa.INVINCIBLE, cooldown = 180, hpp = math.random(90, 95)}, -- "Has access to Invincible, which it may use several times."
        },
    })

    -- Change animation to humanoid w/ prismatic core
    mob:setAnimationSub(1)
    mob:setModelId(1169)
    
    mob:addMod(xi.mod.MDEF, math.random(45, 75))
    mob:addMod(xi.mod.REFRESH, 15)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    local delay = mob:getLocalVar("delay")
    local LastCast = mob:getLocalVar("LAST_CAST")
    local spell = mob:getLocalVar("COPY_SPELL")

    if (mob:getBattleTime() - LastCast > 30) then
        mob:setLocalVar("COPY_SPELL", 0)
        mob:setLocalVar("delay", 0)
    end

    if (not GetMobByID(ID.mob.KFGHRAH_WHM):isDead() or not GetMobByID(ID.mob.KFGHRAH_BLM):isDead()) then -- check for kf'ghrah
        if (spell > 0 and not mob:hasStatusEffect(xi.effect.SILENCE)) then
            if (delay >= 3) then
                mob:castSpell(spell)
                mob:setLocalVar("COPY_SPELL", 0)
                mob:setLocalVar("delay", 0)
            else
                mob:setLocalVar("delay", delay+1)
            end
        end
    end
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMagicHit", mobToReplaceName), function(caster, target, spell)
    if (spell:tookEffect() and (caster:isPC() or caster:isPet()) and spell:getSpellGroup() ~= xi.magic.spellGroup.BLUE ) then
        -- Handle mimicked spells
        target:setLocalVar("COPY_SPELL", spell:getID())
        target:setLocalVar("LAST_CAST", target:getBattleTime())
        target:setLocalVar("reflectTime", target:getBattleTime())
        target:setAnimationSub(1)
    end

    return 1
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_JailOfFort")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_JailOfFort", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
    
    -- Despawn the pets if alive
    DespawnMob(ID.mob.KFGHRAH_WHM)
    DespawnMob(ID.mob.KFGHRAH_BLM)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
     -- Move QM to random location
    GetNPCByID(ID.npc.QM_JAILER_OF_FORTITUDE):setPos(unpack(ID.npc.QM_JAILER_OF_FORTITUDE_POS[math.random(1, 5)]))
end)

return m
