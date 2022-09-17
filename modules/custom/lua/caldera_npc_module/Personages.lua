-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Personages
-- !pos -103 -2 -106 51
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/npc_util")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Personages")

local npcToReplaceName = "Personages"

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrade", npcToReplaceName), function(player,npc,trade)
    local af = {12511, 12638, 13961, 14089, 14214}
    local afHQ = {15225, 14473, 14890, 15561, 15352}

    local artifactArmor = {
        [  1] = {trade = {af[1], af[2], af[3], af[4], af[5], {"gil", 250000}}, reward = {afHQ[1], afHQ[2], afHQ[3], afHQ[4], afHQ[5]}}, -- WAR
        [  2] = {trade = {af[1] + 1, af[2] + 1, af[3] + 1, af[4] + 1, af[5] + 1, {"gil", 250000}}, reward = {afHQ[1] + 1, afHQ[2] + 1, afHQ[3] + 1, afHQ[4] + 1, afHQ[5] + 1}}, -- MNK
        [  3] = {trade = {af[1] + 1344, af[2] + 2, af[3] + 2, af[4] + 2, af[5] + 2, {"gil", 250000}}, reward = {afHQ[1] + 2, afHQ[2] + 2, afHQ[3] + 2, afHQ[4] + 2, afHQ[5] + 2}}, -- WHM
        [  4] = {trade = {af[1] + 1345, af[2] + 3, af[3] + 3, af[4] + 3, af[5] + 3, {"gil", 250000}}, reward = {afHQ[1] + 3, afHQ[2] + 3, afHQ[3] + 3, afHQ[4] + 3, afHQ[5] + 3}}, -- BLM
        [  5] = {trade = {af[1] + 2, af[2] + 4, af[3] + 4, af[4] + 4, af[5] + 4, {"gil", 250000}}, reward = {afHQ[1] + 4, afHQ[2] + 4, afHQ[3] + 4, afHQ[4] + 4, afHQ[5] + 4}}, -- RDM
        [  6] = {trade = {af[1] + 3, af[2] + 5, af[3] + 5, af[4] + 5, af[5] + 5, {"gil", 250000}}, reward = {afHQ[1] + 5, afHQ[2] + 5, afHQ[3] + 5, afHQ[4] + 5, afHQ[5] + 5}}, -- THF
        [  7] = {trade = {af[1] + 4, af[2] + 6, af[3] + 6, af[4] + 6, af[5] + 6, {"gil", 250000}}, reward = {afHQ[1] + 6, afHQ[2] + 6, afHQ[3] + 6, afHQ[4] + 6, afHQ[5] + 6}}, -- PLD
        [  8] = {trade = {af[1] + 5, af[2] + 7, af[3] + 7, af[4] + 7, af[5] + 7, {"gil", 250000}}, reward = {afHQ[1] + 7, afHQ[2] + 7, afHQ[3] + 7, afHQ[4] + 7, afHQ[5] + 7}}, -- DRK
        [  9] = {trade = {af[1] + 6, af[2] + 8, af[3] + 8, af[4] + 8, af[5] + 8, {"gil", 250000}}, reward = {afHQ[1] + 8, afHQ[2] + 8, afHQ[3] + 8, afHQ[4] + 8, afHQ[5] + 8}}, -- BST
        [ 10] = {trade = {af[1] + 1346, af[2] + 9, af[3] + 9, af[4] + 9, af[5] + 9, {"gil", 250000}}, reward = {afHQ[1] + 9, afHQ[2] + 9, afHQ[3] + 9, afHQ[4] + 9, afHQ[5] + 9}}, -- BRD
        [ 11] = {trade = {af[1] + 7, af[2] + 10, af[3] + 10, af[4] + 10, af[5] + 10, {"gil", 250000}}, reward = {afHQ[1] + 10, afHQ[2] + 10, afHQ[3] + 10, afHQ[4] + 10, afHQ[5] + 10}}, -- RNG
        [ 12] = {trade = {af[1] + 1357, af[2] + 1143, af[3] + 11, af[4] + 11, af[5] + 11, {"gil", 250000}}, reward = {afHQ[1] + 11, afHQ[2] + 11, afHQ[3] + 11, afHQ[4] + 11, afHQ[5] + 11}}, -- SAM
        [ 13] = {trade = {af[1] + 1358, af[2] + 1144, af[3] + 12, af[4] + 12, af[5] + 12, {"gil", 250000}}, reward = {afHQ[1] + 12, afHQ[2] + 12, afHQ[3] + 12, afHQ[4] + 12, afHQ[5] + 12}}, -- NIN
        [ 14] = {trade = {af[1] + 8, af[2] + 11, af[3] + 13, af[4] + 13, af[5] + 13, {"gil", 250000}}, reward = {afHQ[1] + 13, afHQ[2] + 13, afHQ[3] + 13, afHQ[4] + 13, afHQ[5] + 13}}, -- DRG
        [ 15] = {trade = {af[1] + 9, af[2] + 12, af[3] + 14, af[4] + 14, af[5] + 14, {"gil", 250000}}, reward = {afHQ[1] + 14, afHQ[2] + 14, afHQ[3] + 14, afHQ[4] + 14, afHQ[5] + 14}}, -- SMN
        [ 16] = {trade = {af[1] + 2754, af[2] + 1883, af[3] + 967, af[4] + 1511, af[5] + 1470, {"gil", 250000}}, reward = {afHQ[1] - 3761, afHQ[2] - 3182, afHQ[3] + 134, afHQ[4] + 784, afHQ[5] - 3971}}, -- BLU
        [ 17] = {trade = {af[1] + 2755, af[2] + 1884, af[3] + 968, af[4] + 1512, af[5] + 1471, {"gil", 250000}}, reward = {afHQ[1] - 3758, afHQ[2] - 3179, afHQ[3] + 137, afHQ[4] + 787, afHQ[5] - 3968}}, -- COR
        [ 18] = {trade = {af[1] + 2756, af[2] + 1885, af[3] + 969, af[4] + 1513, af[5] + 1472, {"gil", 250000}}, reward = {afHQ[1] - 3755, afHQ[2] - 3176, afHQ[3] + 140, afHQ[4] + 790, afHQ[5] - 3965}}, -- PUP
        [ 19] = {trade = {af[1] + 3627, af[2] + 1940, af[3] + 1041, af[4] + 1570, af[5] + 1532, {"gil", 250000}}, reward = {afHQ[1] - 3750, afHQ[2] - 3171, afHQ[3] + 145, afHQ[4] + 796, afHQ[5] - 3959}}, -- DNC (Male)
        [ 20] = {trade = {af[1] + 3628, af[2] + 1941, af[3] + 1042, af[4] + 1571, af[5] + 1533, {"gil", 250000}}, reward = {afHQ[1] - 3749, afHQ[2] - 3170, afHQ[3] + 146, afHQ[4] + 797, afHQ[5] - 3958}}, -- DNC (Female)
        [ 21] = {trade = {af[1] + 3629, af[2] + 1942, af[3] + 1043, af[4] + 2222, af[5] + 1534, {"gil", 250000}}, reward = {afHQ[1] - 3748, afHQ[2] - 3169, afHQ[3] + 147, afHQ[4] + 798, afHQ[5] - 3957}}, -- SCH
    }
    
    local tradedCombo = 0

    -- Check for Reforged Artifact armor trade combination
    if tradedCombo == 0 then
        for k, v in pairs(artifactArmor) do
            if npcUtil.tradeHasExactly(trade, v.trade) then
                tradedCombo = k
                break
            end
        end
    end
    
    -- Found a match
    if tradedCombo > 0 then
        local ID = zones[player:getZoneID()]
        
        for i = 1, #artifactArmor[tradedCombo].reward do
            local reward = artifactArmor[tradedCombo].reward[i]
        
            player:confirmTrade()
            player:addItem(reward)
            player:delGil(50000)
            player:messageSpecial(ID.text.ITEM_OBTAINED, reward)
        end
    end
