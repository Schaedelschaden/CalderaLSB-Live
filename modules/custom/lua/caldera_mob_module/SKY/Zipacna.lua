-----------------------------------
-- Area: VeLugannon Palace
--  Mob: Zipacna
-----------------------------------
require("scripts/globals/pathfind")
require("modules/module_utils")

local m = Module:new("Zipacna")


local mobToReplaceName = "Zipacna"

local path =
{
    -202, 0, 391,
    -209, 0, 387,
    -214, 0, 381,
    -238, 0, 380,
    -256, 4, 381,
    -261, 8, 400,
    -257, 12, 417,
    -240, 16, 420,
    -257, 12, 417,
    -261, 8, 400,
    -256, 4, 381,
    -238, 0, 380,
    -214, 0, 381,
    -209, 0, 387,
    -194, 0, 388,
    -179, 0, 379,
    -134, 0, 379,
    -115, 0, 417,
    -112, 0, 454,
    -105, 0, 460,
    -80, 0, 460,
    -65, 0, 459,
    -60, 0, 452,
    -59, 0, 420,
    59, 0, 420,
    60, 0, 429,
    60, 0, 445,
    62, 0, 456,
    78, 0, 460,
    108, 0, 458,
    132, 0, 381,
    185, 0, 380,
    199, 0, 391,
    218, 0, 380,
    259, 4, 383,
    258, 12, 418,
    248, 14, 420,
    219, 16, 420,
    248, 14, 420,
    258, 12, 418,
    259, 4, 383,
    218, 0, 380,
    199, 0, 391,
    185, 0, 380,
    132, 0, 381,
    108, 0, 458,
    78, 0, 460,
    62, 0, 456,
    60, 0, 445,
    60, 0, 429,
    59, 0, 420,
    -59, 0, 420,
    -60, 0, 452,
    -65, 0, 459,
    -80, 0, 460,
    -105, 0, 460,
    -112, 0, 454,
    -115, 0, 417,
    -134, 0, 379,
    -179, 0, 379,
    -191, 0, 385,
    -195, 0, 396,
    -202, 0, 391,
    -209, 0, 387,
    -214, 0, 381,
    -238, 0, 380,
    -256, 4, 381,
    -261, 8, 400,
    -257, 12, 417,
    -240, 16, 420,
    -257, 12, 417,
    -261, 8, 400,
    -256, 4, 381,
    -238, 0, 380,
    -214, 0, 381,
    -209, 0, 387,
    -202, 0, 391,
}

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    mob:setMod(xi.mod.REGAIN, 500)
    --onMobRoam(mob)
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onPath", mobToReplaceName), function(mob)
    xi.path.patrol(mob, path, xi.path.flag.RUN)
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobRoam", mobToReplaceName), function(mob)
    -- move to start position if not moving
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(xi.path.first(path), xi.path.flag.RUN)
    end
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    mob:setMod(xi.mod.REGAIN, 500)
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Zipacna")
    local playerName = player:getName()
    local mobName = mob:getName()
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_Zipacna", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
end)

m:addOverride(string.format("xi.zones.VeLugannon_Palace.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
    mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end)

return m
