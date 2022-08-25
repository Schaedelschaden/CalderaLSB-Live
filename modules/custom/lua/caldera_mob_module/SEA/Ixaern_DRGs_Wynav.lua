-----------------------------------
-- Area: The Garden of Ru'Hmet
--  Mob: Ix'aern DRG's Wynav
-----------------------------------
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Ixaern_DRGs_Wynav")


local mobToReplaceName = "Ixaern_DRGs_Wynav"

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setLocalVar("hpTrigger", math.random(10, 75))
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    local hpTrigger = mob:getLocalVar("hpTrigger")
    if (mob:getLocalVar("SoulVoice") == 0 and mob:getHPP() <= hpTrigger) then
        mob:setLocalVar("SoulVoice", 1)
        mob:useMobAbility(696) -- Soul Voice
    end
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMonsterMagicPrepare", mobToReplaceName), function(mob, target)
    local spellList =
    {
        [1] = 382,
        [2] = 376,
        [3] = 372,
        [4] = 392,
        [5] = 397,
        [6] = 400,
        [7] = 422,
        [8] = 462,
        [9] = 466 -- Virelai (charm)
    }
    if (mob:hasStatusEffect(xi.effect.SOUL_VOICE)) then
        return spellList[math.random(1, 9)] -- Virelai possible.
    else
        return spellList[math.random(1, 8)] -- No Virelai!
    end
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
end)

m:addOverride(string.format("xi.zones.The_Garden_of_RuHmet.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    mob:setLocalVar("repop", mob:getBattleTime()) -- This get erased on respawn automatic.
end)

return m