end)

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
    local job = player:getMainJob()
    local level = player:getMainLvl()
    
    if (level >= 51) then
        if (job == xi.job.WAR and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12511, 1)
            player:addItem(12638, 1)
            player:addItem(13961, 1)
            player:addItem(14214, 1)
            player:addItem(14089, 1)
            player:PrintToPlayer(string.format("Obtained the Fighter's Armor Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.MNK and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12512, 1)
            player:addItem(12639, 1)
            player:addItem(13962, 1)
            player:addItem(14215, 1)
            player:addItem(14090, 1)
            player:PrintToPlayer(string.format("Obtained the Temple Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.WHM and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(13855, 1)
            player:addItem(12640, 1)
            player:addItem(13963, 1)
            player:addItem(14216, 1)
            player:addItem(14091, 1)
            player:PrintToPlayer(string.format("Obtained the Healer's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.BLM and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(13856, 1)
            player:addItem(12641, 1)
            player:addItem(13964, 1)
            player:addItem(14217, 1)
            player:addItem(14092, 1)
            player:PrintToPlayer(string.format("Obtained the Wizard's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.RDM and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12513, 1)
            player:addItem(12642, 1)
            player:addItem(13965, 1)
            player:addItem(14218, 1)
            player:addItem(14093, 1)
            player:PrintToPlayer(string.format("Obtained the Warlock's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.THF and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12514, 1)
            player:addItem(12643, 1)
            player:addItem(13966, 1)
            player:addItem(14219, 1)
            player:addItem(14094, 1)
            player:PrintToPlayer(string.format("Obtained the Rogue's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.PLD and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12515, 1)
            player:addItem(12644, 1)
            player:addItem(13967, 1)
            player:addItem(14220, 1)
            player:addItem(14095, 1)
            player:PrintToPlayer(string.format("Obtained the Gallant Armor Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.DRK and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12516, 1)
            player:addItem(12645, 1)
            player:addItem(13968, 1)
            player:addItem(14221, 1)
            player:addItem(14096, 1)
            player:PrintToPlayer(string.format("Obtained the Chaos Armor Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.BST and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12517, 1)
            player:addItem(12646, 1)
            player:addItem(13969, 1)
            player:addItem(14222, 1)
            player:addItem(14097, 1)
            player:PrintToPlayer(string.format("Obtained the Beast Armor Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.BRD and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(13857, 1)
            player:addItem(12647, 1)
            player:addItem(13970, 1)
            player:addItem(14223, 1)
            player:addItem(14098, 1)
            player:PrintToPlayer(string.format("Obtained the Choral Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.RNG and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12518, 1)
            player:addItem(12648, 1)
            player:addItem(13971, 1)
            player:addItem(14224, 1)
            player:addItem(14099, 1)
            player:PrintToPlayer(string.format("Obtained the Hunter's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.SAM and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(13868, 1)
            player:addItem(13781, 1)
            player:addItem(13972, 1)
            player:addItem(14225, 1)
            player:addItem(14100, 1)
            player:PrintToPlayer(string.format("Obtained the Myochin Armor Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.NIN and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(13869, 1)
            player:addItem(13782, 1)
            player:addItem(13973, 1)
            player:addItem(14226, 1)
            player:addItem(14101, 1)
            player:PrintToPlayer(string.format("Obtained the Ninja Garb Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.DRG and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12519, 1)
            player:addItem(12649, 1)
            player:addItem(13974, 1)
            player:addItem(14227, 1)
            player:addItem(14102, 1)
            player:PrintToPlayer(string.format("Obtained the Drachen Armor Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.SMN and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(12520, 1)
            player:addItem(12650, 1)
            player:addItem(13975, 1)
            player:addItem(14228, 1)
            player:addItem(14103, 1)
            player:PrintToPlayer(string.format("Obtained the Evoker's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.BLU and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(15265, 1)
            player:addItem(14521, 1)
            player:addItem(14928, 1)
            player:addItem(15600, 1)
            player:addItem(15684, 1)
            player:PrintToPlayer(string.format("Obtained the Magus Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.COR and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(15266, 1)
            player:addItem(14522, 1)
            player:addItem(14929, 1)
            player:addItem(15601, 1)
            player:addItem(15685, 1)
            player:PrintToPlayer(string.format("Obtained the Corsair's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.PUP and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(15267, 1)
            player:addItem(14523, 1)
            player:addItem(14930, 1)
            player:addItem(15602, 1)
            player:addItem(15686, 1)
            player:PrintToPlayer(string.format("Obtained the Puppetry Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.DNC and level >= 51 and player:getFreeSlotsCount() >= 5) then
            if (player:getRace() == xi.race.HUME_M or player:getRace() == xi.race.ELVAAN_M or player:getRace() == xi.race.TARU_M or player:getRace() == xi.race.GALKA) then
                player:addItem(16138, 1)
                player:addItem(14578, 1)
                player:addItem(15002, 1)
                player:addItem(15659, 1)
                player:addItem(15746, 1)
                player:PrintToPlayer(string.format("Obtained the Male Dancer's Attire Set!"),xi.msg.channel.SYSTEM_3)
            else
                player:addItem(16139, 1)
                player:addItem(14579, 1)
                player:addItem(15003, 1)
                player:addItem(15660, 1)
                player:addItem(15747, 1)
                player:PrintToPlayer(string.format("Obtained the Female Dancer's Attire Set!"),xi.msg.channel.SYSTEM_3)
            end
        elseif (job == xi.job.SCH and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(16140, 1)
            player:addItem(14580, 1)
            player:addItem(15004, 1)
            player:addItem(16311, 1)
            player:addItem(15748, 1)
            player:PrintToPlayer(string.format("Obtained the Scholar's Attire Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.GEO and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(16143, 1, 1, 9, 131, 2) -- +10 MP/+3 MACC/+3 MAB
            player:addItem(14583, 1, 9, 9, 131, 4) -- +10 HP/+5 MACC/+5 MAB
            player:addItem(15007, 1, 23, 4, 301, 9) -- +5 ACC/+10 Handbell Skill
            player:addItem(16314, 1, 112, 2, 300, 9) -- -3% Pet DT/+10 Geomancy Skill
            player:addItem(15751, 1, 110, 1, 292, 9) -- +2 Pet Regen/+10 Elemental Magic Skill
            player:PrintToPlayer(string.format("Obtained the GEO augmented Cobra Unit Set!"),xi.msg.channel.SYSTEM_3)
        elseif (job == xi.job.RUN and level >= 51 and player:getFreeSlotsCount() >= 5) then
            player:addItem(16143, 1, 513, 1, 23, 4) -- +2 DEX/+5 ACC
            player:addItem(14583, 1, 514, 2, 17, 9) -- +3 VIT/+10 HP/+10 MP
            player:addItem(15007, 1, 512, 1, 25, 9) -- +2 STR/+10 ATK
            player:addItem(16314, 1, 31, 4, 39, 4) -- +5 EVA/+5 Enmity
            player:addItem(15751, 1, 37, 4, 134, 2) -- +5 MEVA/+3 MDEF
            player:PrintToPlayer(string.format("Obtained the RUN augmented Cobra Unit Set!"),xi.msg.channel.SYSTEM_3)
        else
            player:PrintToPlayer(string.format("Please clear inventory slots and try again!"),xi.msg.channel.SYSTEM_3)
        end
    else
        player:PrintToPlayer(string.format("You can claim a full set of your job's artifact armor from here after level 51."),xi.msg.channel.SYSTEM_3)
    end
end)

return m 
