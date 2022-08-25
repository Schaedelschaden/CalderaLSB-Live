-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Hope
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Jailer_of_Hope")


local mobToReplaceName = "Jailer_of_Hope"

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobInitialize", mobToReplaceName), function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1);
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setSpellList(0); -- If it dies with the ability to cast spells, the next spawn would be able to cast from the start.
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 20); -- This gives around 6 - 15 seconds between casts. Doesn't seem to work anywhere except in this function.

    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = xi.jsa.MIGHTY_STRIKES, cooldown = 90, hpp = math.random(85, 95)}, -- "May use Mighty Strikes multiple times."
        },
    })
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    if (mob:getLocalVar("SpellTime") < os.time() and mob:getLocalVar("SpellTime") ~= 0) then -- Checks for it being 0 because it gets set to 0 to avoid setting the spell list repeatedly
        mob:setSpellList(0);
        mob:setLocalVar("SpellTime", 0)
    end;
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobWeaponSkill", mobToReplaceName), function(target, mob, skill)
    if (skill:getID() == 1102) then -- Set spell list for Burst2/Thundaga3 upon using Plasma Charge. Allow for 60 seconds.
        mob:setSpellList(140);
        mob:setLocalVar("SpellTime", os.time() + 60);
    end;
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onAdditionalEffect", mobToReplaceName), function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN, {chance = 65, duration = math.random(4, 8)})
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_JailOfHope")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_JailOfHope", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

return m
