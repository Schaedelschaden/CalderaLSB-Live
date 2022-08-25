-----------------------------------
-- Area: Al'Taieu
--  Mob: Qn'hpemde
-- Jailor of Love Pet version
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
require("modules/module_utils")
-----------------------------------

local m = Module:new("Qnhpemde")


local mobToReplaceName = "Qnhpemde"

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:AnimationSub(6); -- Mouth Closed
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    local changeTime = mob:getLocalVar("changeTime");

    if (mob:AnimationSub() == 6 and mob:getBattleTime() - changeTime > 30) then
        mob:AnimationSub(3); -- Mouth Open
        mob:addMod(xi.mod.ATTP, 100);
        mob:addMod(xi.mod.DEFP, -50);
        mob:addMod(xi.mod.DMGMAGIC, -50);
        mob:setLocalVar("changeTime", mob:getBattleTime());

    elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > 30) then
        mob:AnimationSub(6); -- Mouth Closed
        mob:addMod(xi.mod.ATTP, -100);
        mob:addMod(xi.mod.DEFP, 50);
        mob:addMod(xi.mod.DMGMAGIC, 50);
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE);
    local HPEMDES = JoL:getLocalVar("JoL_Qn_hpemde_Killed");
    JoL:setLocalVar("JoL_Qn_hpemde_Killed", HPEMDES+1);
end)

return m
