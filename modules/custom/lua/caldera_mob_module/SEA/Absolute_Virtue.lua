-----------------------------------
-- Area: Al'Taieu
--  HNM: Absolute Virtue
-----------------------------------
require("modules/module_utils")
local ID = require("scripts/zones/AlTaieu/IDs")
-- mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
-----------------------------------
local m = Module:new("absolute_virtue")


local mobToReplaceName = "Absolute_Virtue"

-- Mighty Strikes, Hundred Fists, Benediction, Manafont, Chainspell, Perfect Dodge, Invincible,
-- Blood Weapon, Soul Voice, Eagle Eye Shot, Meikyo Shisui, Familiar, Astral Flow, Call Wyvern
local avTwoHours = {688, 690, 689, 691, 692, 693, 694, 695, 696, 735, 730, 740, 734, 732}
local playerTwoHours = {16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 24, 30}
local cantUse2Hr = {"AV_CANT_USE_MIGHTY_STRIKES", "AV_CANT_USE_HUNDRED_FISTS", "AV_CANT_USE_BENEDICTION", "AV_CANT_USE_MANAFONT", "AV_CANT_USE_CHAINSPELL",
                    "AV_CANT_USE_PERFECT_DODGE", "AV_CANT_USE_INVINCIBLE", "AV_CANT_USE_BLOOD_WEAPON", "AV_CANT_USE_SOUL_VOICE", "AV_CANT_USE_EES", "AV_CANT_USE_MEIKYO",
                    "AV_CANT_USE_FAMILIAR", "AV_CANT_USE_ASTRAL_FLOW", "AV_CANT_USE_CALL_WYVERN"}

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobSpawn", mobToReplaceName), function(mob)
    -- Reset spell list from last spawn
    mob:setSpellList(430)
    
    -- setMod
    mob:setMod(xi.mod.LIGHT_MEVA, 65)
    mob:setMod(xi.mod.SILENCERES, 99)
    mob:setMod(xi.mod.SLEEPRES, 85)
    mob:setMod(xi.mod.PETRIFYRES, 95)
    mob:setMod(xi.mod.BINDRES, 85)
    mob:setMod(xi.mod.CHARMRES, 100)
    mob:setMod(xi.mod.DEATHRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 20)
    mob:setMod(xi.mod.STUNRES, 100)
    mob:setMod(xi.mod.BINDRES, 50)
    mob:setMod(xi.mod.GRAVITYRES, 30)
    mob:setMod(xi.mod.MOVE, 50)
    mob:addMod(xi.mod.ATT, 650)
    mob:addMod(xi.mod.ACC, 100)
    mob:addMod(xi.mod.MACC, 250)
    -- mob:addMod(xi.mod.EVA, 250)
    -- mob:addMod(xi.mod.MEVA, 250)
    mob:addMod(xi.mod.DEF, 300)
    mob:addMod(xi.mod.FASTCAST, 65)
    -- mob:addMod(xi.mod.MATT, 100)
    mob:addMod(xi.mod.REGEN, 380)
    mob:addMod(xi.mod.REFRESH, 25)
    mob:setLocalVar("numAdds", 1)

    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE)
    -- Special check for regen modification by JoL pets killed
    if (JoL:getLocalVar("JoL_Qn_xzomit_Killed") == 9) then
        mob:addMod(xi.mod.REGEN, -130)
    end
    if (JoL:getLocalVar("JoL_Qn_hpemde_Killed") == 9) then
        mob:addMod(xi.mod.REGEN, -130)
    end
    
    mob:addListener("ATTACKED", "AV_2HR_LISTENER", function(mob)
        -- Get all players on the mob's enmity list
        local enmityList = mob:getEnmityList()
        local PlayerName = {}
        
        -- Use the enmity list to create listeners for players using 2hr abilities
        for i, v in ipairs(enmityList) do
            PlayerName[i] = v.entity:getName()
            
            if (v.entity:getLocalVar("AV_Listener") == 0 or v.entity:getLocalVar("AV_Listener") == nil) then
                v.entity:addListener("ABILITY_STATE_EXIT", "PLAYER_USE_2HRS", function(player, ability)
                    local abilityID = ability:getID()
                    local abilityRecast = ability:getRecast()
                    local avUsedTwoHour = GetServerVariable("AV_2HR_USED")
                    local avTwoHourTime = GetServerVariable("AV_2HR_USED_TIME")
                    
                    for v = 1, 13 do
                        if (abilityID == playerTwoHours[v] and player:hasRecast(xi.recast.ABILITY, 0) and avUsedTwoHour == v and os.time() - avTwoHourTime <= 15) then
                            -- printf("absolute_virtue.lua 2hr Listener [%s] TRIGGERED 2HR: [%i]", player:getName(), playerTwoHours[v])
                            SetServerVariable(cantUse2Hr[v], 1)
                            -- mob:PrintToArea(string.format("The %s take %i damage.", fixedMobName, totaldamage),xi.msg.channel.NS_SAY, xi.msg.area.SHOUT)
                            
                            if (abilityID == 16 and mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES)) then
                                mob:delStatusEffect(xi.effect.MIGHTY_STRIKES)
                            elseif (abilityID == 17 and mob:hasStatusEffect(xi.effect.HUNDRED_FISTS)) then
                                mob:delStatusEffect(xi.effect.HUNDRED_FISTS)
                            elseif (abilityID == 19 and mob:hasStatusEffect(xi.effect.MANAFONT)) then
                                mob:delStatusEffect(xi.effect.MANAFONT)
                            elseif (abilityID == 20 and mob:hasStatusEffect(xi.effect.CHAINSPELL)) then
                                mob:delStatusEffect(xi.effect.CHAINSPELL)
                            elseif (abilityID == 21 and mob:hasStatusEffect(xi.effect.PERFECT_DODGE)) then
                                mob:delStatusEffect(xi.effect.PERFECT_DODGE)
                            elseif (abilityID == 22 and mob:hasStatusEffect(xi.effect.INVINCIBLE)) then
                                mob:delStatusEffect(xi.effect.INVINCIBLE)
                            elseif (abilityID == 23 and mob:hasStatusEffect(xi.effect.BLOOD_WEAPON)) then
                                mob:delStatusEffect(xi.effect.BLOOD_WEAPON)
                            elseif (abilityID == 25 and mob:hasStatusEffect(xi.effect.SOUL_VOICE)) then
                                mob:delStatusEffect(xi.effect.SOUL_VOICE)
                            elseif (abilityID == 26 and mob:hasStatusEffect(xi.effect.MEIKYO_SHISUI)) then
                                mob:delStatusEffect(xi.effect.MEIKYO_SHISUI)
                            elseif (abilityID == 27 and mob:hasStatusEffect(xi.effect.ASTRAL_FLOW)) then
                                mob:delStatusEffect(xi.effect.ASTRAL_FLOW)
                            end
                        end
                    end
                    
                    if (abilityID == 61 and player:hasRecast(xi.recast.ABILITY, 163) and avUsedTwoHour == 14 and os.time() - avTwoHourTime <= 15) then
                        -- printf("absolute_virtue.lua 2hr Listener [%s] TRIGGERED 2HR: [%i]", player:getName(), abilityID)
                        SetServerVariable(cantUse2Hr[12], 1)
                        SetServerVariable(cantUse2Hr[13], 1)
                        SetServerVariable(cantUse2Hr[14], 1)
                        
                        for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
                            DespawnMob(i)
                        end
                    end
                end)
                
                v.entity:setLocalVar("AV_Listener", 1)
            end
        end
    end)
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobFight", mobToReplaceName), function(mob, target)
    if (mob:getLocalVar("AVMACCDrop") == 0) then
        mob:delMod(xi.mod.MACC, 400)
        mob:setLocalVar("AVMACCDrop", 1)
    end

    local isBusy = false
    local act = mob:getCurrentAction()
    local numPets = mob:getLocalVar("numPets")
    local wyvern = {}
    local wyvernUp = {}
    local wyvernDown = {}
    local twoHoursLocked = {}
    local next2HrTime = GetServerVariable("AV_NEXT_2HR_TIME")
    
    -- Starts with Spell Set 430
    -- Changes to Spell Set 431 when under 80% HP or using Manafont
    -- Changes to Spell Set 432 when using Soul Voice
    if (mob:getHPP() > 80 and not mob:hasStatusEffect(xi.effect.MANAFONT)) then
        -- printf("absolute_virtue.lua onMagicCastingCheck HPP ABOVE 80 NO MANAFONT")
        mob:setSpellList(430) -- Default (Aero V, Aeroga IV, Tornado II)
    end
    
    if (mob:getHPP() < 80 or mob:hasStatusEffect(xi.effect.MANAFONT)) then
        -- printf("absolute_virtue.lua onMagicCastingCheck HPP BELOW 80 OR MANAFONT")
        mob:setSpellList(431) -- Special (Aero V, Aeroga IV, Tornado II, Meteor, Comet)
    end
    
    if (mob:hasStatusEffect(xi.effect.SOUL_VOICE)) then
        -- printf("absolute_virtue.lua onMagicCastingCheck SOUL VOICE")
        mob:setSpellList(432) -- Special (Maiden's Virelai)
    end
    
    -- Ensure all pets are actively engaged
    for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
        local wyvern = GetMobByID(i)
            
        if wyvern:isAlive() then
            table.insert(wyvernUp, i)
        elseif not wyvern:isSpawned() then
            table.insert(wyvernDown, i)
        end
        
        if #wyvernUp == 3 then
            mob:setLocalVar("numPets", 3)
        elseif #wyvernUp == 2 then
            mob:setLocalVar("numPets", 2)
        elseif #wyvernUp == 1 then
            mob:setLocalVar("numPets", 1)
        else
            mob:setLocalVar("numPets", 0)
        end
        
        if (wyvern:getCurrentAction() == xi.act.ROAMING) then
            wyvern:updateEnmity(target)
        end
    end
    
    -- Check if AV is performing an action
    if act == xi.act.MOBABILITY_START or act == xi.act.MOBABILITY_USING or act == xi.act.MOBABILITY_FINISH or act == xi.act.MAGIC_START
       or act == xi.act.MAGIC_CASTING or act == xi.act.MAGIC_START then
        isBusy = true -- Set to true if AV is in any stage of using a mobskill or casting a spell
    end
    
    -- Build the twoHoursLocked table to check against and reduce script spam once all two hours have been locked
    for i = 1, 14 do
        if (GetServerVariable(cantUse2Hr[i]) == 1) then
            table.insert(twoHoursLocked, i)
        end
    end
    
    -- Uses a 2hr every 45-90 seconds
    if (mob:getBattleTime() >= 90 and os.time() >= next2HrTime and isBusy == false and #twoHoursLocked ~= 14) then
        local pick2Hr = math.random(1, 14)
        
--      printf("Absolute_Virtue.lua onMobFight 2HR PICKED: [%i]  2HRS LOCKED: [%i]", pick2Hr, #twoHoursLocked)
        
        if (GetServerVariable(cantUse2Hr[pick2Hr]) == 0) then
            if (pick2Hr > 0 and pick2Hr < 11) then
                mob:useMobAbility(avTwoHours[pick2Hr])
            elseif (pick2Hr == 11) then -- Meikyo Shisui causes him to use Explosive Impulse or Medusa Javelin 5 times in a row
                mob:useMobAbility(avTwoHours[pick2Hr])
                for i = 1, 5 do
                    -- He seems to favor Explosive Impulse if choosing between option 1 & 2, so let's expand his chances
                    local meikyoRandom = math.random(1, 100)
                    
                    if (meikyoRandom < 50) then
                        mob:useMobAbility(1386) -- Medusa Javelin
                    else
                        mob:useMobAbility(1403) -- Explosive Impulse
                    end
                end
            elseif (pick2Hr >= 12 and pick2Hr <= 14 and numPets == 0) then -- Call Wyvern if pets aren't up
                mob:useMobAbility(avTwoHours[14])
                pick2Hr = 14
            elseif ((pick2Hr >= 12 and pick2Hr <= 14) and numPets > 0) then -- Familiar & Astral Flow require a pet to be out. Use another pet 2hr if Call Wyvern doesn't need to be used
                if (pick2Hr == 14 and numPets > 0 and GetServerVariable(cantUse2Hr[12]) == 0 and GetServerVariable(cantUse2Hr[13]) == 0) then
                    pick2Hr = math.random(12, 13)
                elseif (pick2Hr == 14 and numPets > 0 and GetServerVariable(cantUse2Hr[12]) == 0 and GetServerVariable(cantUse2Hr[13]) == 1) then
                    pick2Hr = 12
                elseif (pick2Hr == 14 and numPets > 0 and GetServerVariable(cantUse2Hr[12]) == 1 and GetServerVariable(cantUse2Hr[13]) == 0) then
                    pick2Hr = 13
                end
                
                if (pick2Hr == 12) then
                    mob:useMobAbility(avTwoHours[pick2Hr])
                    for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
                        local wyvern = GetMobByID(i)
                        wyvern:addStatusEffectEx(xi.effect.FAMILIAR, 1, 0, 180)
                        wyvern:setHP(99999)
                    end
                end

                if (pick2Hr == 13) then
                    mob:useMobAbility(avTwoHours[pick2Hr])
                    for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
                        local wyvern = GetMobByID(i)
                        wyvern:useMobAbility(math.random(900, 905))
                    end
                end
            end
            
            SetServerVariable("AV_2HR_USED", pick2Hr)
            SetServerVariable("AV_2HR_USED_TIME", os.time())
            SetServerVariable("AV_NEXT_2HR_TIME", os.time() + math.random(45, 90))
        end
    end
    
    if (mob:getHPP() <= 60 and mob:getLocalVar("AV_RAGE") ~= 1) then
        mob:setAnimationSub(2)
        mob:setLocalVar("AV_RAGE", 1)
        
        mob:addMod(xi.mod.DMG, -50)
        mob:addMod(xi.mod.ATT, 250)
        mob:addMod(xi.mod.ACC, 250)
        mob:addMod(xi.mod.MACC, 250)
        mob:addMod(xi.mod.EVA, 150)
        mob:addMod(xi.mod.MEVA, 150)
        mob:addMod(xi.mod.DEF, 250)
        mob:addMod(xi.mod.MATT, 75)
--      printf("Absolute_Virtue.lua onMobFight RAGE")
    end
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onSpellPrecast", mobToReplaceName), function(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(20)
        spell:setAnimation(280) -- AoE Meteor Animation
        spell:setMPCost(1)
    end
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMagicHit", mobToReplaceName), function(caster, target, spell)
    local REGEN = target:getMod(xi.mod.REGEN)
    local DAY = VanadielDayElement()
    local ELEM = spell:getElement()
    
    if (GetServerVariable("AV_Regen_Reduction") < 60) then
        -- Had to serverVar the regen instead of localVar because localVar reset on claim loss.
        if (ELEM == DAY and (caster:isPC() or caster:isPet())) then
            SetServerVariable("AV_Regen_Reduction", 1 + GetServerVariable("AV_Regen_Reduction"))
            target:addMod(xi.mod.REGEN, -2)
        end
    end
    
    return 1
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobDeath", mobToReplaceName), function(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_AbsoluteVirtue")
    local playerName = player:getName()
    local mobName = mob:getName()
    local fixedMobName = string.gsub(mobName, "_", " ")
    
    KillCounter = KillCounter + 1
    
    player:setCharVar("KillCounter_AbsoluteVirtue", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), xi.msg.channel.NS_LINKSHELL3)
    
    player:addTitle(xi.title.VIRTUOUS_SAINT)
    
    for i = ID.mob.ABSOLUTE_VIRTUE + 1, ID.mob.ABSOLUTE_VIRTUE + 3 do
        DespawnMob(i)
    end
    
    -- Clean up listeners and variables
    mob:setAnimationSub(1)
    mob:removeListener("AV_2HR_LISTENER")
    player:removeListener("PLAYER_USE_2HRS")
    player:setLocalVar("AV_Listener", 0)
    SetServerVariable("AV_Regen_Reduction", 0)
    SetServerVariable("AV_2HR_USED", 0)
    SetServerVariable("AV_2HR_USED_TIME", 0)
    SetServerVariable("AV_NEXT_2HR_TIME", 0)
    
    for i = 1, 14 do
        SetServerVariable(cantUse2Hr[i], 0)
    end
end)

m:addOverride(string.format("xi.zones.AlTaieu.mobs.%s.onMobDespawn", mobToReplaceName), function(mob)

end)

return m
