-----------------------------------
-- Area: Grand Palace of HuXzoi
--  Mob: Ix'aern MNK
-- !pos  34
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Ixaern_MNK")


local mobToReplaceName = "Ixaern_MNK"

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    -- adjust drops based on number of HQ Aern Organs traded to QM
    local qm = GetNPCByID(ID.npc.QM_IXAERN_MNK)
    local chance = qm:getLocalVar("[SEA]IxAern_DropRate")
    -- if (math.random(0, 1) > 0) then
        SetDropRate(2845, 1851, chance * 10) -- Deed Of Placidity
        SetDropRate(2845, 1901, chance * 10)
    -- else
        -- SetDropRate(2845, 1851, 0)
        -- SetDropRate(2845, 1901, chance * 10) -- Vice of Antipathy
    -- end
    qm:setLocalVar("[SEA]IxAern_DropRate", 0)

    mob:setAnimationSub(1) -- Reset the subanim - otherwise it will respawn with bracers on. Note that Aerns are never actually supposed to be in subanim 0.
end)

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    mob:setMod(xi.mod.EVA, 650)
    -- The mob gains a huge boost when it 2hours to attack speed and attack.
    -- It forces the minions to 2hour as well. Wiki says 50% but all videos show 60%.
    if (mob:getLocalVar("BracerMode") == 0) then
        if (mob:getHPP() < math.random(50, 60)) then
            -- Go into bracer mode
            mob:setLocalVar("BracerMode", 1)
            mob:setAnimationSub(2)
            mob:addMod(xi.mod.ATT, 200)
            mob:addMod(xi.mod.HASTE_ABILITY, 1500)
            mob:useMobAbility(3411) -- Hundred Fists

            -- Force minions to 2hour
            for i = 1, 2 do
                local minion = GetMobByID(mob:getID() + i)
                if (minion:getCurrentAction() ~= xi.act.NONE) then
                    minion:useMobAbility(3411 + i) -- Chainspell or Benediction
                end
            end
        end
    end
end)

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_IxAernMNK")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_IxAernMNK", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)

    DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)
end)

m:addOverride(string.format("xi.zones.Grand_Palace_of_HuXzoi.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)
     DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)

    local qm = GetNPCByID(ID.npc.QM_IXAERN_MNK)
    if (math.random(0, 1) == 1) then
        qm:setPos(380, 0, 540, 0) -- G-7
    else
        qm:setPos(460, 0, 540, 0) -- I-7
    end
    qm:updateNPCHideTime(xi.settings.main.FORCE_SPAWN_QM_RESET_TIME)
end)

return m
