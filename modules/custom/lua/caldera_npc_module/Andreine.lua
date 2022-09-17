-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Andreine
-- !pos -91 -2 -91 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/shop")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Andreine")

local npcToReplaceName = "Andreine"

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
    local job = player:getMainJob()
    local level = player:getMainLvl()
    
    if (job == xi.job.WAR) then
        local stock_WAR = {}
        player:PrintToPlayer(string.format("Andreine : I've got gear to get your Warrior's arsenal started!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then   
            stock_WAR =
                {
                    16610,  5000,       -- (Sword) Wax Sword +1
                    16716,  5000,       -- (Great Axe) Butterfly Axe +1
                    16646,  5000,       -- (Axe) Bronze Axe +1
                    17175,  5000,       -- (Archery) Shortbow +1
                    17228,  5000,       -- (Marksmanship) Light Crossbow +1
                    17290,  5000,       -- (Throwing) Coarse Boomerang
                    4219,   200,        -- (Ammunition) Stone Arrow Quiver
                    4227,   200,        -- (Ammunition) Bronze Bolt Quiver
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13226,  2000,       -- (Waist) Blood Stone +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_WAR =
                {
                    16812,  15000,      -- (Sword) War Sword
                    16718,  15000,      -- (Great Axe) Heavy Axe +1
                    16664,  15000,      -- (Axe) War Pick +1
                    17179,  15000,      -- (Archery) Composite Bow +1
                    17229,  15000,      -- (Marksmanship) Zamburak +1
                    4222,   2000,       -- (Ammunition) Horn Arrow Quiver
                    4228,   2000,       -- (Ammunition) Mythril Bolt Quiver
                    12533,  10000,      -- (Head) Silver Mask +1
                    12666,  10000,      -- (Body) Silver Mail +1
                    12772,  10000,      -- (Hands) Silver Mittens +1
                    12894,  10000,      -- (Legs) Silver Hose +1
                    13029,  10000,      -- (Feet) Silver Greaves +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_WAR =
                {
                    16828,  25000,      -- (Sword) Bastard Sword +1
                    16731,  25000,      -- (Great Axe) Colossal Axe +1
                    16682,  25000,      -- (Axe) Darksteel Pick +1
                    17189,  25000,      -- (Archery) Rapid Bow +1
                    17227,  25000,      -- (Marksmanship) Heavy Crossbow +1
                    4224,   5000,       -- (Ammunition) Demon Arrow Quiver
                    4229,   5000,       -- (Ammunition) Darksteel Bolt Quiver
                    15225,  50000,      -- (Head) Fighter's Mask +1
                    14473,  50000,      -- (Body) Fighter's Lorica +1
                    14890,  50000,      -- (Hands) Fighter's Mufflers +1
                    15561,  50000,      -- (Legs) Fighter's Cuisses +1
                    15352,  50000,      -- (Feet) Fighter's Calligae +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13403,  10000,      -- (Earring) Assault Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_WAR =
                {
                    18512,  40000,      -- (Great Axe) Dolor Bhuj +1
                    16662,  40000,      -- (Axe) Doom Tabar +1
                    18701,  40000,      -- (Archery) Cerberus Bow +1
                    19266,  40000,      -- (Marksmanship) Darkwing +1
                    5819,   7500,       -- (Ammunition) Antlion Arrow Quiver
                    5821,   7500,       -- (Ammunition) Fusion Bolt Quiver
                    11064,  50000,      -- (Head) Ravager's Mask +2
                    11084,  50000,      -- (Body) Ravager's Lorica +2
                    11104,  50000,      -- (Hands) Ravager's Mufflers +2
                    11124,  50000,      -- (Legs) Ravager's Cuisses +2
                    11144,  50000,      -- (Feet) Ravager's Calligae +2
                    11591,  50000,      -- (Neck) Ravager's Gorget
                    11703,  50000,      -- (Earring) Ravager's Earring
                    19253,  50000,      -- (Ammunition) Ravager's Orb
                    10650,  50000,      -- (Head) Warrior's Mask +2
                    10670,  50000,      -- (Body) Warrior's Lorica +2
                    10690,  50000,      -- (Hands) Warrior's Mufflers +2
                    10710,  50000,      -- (Legs) Warrior's Cuisses +2
                    10730,  50000,      -- (Feet) Warrior's Calligae +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_WAR =
                {
                    18916,  300000,     -- (Sword) Heimdall's Doom
                    20879,  100000,     -- (Great Axe) Nohkux Axe +1
                    20832,  65000,      -- (Axe) Aalak' Axe +1
                    19785,  100000,     -- (Archery) Lanner Bow +1
                    19266,  40000,      -- (Marksmanship) Darkwing +1
                    6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
                    6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
                    10442,  300000,     -- (Head) Laeradr Helm
                    10280,  300000,     -- (Body) Laeradr Breastplate
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11064,  50000,      -- (Head) Ravager's Mask +2
                    11084,  50000,      -- (Body) Ravager's Lorica +2
                    11104,  50000,      -- (Hands) Ravager's Mufflers +2
                    11124,  50000,      -- (Legs) Ravager's Cuisses +2
                    11144,  50000,      -- (Feet) Ravager's Calligae +2
                    11591,  50000,      -- (Neck) Ravager's Gorget
                    11703,  50000,      -- (Earring) Ravager's Earring
                    19253,  50000,      -- (Ammunition) Ravager's Orb
                    10650,  50000,      -- (Head) Warrior's Mask +2
                    10670,  50000,      -- (Body) Warrior's Lorica +2
                    10690,  50000,      -- (Hands) Warrior's Mufflers +2
                    10710,  50000,      -- (Legs) Warrior's Cuisses +2
                    10730,  50000,      -- (Feet) Warrior's Calligae +2
                    -- 25417,   50000,      -- (Neck) Warrior's Bead Necklace
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_WAR)
    elseif (job == xi.job.MNK) then
        local stock_MNK = {}
        player:PrintToPlayer(string.format("Andreine : Ah, the supreme focus of a Monk! I wish I could focus like you..."),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_MNK =
                {
                    20533,  5000,       -- (Hand-to-Hand) Worm Feelers +1
                    16690,  5000,       -- (Hand-to-Hand) Cesti +1
                    17296,  1,          -- (Throwing) Pebble
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13060,  2000,       -- (Neck) Feather Collar +1
                    13184,  5000,       -- (Waist) White Belt
                    13201,  12000,       -- (Waist) Purple Belt
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_MNK =
                {
                    16445,  15000,      -- (Hand-to-Hand) Claws +1
                    17298,  20,         -- (Ammunition) Tathlum
                    12539,  10000,      -- (Head) Soil Hachimaki +1
                    12671,  10000,      -- (Body) Soil Gi +1
                    12781,  10000,      -- (Hands) Soil Tekko +1
                    12905,  10000,      -- (Legs) Soil Sitabaki +1
                    13035,  10000,      -- (Feet) Soil Kyahan +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13202,  30000,      -- (Waist) Brown Belt
                    13575,  5000,       -- (Back) Ram Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_MNK =
                {
                    18751,  25000,      -- (Hand-to-Hand) Black Adargas +1
                    17299,  50,         -- (Ammunition) Astragalos
                    15226,  50000,      -- (Head) Temple Crown +1
                    14474,  50000,      -- (Body) Temple Cyclas +1
                    14891,  50000,      -- (Hands) Temple Gloves +1
                    15562,  50000,      -- (Legs) Temple Hose +1
                    15353,  50000,      -- (Feet) Temple Gaiters +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    13186,  75000,      -- (Waist) Black Belt
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_MNK =
                {
                    18775,  40000,      -- (Hand-to-Hand) Savate Fists +1
                    19249,  20000,      -- (Ammunition) Thew Bomblet
                    11065,  50000,      -- (Head) Tantra Crown +2
                    11085,  50000,      -- (Body) Tantra Cyclas +2
                    11105,  50000,      -- (Hands) Tantra Gloves +2
                    11125,  50000,      -- (Legs) Tantra Hose +2
                    11145,  50000,      -- (Feet) Tantra Gaiters +2
                    11592,  50000,      -- (Neck) Tantra Necklace
                    11704,  50000,      -- (Earring) Tantra Earring
                    19254,  50000,      -- (Ammunition) Tantra Tathlum
                    10651,  50000,      -- (Head) Melee Crown +2
                    10671,  50000,      -- (Body) Melee Cyclas +2
                    10691,  50000,      -- (Hands) Melee Gloves +2
                    10711,  50000,      -- (Legs) Melee Hose +2
                    10731,  50000,      -- (Feet) Melee Gaiters +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    13186,  75000,      -- (Waist) Black Belt
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_MNK =
                {
                    20552,  100000,     -- (Hand-to-Hand) Akua Sainti +1
                    19249,  20000,      -- (Ammunition) Thew Bomblet
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11065,  50000,      -- (Head) Tantra Crown +2
                    11085,  50000,      -- (Body) Tantra Cyclas +2
                    11105,  50000,      -- (Hands) Tantra Gloves +2
                    11125,  50000,      -- (Legs) Tantra Hose +2
                    11145,  50000,      -- (Feet) Tantra Gaiters +2
                    11592,  50000,      -- (Neck) Tantra Necklace
                    11704,  50000,      -- (Earring) Tantra Earring
                    19254,  50000,      -- (Ammunition) Tantra Tathlum
                    10651,  50000,      -- (Head) Melee Crown +2
                    10671,  50000,      -- (Body) Melee Cyclas +2
                    10691,  50000,      -- (Hands) Melee Gloves +2
                    10711,  50000,      -- (Legs) Melee Hose +2
                    10731,  50000,      -- (Feet) Melee Gaiters +2
                    -- 25423,   50000,      -- (Neck) Monk's Nodowa
                    13186,  75000,      -- (Waist) Black Belt
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_MNK)
    elseif (job == xi.job.WHM) then
        local stock_WHM = {}
        player:PrintToPlayer(string.format("Andreine : Hopefully this gear will make leveling White Mage just a little less painful!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_WHM =
                {
                    17087,  5000,       -- (Club) Maple Wand +1
                    17137,  5000,       -- (Club) Ash Club +1
                    17144,  5000,       -- (Club) Bronze Hammer +1
                    17123,  5000,       -- (Staff) Ash Staff +1
                    17122,  5000,       -- (Staff) Ash Pole +1
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13093,  2000,       -- (Neck) Justice Badge
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13605,  2000,       -- (Back) Cape +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13440,  2000,       -- (Ring) Ascetic's Ring
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_WHM =
                {
                    17141,  15000,      -- (Club) Solid Wand
                    17409,  15000,      -- (Club) Mythril Rod +1
                    17121,  15000,      -- (Club) Maul +1
                    17534,  15000,      -- (Staff) Whale Staff +1
                    17119,  15000,      -- (Staff) Elm Pole +1
                    18137,  5000,       -- (Ammunition) Holy Ampulla
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13233,  5000,       -- (Waist) Gold Obi +1
                    13618,  5000,       -- (Back) White Cape +1
                    14702,  5000,       -- (Earring) Aura Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_WHM =
                {
                    17427,  25000,      -- (Club) Ebony Wand +1
                    17435,  25000,      -- (Club) Darksteel Rod +1
                    17432,  25000,      -- (Club) Darksteel Maul +1
                    17520,  25000,      -- (Staff) Heavy Staff +1
                    17521,  25000,      -- (Staff) Mahogany Pole +1
                    15227,  50000,      -- (Head) Healer's Cap +1
                    14475,  50000,      -- (Body) Healer's Briault +1
                    14892,  50000,      -- (Hands) Healer's Mitts +1
                    15563,  50000,      -- (Legs) Healer's Pantaloons +1
                    15354,  50000,      -- (Feet) Healer's Duckbills +1
                    15887,  10000,      -- (Neck) Resolute Belt
                    15885,  10000,      -- (Neck) Spectral Belt
                    15490,  10000,      -- (Back) Miraculous Cape
                    15971,  10000,      -- (Earring) Antivenom Earring
                    15972,  10000,      -- (Earring) Insomnia Earring
                    15776,  10000,      -- (Ring) Ebullient Ring
                    15777,  10000,      -- (Ring) Hale Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_WHM =
                {
                    18874,  40000,      -- (Club) Brise-os +1
                    17568,  40000,      -- (Staff) Eight-sided Pole +1
                    17277,  20000,      -- (Ammunition) Hedgehog Bomb
                    11066,  50000,      -- (Head) Orison Cap +2
                    11086,  50000,      -- (Body) Orison Bliaud +2
                    11106,  50000,      -- (Hands) Orison Mitts +2
                    11126,  50000,      -- (Legs) Orison Pantaloons +2
                    11146,  50000,      -- (Feet) Orison Duckbills +2
                    11615,  50000,      -- (Neck) Orison Locket
                    11705,  50000,      -- (Earring) Orison Earring
                    11554,  50000,      -- (Back) Orison Cape
                    10652,  50000,      -- (Head) Cleric's Cap +2
                    10672,  50000,      -- (Body) Cleric's Briault +2
                    10692,  50000,      -- (Hands) Cleric's Mitts +2
                    10712,  50000,      -- (Legs) Cleric's Pantaloons +2
                    10732,  50000,      -- (Feet) Cleric's Duckbills +2
                    11579,  30000,      -- (Neck) Fylgja Torque
                    15949,  30000,      -- (Waist) Pythia Sash +1
                    27598,  30000,      -- (Back) Dew Silk Cape +1
                    11683,  30000,      -- (Earring) Aqua Earring
                    13308,  30000,      -- (Ring) Communion Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_WHM =
                {
                    21133,  100000,     -- (Club) Sasah Wand +1
                    21132,  100000,     -- (Club) Aedold
                    21208,  100000,     -- (Staff) Lehbrailg
                    19780,  30000,      -- (Ammunition) Mana Ampulla
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11066,  50000,      -- (Head) Orison Cap +2
                    11086,  50000,      -- (Body) Orison Bliaud +2
                    11106,  50000,      -- (Hands) Orison Mitts +2
                    11126,  50000,      -- (Legs) Orison Pantaloons +2
                    11146,  50000,      -- (Feet) Orison Duckbills +2
                    11615,  50000,      -- (Neck) Orison Locket
                    11705,  50000,      -- (Earring) Orison Earring
                    11554,  50000,      -- (Back) Orison Cape
                    10652,  50000,      -- (Head) Cleric's Cap +2
                    10672,  50000,      -- (Body) Cleric's Briault +2
                    10692,  50000,      -- (Hands) Cleric's Mitts +2
                    10712,  50000,      -- (Legs) Cleric's Pantaloons +2
                    10732,  50000,      -- (Feet) Cleric's Duckbills +2
                    -- 25429,   50000,      -- (Neck) Cleric's Torque
                    28455,  50000,      -- (Waist) Ovate Rope
                    28596,  50000,      -- (Back) Oretania's Cape +1
                    -- 28474,   50000,      -- (Earring) Mendicant's Earring
                    -- 11054,   50000,      -- (Earring) Pensee Earring
                    11683,  30000,      -- (Earring) Aqua Earring
                    -- 27566,   50000,      -- (Ring) Leviathan Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_WHM)
    elseif (job == xi.job.BLM) then
        local stock_BLM = {}
        player:PrintToPlayer(string.format("Andreine : Hmm, do you really need extra gear as a Black Mage? So overpowered!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_BLM =
                {
                    17087,  5000,       -- (Club) Maple Wand +1
                    17123,  5000,       -- (Staff) Ash Staff +1
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13093,  2000,       -- (Neck) Justice Badge
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13605,  2000,       -- (Back) Cape +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13475,  2000,       -- (Ring) Hermit's Ring
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_BLM =
                {
                    17141,  15000,      -- (Club) Solid Wand
                    17409,  15000,      -- (Club) Mythril Rod +1
                    17534,  15000,      -- (Staff) Whale Staff +1
                    17119,  15000,      -- (Staff) Elm Pole +1
                    15173,  10000,      -- (Head) Kosshin
                    13730,  10000,      -- (Body) Frost Robe
                    12750,  10000,      -- (Hands) New Moon Armlets
                    12904,  10000,      -- (Legs) Linen Slacks +1
                    13040,  10000,      -- (Feet) Shoes +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13233,  5000,       -- (Waist) Gold Obi +1
                    13610,  5000,       -- (Back) Black Cape +1
                    14702,  5000,       -- (Earring) Aura Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_BLM =
                {
                    17427,  25000,      -- (Club) Ebony Wand +1
                    17435,  25000,      -- (Club) Darksteel Rod +1
                    17520,  25000,      -- (Staff) Heavy Staff +1
                    17521,  25000,      -- (Staff) Mahogany Pole +1
                    15228,  50000,      -- (Head) Wizard's Petasos +1
                    14476,  50000,      -- (Body) Wizard's Coat +1
                    14893,  50000,      -- (Hands) Wizard's Gloves +1
                    15564,  50000,      -- (Legs) Wizard's Tonban +1
                    15355,  50000,      -- (Feet) Wizard's Sabots +1
                    15887,  10000,      -- (Neck) Resolute Belt
                    15885,  10000,      -- (Neck) Spectral Belt
                    15490,  10000,      -- (Back) Miraculous Cape
                    15971,  10000,      -- (Earring) Antivenom Earring
                    15972,  10000,      -- (Earring) Insomnia Earring
                    15776,  10000,      -- (Ring) Ebullient Ring
                    15777,  10000,      -- (Ring) Hale Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_BLM =
                {
                    17118,  40000,      -- (Staff) Lituus +1
                    17277,  20000,      -- (Ammunition) Hedgehog Bomb
                    11067,  50000,      -- (Head) Goetia Petasos +2
                    11087,  50000,      -- (Body) Goetia Coat +2
                    11107,  50000,      -- (Hands) Goetia Gloves +2
                    11127,  50000,      -- (Legs) Goetia Chausses +2
                    11147,  50000,      -- (Feet) Goetia Sabots +2
                    11593,  50000,      -- (Neck) Goetia Chain
                    11706,  50000,      -- (Earring) Goetia Earring
                    16203,  50000,      -- (Back) Goetia Mantle
                    10653,  50000,      -- (Head) Sorcerer's Petasos +2
                    10673,  50000,      -- (Body) Sorcerer's Coat +2
                    10693,  50000,      -- (Hands) Sorcerer's Gloves +2
                    10713,  50000,      -- (Legs) Sorcerer's Tonban +2
                    10733,  50000,      -- (Feet) Sorcerer's Sabots +2
                    11584,  30000,      -- (Neck) Lemegeton Medallion +1
                    11743,  30000,      -- (Waist) Searing Sash
                    11560,  30000,      -- (Back) Pedant Cape
                    11682,  30000,      -- (Earring) Snow Earring
                    13306,  30000,      -- (Ring) Omniscient Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_BLM =
                {
                    21133,  100000,     -- (Club) Sasah Wand +1
                    21208,  100000,     -- (Staff) Lehbrailg
                    -- 21362,   30000,      -- (Ammunition) Ombre Tathlum +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11067,  50000,      -- (Head) Goetia Petasos +2
                    11087,  50000,      -- (Body) Goetia Coat +2
                    11107,  50000,      -- (Hands) Goetia Gloves +2
                    11127,  50000,      -- (Legs) Goetia Chausses +2
                    11147,  50000,      -- (Feet) Goetia Sabots +2
                    11593,  50000,      -- (Neck) Goetia Chain
                    11706,  50000,      -- (Earring) Goetia Earring
                    16203,  50000,      -- (Back) Goetia Mantle
                    10653,  50000,      -- (Head) Sorcerer's Petasos +2
                    10673,  50000,      -- (Body) Sorcerer's Coat +2
                    10693,  50000,      -- (Hands) Sorcerer's Gloves +2
                    10713,  50000,      -- (Legs) Sorcerer's Tonban +2
                    10733,  50000,      -- (Feet) Sorcerer's Sabots +2
                    -- 25435,   50000,      -- (Neck) Sorcerer's Stole
                    10839,  50000,      -- (Waist) Othila Sash
                    28601,  50000,      -- (Back) Seshaw Cape
                    11682,  30000,      -- (Earring) Snow Earring
                    -- 27574,   50000,      -- (Ring) Shiva Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_BLM)
    elseif (job == xi.job.RDM) then
        local stock_RDM = {}
        player:PrintToPlayer(string.format("Andreine : Couldn't pick just one school of magic to focus on eh? That's ok, I've got gear for you!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_RDM =
                {
                    16610,  5000,       -- (Sword) Wax Sword +1
                    17087,  5000,       -- (Club) Maple Wand +1
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13093,  2000,       -- (Neck) Justice Badge
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13605,  2000,       -- (Back) Cape +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13440,  2000,       -- (Ring) Ascetic's Ring
                    13475,  2000,       -- (Ring) Hermit's Ring
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_RDM =
                {
                    16815,  15000,      -- (Sword) Mythril Degen +1
                    12335,  10000,      -- (Shield) Targe +1
                    17141,  15000,      -- (Club) Solid Wand
                    17534,  15000,      -- (Staff) Whale Staff +1
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13233,  5000,       -- (Waist) Gold Obi +1
                    13611,  7500,       -- (Back) Red Cape +1
                    14702,  5000,       -- (Earring) Aura Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_RDM =
                {
                    17641,  25000,      -- (Sword) Gold Sword +1
                    12353,  25000,      -- (Shield) Gilt Buckler
                    17427,  25000,      -- (Club) Ebony Wand +1
                    17520,  25000,      -- (Staff) Heavy Staff +1
                    15229,  50000,      -- (Head) Warlock's Chapeau +1
                    14477,  50000,      -- (Body) Warlock's Tabard +1
                    14894,  50000,      -- (Hands) Warlock's Gloves +1
                    15565,  50000,      -- (Legs) Warlock's Tights +1
                    15356,  50000,      -- (Feet) Warlock's Boots +1
                    15887,  10000,      -- (Neck) Resolute Belt
                    15885,  10000,      -- (Neck) Spectral Belt
                    15490,  10000,      -- (Back) Miraculous Cape
                    15971,  10000,      -- (Earring) Antivenom Earring
                    15972,  10000,      -- (Earring) Insomnia Earring
                    15776,  10000,      -- (Ring) Ebullient Ring
                    15777,  10000,      -- (Ring) Hale Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_RDM =
                {
                    17664,  40000,      -- (Sword) Firmament +1
                    12386,  40000,      -- (Shield) Acheron Shield +1
                    17277,  20000,      -- (Ammunition) Hedgehog Bomb
                    11068,  50000,      -- (Head) Estoqueur's Chappel +2
                    11088,  50000,      -- (Body) Estoqueur's Sayon +2
                    11108,  50000,      -- (Hands) Estoqueur's Gantherots +2
                    11128,  50000,      -- (Legs) Estoqueur's Fuseau +2
                    11148,  50000,      -- (Feet) Estoqueur's Houseaux +2
                    11594,  50000,      -- (Neck) Estoqueur's Collar
                    11707,  50000,      -- (Earring) Estoqueur's Earring
                    16204,  50000,      -- (Back) Estoqueur's Cape
                    10654,  50000,      -- (Head) Duelist's Chapeau +2
                    10674,  50000,      -- (Body) Duelist's Tabard +2
                    10694,  50000,      -- (Hands) Duelist's Gloves +2
                    10714,  50000,      -- (Legs) Duelist's Tights +2
                    10734,  50000,      -- (Feet) Duelist's Boots +2
                    11579,  30000,      -- (Neck) Fylgja Torque
                    11584,  30000,      -- (Neck) Lemegeton Medallion +1
                    11747,  30000,      -- (Waist) Austerity Belt
                    16210,  30000,      -- (Back) Ebullient Cape
                    16052,  30000,      -- (Earring) Incubus Earring
                    11683,  30000,      -- (Earring) Aqua Earring
                    11682,  30000,      -- (Earring) Snow Earring
                    13308,  30000,      -- (Ring) Communion Ring
                    13306,  30000,      -- (Ring) Omniscient Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_RDM =
                {
                    20743,  100000,     -- (Sword) Bihkah Sword +1
                    28668,  100000,     -- (Shield) Matamata Shield +1
                    21207,  100000,     -- (Staff) Hemolele Staff +1
                    -- 21362,   30000,      -- (Ammunition) Ombre Tathlum +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11068,  50000,      -- (Head) Estoqueur's Chappel +2
                    11088,  50000,      -- (Body) Estoqueur's Sayon +2
                    11108,  50000,      -- (Hands) Estoqueur's Gantherots +2
                    11128,  50000,      -- (Legs) Estoqueur's Fuseau +2
                    11148,  50000,      -- (Feet) Estoqueur's Houseaux +2
                    11594,  50000,      -- (Neck) Estoqueur's Collar
                    11707,  50000,      -- (Earring) Estoqueur's Earring
                    16204,  50000,      -- (Back) Estoqueur's Cape
                    10654,  50000,      -- (Head) Duelist's Chapeau +2
                    10674,  50000,      -- (Body) Duelist's Tabard +2
                    10694,  50000,      -- (Hands) Duelist's Gloves +2
                    10714,  50000,      -- (Legs) Duelist's Tights +2
                    10734,  50000,      -- (Feet) Duelist's Boots +2
                    -- 25441,   50000,      -- (Neck) Duelist's Torque
                    10839,  50000,      -- (Waist) Othila Sash
                    28455,  50000,      -- (Waist) Ovate Rope
                    28596,  50000,      -- (Back) Oretania's Cape +1
                    28601,  50000,      -- (Back) Seshaw Cape
                    11683,  30000,      -- (Earring) Aqua Earring
                    11682,  30000,      -- (Earring) Snow Earring
                    -- 27566,   50000,      -- (Ring) Leviathan Ring
                    -- 27574,   50000,      -- (Ring) Shiva Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_RDM)
    elseif (job == xi.job.THF) then
        local stock_THF = {}
        player:PrintToPlayer(string.format("Andreine : Please keep in mind that my wares are for sale and not lifting by sticky fingers!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_THF =
                {
                    16610,  5000,       -- (Sword) Wax Sword +1
                    16690,  5000,       -- (Hand-to-Hand) Cesti +1
                    16491,  5000,       -- (Dagger) Bronze Knife +1
                    16492,  5000,       -- (Dagger) Bronze Dagger +1
                    17175,  5000,       -- (Archery) Shortbow +1
                    19225,  5000,       -- (Marksmanship) Musketoon +1
                    17290,  5000,       -- (Throwing) Coarse Boomerang
                    4219,   200,        -- (Ammunition) Stone Arrow Quiver
                    5359,   200,        -- (Ammunition) Bronze Bullet Pouch
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_THF =
                {
                    19106,  10000,      -- (Dagger) Thug's Jambiya +1
                    17260,  15000,      -- (Marksmanship) Pirate's Gun +1
                    5363,   2000,       -- (Ammunition) Bullet Pouch
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_THF =
                {
                    17603,  15000,      -- (Dagger) Cermet Kukri +1
                    19227,  25000,      -- (Marksmanship) Blunderbuss +1
                    5353,   5000,       -- (Ammunition) Iron Bullet Pouch
                    15230,  50000,      -- (Head) Rogue's Bonnet +1
                    14478,  50000,      -- (Body) Rogue's Vest +1
                    14895,  50000,      -- (Hands) Rogue's Armlets +1
                    15566,  50000,      -- (Legs) Rogue's Culottes +1
                    15357,  50000,      -- (Feet) Rogue's Poulaines +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_THF =
                {
                    16481,  35000,      -- (Dagger) Yataghan +1
                    17252,  40000,      -- (Marksmanship) Culverin
                    5353,   5000,       -- (Ammunition) Iron Bullet Pouch
                    17342,  75,         -- (Ammunition) Cannon Shell
                    11069,  50000,      -- (Head) Raider's Bonnet +2
                    11089,  50000,      -- (Body) Raider's Vest +2
                    11109,  50000,      -- (Hands) Raider's Armlets +2
                    11129,  50000,      -- (Legs) Raider's Culottes +2
                    11149,  50000,      -- (Feet) Raider's Poulaines +2 (TH)
                    19260,  50000,      -- (Throwing) Raider's Boomerang
                    11708,  50000,      -- (Earring) Raider's Earring
                    11736,  50000,      -- (Waist) Raider's Belt
                    10655,  50000,      -- (Head) Assassin's Bonnet +2
                    10675,  50000,      -- (Body) Assassin's Vest +2
                    10695,  50000,      -- (Hands) Assassin's Armlets +2 (TH)
                    10715,  50000,      -- (Legs) Assassin's Culottes +2
                    10735,  50000,      -- (Feet) Assassin's Poulaines +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11681,  30000,      -- (Earring) Breeze Earring
                    11679,  30000,      -- (Earring) Thunder Earring
                    14636,  30000,      -- (Ring) Breeze Ring
                    14638,  30000,      -- (Ring) Thunder Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_THF =
                {
                    20642,  65000,      -- (Dagger) Tzustes Knife +1
                    19742,  100000,     -- (Marksmanship) Handgonne +1
                    5353,   5000,       -- (Ammunition) Iron Bullet Pouch
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11069,  50000,      -- (Head) Raider's Bonnet +2
                    11089,  50000,      -- (Body) Raider's Vest +2
                    11109,  50000,      -- (Hands) Raider's Armlets +2
                    11129,  50000,      -- (Legs) Raider's Culottes +2
                    11149,  50000,      -- (Feet) Raider's Poulaines +2 (TH)
                    19260,  50000,      -- (Throwing) Raider's Boomerang
                    11708,  50000,      -- (Earring) Raider's Earring
                    11736,  50000,      -- (Waist) Raider's Belt
                    10655,  50000,      -- (Head) Assassin's Bonnet +2
                    10675,  50000,      -- (Body) Assassin's Vest +2
                    10695,  50000,      -- (Hands) Assassin's Armlets +2 (TH)
                    10715,  50000,      -- (Legs) Assassin's Culottes +2
                    10735,  50000,      -- (Feet) Assassin's Poulaines +2
                    -- 25447,   50000,      -- (Neck) Assassin's Gorget
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_THF)
    elseif (job == xi.job.PLD) then
        local stock_PLD = {}
        player:PrintToPlayer(string.format("Andreine : You're going to need to soak up a lot of damage as a Paladin! I hope this gear helps!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_PLD =
                {
                    16627,  5000,       -- (Sword) Spatha +1
                    12371,  5000,       -- (Shield) Clipeus
                    17175,  5000,       -- (Archery) Shortbow +1
                    4219,   200,        -- (Ammunition) Stone Arrow Quiver
                    12784,  2000,       -- (Gloves) Leather Gloves +1
                    12908,  2000,       -- (Legs) Leather Trousers +1
                    12971,  2000,       -- (Feet) Leather Highboots +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    14670,  2000,       -- (Ring) Safeguard Ring
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_PLD =
                {
                    16812,  15000,      -- (Sword) War Sword
                    12335,  10000,      -- (Shield) Targe +1
                    17179,  15000,      -- (Archery) Composite Bow +1
                    4222,   2000,       -- (Ammunition) Horn Arrow Quiver
                    12533,  10000,      -- (Head) Silver Mask +1
                    12666,  10000,      -- (Body) Silver Mail +1
                    12772,  10000,      -- (Hands) Silver Mittens +1
                    12894,  10000,      -- (Legs) Silver Hose +1
                    13029,  10000,      -- (Feet) Silver Greaves +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13506,  5000,       -- (Ring) Bomb Ring
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_PLD =
                {
                    17641,  25000,      -- (Sword) Gold Sword +1
                    12353,  25000,      -- (Shield) Gilt Buckler
                    17189,  25000,      -- (Archery) Rapid Bow +1
                    4224,   5000,       -- (Ammunition) Demon Arrow Quiver
                    15231,  50000,      -- (Head) Gallant Coronet +1
                    14479,  50000,      -- (Body) Gallant Surcoat +1
                    14896,  50000,      -- (Hands) Gallant Gauntlets +1
                    15567,  50000,      -- (Legs) Gallant Breeches +1
                    15358,  50000,      -- (Feet) Gallant Leggings +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15887,  10000,      -- (Waist) Resolute Belt
                    13691,  10000,      -- (Back) Knightly Mantle
                    14758,  10000,      -- (Earring) Knightly Earring
                    16009,  10000,      -- (Earring) Pennon Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_PLD =
                {
                    17664,  40000,      -- (Sword) Firmament +1
                    16163,  40000,      -- (Shield) Januwiyah +1
                    18682,  40000,      -- (Archery) Lamian Kaman +1
                    5819,   7500,       -- (Ammunition) Antlion Arrow Quiver
                    11070,  50000,      -- (Head) Creed Armet +2
                    11090,  50000,      -- (Body) Creed Cuirass +2
                    11110,  50000,      -- (Hands) Creed Gauntlets +2
                    11130,  50000,      -- (Legs) Creed Cuisses +2
                    11150,  50000,      -- (Feet) Creed Sabatons +2
                    11595,  50000,      -- (Neck) Creed Collar
                    11709,  50000,      -- (Earring) Creed Earring
                    11750,  50000,      -- (Waist) Creed Baudrier
                    10656,  50000,      -- (Head) Valor Coronet +2
                    10676,  50000,      -- (Body) Valor Surcoat +2
                    10696,  50000,      -- (Hands) Valor Gauntlets +2
                    10716,  50000,      -- (Legs) Valor Breeches +2
                    10736,  50000,      -- (Feet) Valor Leggings +2
                    10929,  30000,      -- (Neck) Apathy Gorget
                    15895,  30000,      -- (Waist) Trance Belt (AH price)
                    16216,  30000,      -- (Back) Cerberus Mantle +1
                    11680,  30000,      -- (Earring) Soil Earring
                    14634,  30000,      -- (Ring) Soil Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_PLD =
                {
                    20743,  100000,     -- (Sword) Bihkah Sword +1
                    28668,  100000,     -- (Shield) Matamata Shield +1
                    19785,  100000,     -- (Archery) Lanner Bow +1
                    6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
                    10442,  300000,     -- (Head) Laeradr Helm
                    10280,  300000,     -- (Body) Laeradr Breastplate
                    10435,  100000,     -- (Head) Dux Visor +1
                    10273,  100000,     -- (Body) Dux Scale Mail +1
                    10317,  100000,     -- (Hands) Dux Finger Gauntlets +1
                    10347,  100000,     -- (Legs) Dux Cuisses +1
                    10364,  100000,     -- (Feet) Dux Greaves +1
                    11070,  50000,      -- (Head) Creed Armet +2
                    11090,  50000,      -- (Body) Creed Cuirass +2
                    11110,  50000,      -- (Hands) Creed Gauntlets +2
                    11130,  50000,      -- (Legs) Creed Cuisses +2
                    11150,  50000,      -- (Feet) Creed Sabatons +2
                    11595,  50000,      -- (Neck) Creed Collar
                    11709,  50000,      -- (Earring) Creed Earring
                    11750,  50000,      -- (Waist) Creed Baudrier
                    10656,  50000,      -- (Head) Valor Coronet +2
                    10676,  50000,      -- (Body) Valor Surcoat +2
                    10696,  50000,      -- (Hands) Valor Gauntlets +2
                    10716,  50000,      -- (Legs) Valor Breeches +2
                    10736,  50000,      -- (Feet) Valor Leggings +2
                    -- 25453,   50000,      -- (Neck) Knight's Bead Necklace
                    10819,  50000,      -- (Waist) Flume Belt
                    10996,  50000,      -- (Back) Testudo Mantle
                    11050,  50000,      -- (Earring) Puissant Pearl
                    11039,  50000,      -- (Earring) Brachyura Earring
                    10798,  50000,      -- (Ring) Eihwaz Ring
                    28577,  50000,      -- (Ring) Kunaji Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_PLD)
    elseif (job == xi.job.DRK) then
        local stock_DRK = {}
        player:PrintToPlayer(string.format("Andreine : I know you're always hungry for more souls as a Dark Knight but don't forget to eat food too!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_DRK =
                {
                    16778,  5000,       -- (Scythe) Bronze Zaghnal +1
                    16606,  5000,       -- (Great Sword) Rusty Greatsword
                    16637,  5000,       -- (Great Sword) Deathbringer
                    16716,  5000,       -- (Great Axe) Butterfly Axe +1
                    17228,  5000,       -- (Marksmanship) Light Crossbow +1
                    4227,   200,        -- (Ammunition) Bronze Bolt Quiver
                    12784,  2000,       -- (Gloves) Leather Gloves +1
                    12908,  2000,       -- (Legs) Leather Trousers +1
                    12971,  2000,       -- (Feet) Leather Highboots +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_DRK =
                {
                    16797,  15000,      -- (Scythe) Mythril Zaghnal +1
                    16936,  15000,      -- (Great Sword) Demonic Sword
                    17229,  15000,      -- (Marksmanship) Zamburak +1
                    4228,   2000,       -- (Ammunition) Mythril Bolt Quiver
                    12533,  10000,      -- (Head) Silver Mask +1
                    12666,  10000,      -- (Body) Silver Mail +1
                    12772,  10000,      -- (Hands) Silver Mittens +1
                    12894,  10000,      -- (Legs) Silver Hose +1
                    13029,  10000,      -- (Feet) Silver Greaves +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_DRK =
                {
                    16790,  25000,      -- (Scythe) Darksteel Scythe +1
                    16616,  25000,      -- (Great Sword) Zweihander +1
                    17227,  25000,      -- (Marksmanship) Heavy Crossbow +1
                    4229,   5000,       -- (Ammunition) Darksteel Bolt Quiver
                    15232,  50000,      -- (Head) Chaos Burgeonet +1
                    14480,  50000,      -- (Body) Chaos Cuirass +1
                    14897,  50000,      -- (Hands) Chaos Gauntlets +1
                    15568,  50000,      -- (Legs) Chaos Flanchard +1
                    15359,  50000,      -- (Feet) Chaos Sollerets +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13403,  10000,      -- (Earring) Assault Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_DRK =
                {
                    18965,  40000,      -- (Scythe) Dire Scythe +1
                    19166,  40000,      -- (Great Sword) Cratus Sword +1
                    19266,  40000,      -- (Marksmanship) Darkwing +1
                    5821,   7500,       -- (Ammunition) Fusion Bolt Quiver
                    11071,  50000,      -- (Head) Bale Burgeonet +2
                    11091,  50000,      -- (Body) Bale Cuirass +2
                    11111,  50000,      -- (Hands) Bale Gauntlets +2
                    11131,  50000,      -- (Legs) Bale Flanchard +2
                    11151,  50000,      -- (Feet) Bale Sollerets +2
                    11616,  50000,      -- (Neck) Bale Choker
                    11710,  50000,      -- (Earring) Bale Earring
                    11737,  50000,      -- (Waist) Bale Belt
                    10657,  50000,      -- (Head) Abyss Burgeonet +2
                    10677,  50000,      -- (Body) Abyss Cuirass +2
                    10697,  50000,      -- (Hands) Abyss Gauntlets +2
                    10717,  50000,      -- (Legs) Abyss Flanchard +2
                    10737,  50000,      -- (Feet) Abyss Sollerets +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_DRK =
                {
                    18916,  300000,     -- (Sword) Heimdall's Doom
                    20923,  100000,     -- (Scythe) Aak'ab Scythe +1
                    20788,  100000,     -- (Great Sword) Hatzoaar Sword +1
                    19266,  40000,      -- (Marksmanship) Darkwing +1
                    6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
                    10442,  300000,     -- (Head) Laeradr Helm
                    10280,  300000,     -- (Body) Laeradr Breastplate
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11071,  50000,      -- (Head) Bale Burgeonet +2
                    11091,  50000,      -- (Body) Bale Cuirass +2
                    11111,  50000,      -- (Hands) Bale Gauntlets +2
                    11131,  50000,      -- (Legs) Bale Flanchard +2
                    11151,  50000,      -- (Feet) Bale Sollerets +2
                    11616,  50000,      -- (Neck) Bale Choker
                    11710,  50000,      -- (Earring) Bale Earring
                    11737,  50000,      -- (Waist) Bale Belt
                    10657,  50000,      -- (Head) Abyss Burgeonet +2
                    10677,  50000,      -- (Body) Abyss Cuirass +2
                    10697,  50000,      -- (Hands) Abyss Gauntlets +2
                    10717,  50000,      -- (Legs) Abyss Flanchard +2
                    10737,  50000,      -- (Feet) Abyss Sollerets +2
                    -- 25459,   50000,      -- (Neck) Abyssal Bead Necklace
                    10831,  50000,      -- (Waist) Paewr Belt
                    10819,  50000,      -- (Waist) Flume Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_DRK)
    elseif (job == xi.job.BST) then
        local stock_BST = {}
        player:PrintToPlayer(string.format("Andreine : You're lucky to always have a friend as a Beastmaster! I miss my pets..."),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_BST =
                {
                    16646,  5000,       -- (Axe) Bronze Axe +1
                    16778,  5000,       -- (Scythe) Bronze Zaghnal +1
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13072,  2000,       -- (Neck) Bird Whistle
                    13110,  2000,       -- (Neck) Beast Whistle
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_BST =
                {
                    16664,  15000,      -- (Axe) War Pick +1
                    12335,  10000,      -- (Shield) Targe +1
                    16797,  15000,      -- (Scythe) Mythril Zaghnal +1
                    12533,  10000,      -- (Head) Silver Mask +1
                    12666,  10000,      -- (Body) Silver Mail +1
                    12772,  10000,      -- (Hands) Silver Mittens +1
                    12894,  10000,      -- (Legs) Silver Hose +1
                    13029,  10000,      -- (Feet) Silver Greaves +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_BST =
                {
                    16682,  25000,      -- (Axe) Darksteel Pick +1
                    12353,  25000,      -- (Shield) Gilt Buckler
                    18962,  25000,      -- (Scythe) Rusty Zaghnal
                    15233,  50000,      -- (Head) Beast Helm +1
                    14481,  50000,      -- (Body) Beast Jackcoat +1
                    14898,  50000,      -- (Hands) Beast Gloves +1
                    15569,  50000,      -- (Legs) Beast Trousers +1
                    15360,  50000,      -- (Feet) Beast Gaiters +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13403,  10000,      -- (Earring) Assault Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_BST =
                {
                    16662,  40000,      -- (Axe) Doom Tabar +1
                    12386,  40000,      -- (Shield) Acheron Shield +1
                    18963,  40000,      -- (Scythe) Gleaming Zaghnal
                    11072,  50000,      -- (Head) Ferine Cabasset +2
                    11092,  50000,      -- (Body) Ferine Gausape +2
                    11112,  50000,      -- (Hands) Ferine Manoplas +2
                    11132,  50000,      -- (Legs) Ferine Quijotes +2
                    11152,  50000,      -- (Feet) Ferine Ocreae +2
                    11617,  50000,      -- (Neck) Ferine Necklace
                    11711,  50000,      -- (Earring) Ferine Earring
                    11555,  50000,      -- (Back) Ferine Mantle
                    10658,  50000,      -- (Head) Monster Helm +2
                    10678,  50000,      -- (Body) Monster Jackcoat +2
                    10698,  50000,      -- (Hands) Monster Gloves +2
                    10718,  50000,      -- (Legs) Monster Trousers +2
                    10738,  50000,      -- (Feet) Monster Gaiters +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_BST =
                {
                    20832,  65000,      -- (Axe) Aalak' Axe +1
                    28668,  100000,     -- (Shield) Matamata Shield +1
                    18562,  100000,     -- (Scythe) Yhatdhara +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11072,  50000,      -- (Head) Ferine Cabasset +2
                    11092,  50000,      -- (Body) Ferine Gausape +2
                    11112,  50000,      -- (Hands) Ferine Manoplas +2
                    11132,  50000,      -- (Legs) Ferine Quijotes +2
                    11152,  50000,      -- (Feet) Ferine Ocreae +2
                    11617,  50000,      -- (Neck) Ferine Necklace
                    11711,  50000,      -- (Earring) Ferine Earring
                    11555,  50000,      -- (Back) Ferine Mantle
                    10658,  50000,      -- (Head) Monster Helm +2
                    10678,  50000,      -- (Body) Monster Jackcoat +2
                    10698,  50000,      -- (Hands) Monster Gloves +2
                    10718,  50000,      -- (Legs) Monster Trousers +2
                    10738,  50000,      -- (Feet) Monster Gaiters +2
                    -- 25465,   50000,      -- (Neck) Beastmaster Collar
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_BST)
    elseif (job == xi.job.BRD) then
        local stock_BRD = {}
        player:PrintToPlayer(string.format("Andreine : Your audiences will expect only the finest from their Bard!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_BRD =
                {
                    16610,  5000,       -- (Sword) Wax Sword +1
                    16491,  5000,       -- (Dagger) Bronze Knife +1
                    16492,  5000,       -- (Dagger) Bronze Dagger +1
                    17372,  5000,       -- (Wind Instrument) Flute +1
                    17373,  5000,       -- (String Instrument) Maple Harp +1
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13072,  2000,       -- (Neck) Bird Whistle
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13605,  2000,       -- (Back) Cape +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_BRD =
                {
                    16815,  15000,      -- (Sword) Mythril Degen +1
                    17375,  10000,      -- (Wind Instrument) Traversiere +1
                    17376,  10000,      -- (String Instrument) Rose Harp +1
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_BRD =
                {
                    16618,  25000,      -- (Sword) Mailbreaker +1
                    17832,  15000,      -- (Wind Instrument) Shofar +1
                    17833,  15000,      -- (String Instrument) Ebony Harp +1
                    15234,  50000,      -- (Head) Choral Roundlet +1
                    14482,  50000,      -- (Body) Choral Justaucorps +1
                    14899,  50000,      -- (Hands) Choral Cuffs +1
                    15570,  50000,      -- (Legs) Choral Cannions +1
                    15361,  50000,      -- (Feet) Choral Slippers +1
                    15524,  10000,      -- (Neck) Fortified Chain
                    15525,  10000,      -- (Neck) Grandiose Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15887,  10000,      -- (Neck) Resolute Belt
                    15490,  10000,      -- (Back) Miraculous Cape
                    16009,  10000,      -- (Earring) Pennon Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_BRD =
                {
                    17719,  40000,      -- (Sword) Mensur Epee
                    11073,  50000,      -- (Head) Aoidos' Calot +2
                    11093,  50000,      -- (Body) Aoidos' Hongreline +2
                    11113,  50000,      -- (Hands) Aoidos' Manchettes +2
                    11133,  50000,      -- (Legs) Aoidos' Rhingrave +2
                    11153,  50000,      -- (Feet) Aoidos' Cothurnes +2
                    11618,  50000,      -- (Neck) Aoidos' Matinee
                    11712,  50000,      -- (Earring) Aoidos' Earring
                    11738,  50000,      -- (Waist) Aoidos' Belt
                    10659,  50000,      -- (Head) Bard's Roundlet +2
                    10679,  50000,      -- (Body) Bard's Justaucorps +2
                    10699,  50000,      -- (Hands) Bard's Cuffs +2
                    10719,  50000,      -- (Legs) Bard's Cannions +2
                    10739,  50000,      -- (Feet) Bard's Slippers +2
                    11608,  30000,      -- (Neck) Barcarolle Medal
                    11745,  30000,      -- (Waist) Aristo Belt
                    11563,  30000,      -- (Back) Mesmeric Cape
                    11724,  30000,      -- (Earring) Reverie Earring +1
                    14643,  30000,      -- (Ring) Apollo's Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_BRD =
                {
                    20743,  100000,     -- (Sword) Bihkah Sword +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11073,  50000,      -- (Head) Aoidos' Calot +2
                    11093,  50000,      -- (Body) Aoidos' Hongreline +2
                    11113,  50000,      -- (Hands) Aoidos' Manchettes +2
                    11133,  50000,      -- (Legs) Aoidos' Rhingrave +2
                    11153,  50000,      -- (Feet) Aoidos' Cothurnes +2
                    11618,  50000,      -- (Neck) Aoidos' Matinee
                    11712,  50000,      -- (Earring) Aoidos' Earring
                    11738,  50000,      -- (Waist) Aoidos' Belt
                    10659,  50000,      -- (Head) Bard's Roundlet +2
                    10679,  50000,      -- (Body) Bard's Justaucorps +2
                    10699,  50000,      -- (Hands) Bard's Cuffs +2
                    10719,  50000,      -- (Legs) Bard's Cannions +2
                    10739,  50000,      -- (Feet) Bard's Slippers +2
                    -- 25471,   50000,      -- (Neck) Bard's Charm
                    10826,  50000,      -- (Waist) Witful Belt
                    11012,  50000,      -- (Back) Gwyddion's Cape
                    11036,  50000,      -- (Earring) Enchanter's Earring
                    11701,  50000,      -- (Earring) Skald Breloque
                    -- 27576,   50000,      -- (Ring) Carbuncle Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_BRD)
    elseif (job == xi.job.RNG) then
        local stock_RNG = {}
        player:PrintToPlayer(string.format("Andreine : I had no idea there were so many types of ranged weapons! How do you Rangers choose?"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_RNG =
                {
                    16610,  5000,       -- (Sword) Wax Sword +1
                    16491,  5000,       -- (Dagger) Bronze Knife +1
                    16492,  5000,       -- (Dagger) Bronze Dagger +1
                    17175,  5000,       -- (Archery) Shortbow +1
                    17177,  5000,       -- (Archery) Longbow +1
                    17228,  5000,       -- (Marksmanship) Light Crossbow +1
                    19225,  5000,       -- (Marksmanship) Musketoon +1
                    4219,   200,        -- (Ammunition) Stone Arrow Quiver
                    4227,   200,        -- (Ammunition) Bronze Bolt Quiver
                    5359,   200,        -- (Ammunition) Bronze Bullet Pouch
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13060,  2000,       -- (Neck) Feather Collar +1
                    13117,  2000,       -- (Neck) Ranger's Necklace
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_RNG =
                {
                    19106,  10000,      -- (Dagger) Thug's Jambiya +1
                    17180,  15000,      -- (Archery) Great Bow +1
                    17229,  15000,      -- (Marksmanship) Zamburak +1
                    17260,  15000,      -- (Marksmanship) Pirate's Gun +1
                    4222,   2000,       -- (Ammunition) Horn Arrow Quiver
                    4228,   2000,       -- (Ammunition) Mythril Bolt Quiver
                    5363,   2000,       -- (Ammunition) Bullet Pouch
                    15161,  10000,      -- (Head) Noct Beret
                    14422,  10000,      -- (Body) Noct Doublet
                    14854,  10000,      -- (Hands) Noct Gloves
                    14323,  10000,      -- (Legs) Noct Brais
                    15311,  10000,      -- (Feet) Noct Gaiters
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_RNG =
                {
                    17603,  15000,      -- (Dagger) Cermet Kukri +1
                    17189,  25000,      -- (Archery) Rapid Bow +1
                    17227,  25000,      -- (Marksmanship) Heavy Crossbow +1
                    19227,  25000,      -- (Marksmanship) Blunderbuss +1
                    4224,   5000,       -- (Ammunition) Demon Arrow Quiver
                    4229,   5000,       -- (Ammunition) Darksteel Bolt Quiver
                    5353,   5000,       -- (Ammunition) Iron Bullet Pouch
                    15235,  50000,      -- (Head) Hunter's Beret +1
                    14483,  50000,      -- (Body) Hunter's Jerkin +1
                    14900,  50000,      -- (Hands) Hunter's Bracers +1
                    15571,  50000,      -- (Legs) Hunter's Braccae +1
                    15362,  50000,      -- (Feet) Hunter's Socks +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_RNG =
                {
                    16481,  35000,      -- (Dagger) Yataghan +1
                    18701,  40000,      -- (Archery) Cerberus Bow +1
                    19266,  40000,      -- (Marksmanship) Darkwing +1
                    19268,  40000,      -- (Marksmanship) Ribauldequin +1
                    5819,   7500,       -- (Ammunition) Antlion Arrow Quiver
                    5821,   7500,       -- (Ammunition) Fusion Bolt Quiver
                    5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
                    11074,  50000,      -- (Head) Sylvan Gapette +2
                    11094,  50000,      -- (Body) Sylvan Caban +2
                    11114,  50000,      -- (Hands) Sylvan Glovelettes +2
                    11134,  50000,      -- (Legs) Sylvan Bragues +2
                    11154,  50000,      -- (Feet) Sylvan Bottillons +2
                    11596,  50000,      -- (Neck) Sylvan Scarf
                    11713,  50000,      -- (Earring) Sylvan Earring
                    16205,  50000,      -- (Back) Sylvan Chlamys
                    10660,  50000,      -- (Head) Scout's Beret +2
                    10680,  50000,      -- (Body) Scout's Jerkin +2
                    10700,  50000,      -- (Hands) Scout's Bracers +2
                    10720,  50000,      -- (Legs) Scout's Braccae +2
                    10740,  50000,      -- (Feet) Scout's Socks +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11681,  30000,      -- (Earring) Breeze Earring
                    14636,  30000,      -- (Ring) Breeze Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_RNG =
                {
                    20642,  65000,      -- (Dagger) Tzustes Knife +1
                    21244,  100000,     -- (Archery) Ahkormaar Bow +1
                    21259,  100000,     -- (Marksmanship) Malayo Crossbow +1
                    21293,  100000,     -- (Marksmanship) Bandeiras Gun +1
                    6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
                    6139,   11500,      -- (Ammunition) Midrium Bolt Quiver
                    6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11074,  50000,      -- (Head) Sylvan Gapette +2
                    11094,  50000,      -- (Body) Sylvan Caban +2
                    11114,  50000,      -- (Hands) Sylvan Glovelettes +2
                    11134,  50000,      -- (Legs) Sylvan Bragues +2
                    11154,  50000,      -- (Feet) Sylvan Bottillons +2
                    11596,  50000,      -- (Neck) Sylvan Scarf
                    11713,  50000,      -- (Earring) Sylvan Earring
                    16205,  50000,      -- (Back) Sylvan Chlamys
                    10660,  50000,      -- (Head) Scout's Beret +2
                    10680,  50000,      -- (Body) Scout's Jerkin +2
                    10700,  50000,      -- (Hands) Scout's Bracers +2
                    10720,  50000,      -- (Legs) Scout's Braccae +2
                    10740,  50000,      -- (Feet) Scout's Socks +2
                    -- 25477,   50000,      -- (Neck) Scout's Gorget
                    11735,  50000,      -- (Waist) Impulse Belt
                    --26337,    50000,      -- (Waist) Kwahu Kachina Belt
                    11006,  50000,      -- (Back) Thall Mantle
                    11046,  50000,      -- (Earring) Ouesk Pearl
                    28513,  50000,      -- (Earring) Phawaylla Earring
                    11058,  50000,      -- (Ring) Hajduk Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_RNG)
    elseif (job == xi.job.SAM) then
        local stock_SAM = {}
        player:PrintToPlayer(string.format("Andreine : Well met noble Samurai! There are demons which must taste the steel of your blade."),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_SAM =
                {
                    17809,  5000,       -- (Great Katana) Mumeito
                    17177,  5000,       -- (Archery) Longbow +1
                    4219,   200,        -- (Ammunition) Stone Arrow Quiver
                    12774,  2000,       -- (Gloves) Tekko +1
                    12899,  2000,       -- (Legs) Sitabaki +1
                    13031,  2000,       -- (Feet) Kyahan +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_SAM =
                {
                    16988,  15000,      -- (Great Katana) Kotetsu
                    17180,  15000,      -- (Archery) Great Bow +1
                    4222,   2000,       -- (Ammunition) Horn Arrow Quiver
                    12539,  10000,      -- (Head) Soil Hachimaki +1
                    12671,  10000,      -- (Body) Soil Gi +1
                    12781,  10000,      -- (Hands) Soil Tekko +1
                    12905,  10000,      -- (Legs) Soil Sitabaki +1
                    13035,  10000,      -- (Feet) Soil Kyahan +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_SAM =
                {
                    16990,  25000,      -- (Great Katana) Daihannya
                    17189,  25000,      -- (Archery) Rapid Bow +1
                    4224,   5000,       -- (Ammunition) Demon Arrow Quiver
                    15236,  50000,      -- (Head) Myochin Kabuto +1
                    14484,  50000,      -- (Body) Myochin Domaru +1
                    14901,  50000,      -- (Hands) Myochin Kote +1
                    15572,  50000,      -- (Legs) Myochin Haidate +1
                    15363,  50000,      -- (Feet) Myochin Sune-Ate +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_SAM =
                {
                    16977,  40000,      -- (Great Katana) Yukitsugu +1
                    18701,  40000,      -- (Archery) Cerberus Bow +1
                    5819,   7500,       -- (Ammunition) Antlion Arrow Quiver
                    11075,  50000,      -- (Head) Unkai Kabuto +2
                    11095,  50000,      -- (Body) Unkai Domaru +2
                    11115,  50000,      -- (Hands) Unkai Kote +2
                    11135,  50000,      -- (Legs) Unkai Haidate +2
                    11155,  50000,      -- (Feet) Unkai Sune-Ate +2
                    11597,  50000,      -- (Neck) Unkai Nodowa
                    11714,  50000,      -- (Earring) Unkai Mimikazari
                    16206,  50000,      -- (Back) Unkai Sugemino
                    10661,  50000,      -- (Head) Saotome Kabuto +2
                    10681,  50000,      -- (Body) Saotome Domaru +2
                    10701,  50000,      -- (Hands) Saotome Kote +2
                    10721,  50000,      -- (Legs) Saotome Haidate +2
                    10741,  50000,      -- (Feet) Saotome Sune-Ate +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_SAM =
                {
                    21057,  100000,     -- (Great Katana) Tomonari +1
                    19787,  100000,     -- (Archery) Nurigomeyumi +1
                    6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11075,  50000,      -- (Head) Unkai Kabuto +2
                    11095,  50000,      -- (Body) Unkai Domaru +2
                    11115,  50000,      -- (Hands) Unkai Kote +2
                    11135,  50000,      -- (Legs) Unkai Haidate +2
                    11155,  50000,      -- (Feet) Unkai Sune-Ate +2
                    11597,  50000,      -- (Neck) Unkai Nodowa
                    11714,  50000,      -- (Earring) Unkai Mimikazari
                    16206,  50000,      -- (Back) Unkai Sugemino
                    10661,  50000,      -- (Head) Saotome Kabuto +2
                    10681,  50000,      -- (Body) Saotome Domaru +2
                    10701,  50000,      -- (Hands) Saotome Kote +2
                    10721,  50000,      -- (Legs) Saotome Haidate +2
                    10741,  50000,      -- (Feet) Saotome Sune-Ate +2
                    -- 25483,   50000,      -- (Neck) Samurai's Nodowa
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_SAM)
    elseif (job == xi.job.NIN) then
        local stock_NIN = {}
        player:PrintToPlayer(string.format("Andreine : Oh! You Ninjas always startle me when you appear out of nowhere like that!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_NIN =
                {
                    16914,  5000,       -- (Katana) Kunai +1
                    17307,  2,          -- (Throwing) Dart
                    6299,   500,        -- (Throwing) Shuriken Pouch
                    12774,  2000,       -- (Gloves) Tekko +1
                    12899,  2000,       -- (Legs) Sitabaki +1
                    13031,  2000,       -- (Feet) Kyahan +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_NIN =
                {
                    16921,  10000,      -- (Katana) Kodachi +1
                    6297,   2000,       -- (Throwing) Juji Shuriken Pouch
                    12539,  10000,      -- (Head) Soil Hachimaki +1
                    12671,  10000,      -- (Body) Soil Gi +1
                    12781,  10000,      -- (Hands) Soil Tekko +1
                    12905,  10000,      -- (Legs) Soil Sitabaki +1
                    13035,  10000,      -- (Feet) Soil Kyahan +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_NIN =
                {
                    16923,  15000,      -- (Katana) Kabutowari +1
                    6302,   5000,       -- (Throwing) Fuma Shuriken Pouch
                    15237,  50000,      -- (Head) Ninja Hatsuburi +1
                    14485,  50000,      -- (Body) Ninja Chainmail +1
                    14902,  50000,      -- (Hands) Ninja Tekko +1
                    15573,  50000,      -- (Legs) Ninja Hakama +1
                    15364,  50000,      -- (Feet) Ninja Kyahan +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_NIN =
                {
                    19286,  35000,      -- (Katana) Kakko +1
                    6300,   7500,       -- (Throwing) Koga Shuriken Pouch
                    11076,  50000,      -- (Head) Iga Zukin +2
                    11096,  50000,      -- (Body) Iga Ningi +2
                    11116,  50000,      -- (Hands) Iga Tekko +2
                    11136,  50000,      -- (Legs) Iga Hakama +2
                    11156,  50000,      -- (Feet) Iga Kyahan +2
                    11598,  50000,      -- (Neck) Iga Erimaki
                    11715,  50000,      -- (Earring) Iga Mimikazari
                    16207,  50000,      -- (Back) Iga Dochugappa
                    10662,  50000,      -- (Head) Koga Hatsuburi +2
                    10682,  50000,      -- (Body) Koga Chainmail +2
                    10702,  50000,      -- (Hands) Koga Tekko +2
                    10722,  50000,      -- (Legs) Koga Hakama +2
                    10742,  50000,      -- (Feet) Koga Kyahan +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_NIN =
                {
                    21010,  65000,      -- (Katana) Nakajimarai +1
                    6304,   12000,      -- (Throwing) Roppo Shuriken Pouch
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11076,  50000,      -- (Head) Iga Zukin +2
                    11096,  50000,      -- (Body) Iga Ningi +2
                    11116,  50000,      -- (Hands) Iga Tekko +2
                    11136,  50000,      -- (Legs) Iga Hakama +2
                    11156,  50000,      -- (Feet) Iga Kyahan +2
                    11598,  50000,      -- (Neck) Iga Erimaki
                    11715,  50000,      -- (Earring) Iga Mimikazari
                    16207,  50000,      -- (Back) Iga Dochugappa
                    10662,  50000,      -- (Head) Koga Hatsuburi +2
                    10682,  50000,      -- (Body) Koga Chainmail +2
                    10702,  50000,      -- (Hands) Koga Tekko +2
                    10722,  50000,      -- (Legs) Koga Hakama +2
                    10742,  50000,      -- (Feet) Koga Kyahan +2
                    -- 25489,   50000,      -- (Neck) Ninja Nodowa
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    28492,  50000,      -- (Earring) Hibernation Earring
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_NIN)
    elseif (job == xi.job.DRG) then
        local stock_DRG = {}
        player:PrintToPlayer(string.format("Andreine : It's so good to see a Dragoon again! Give your wyvern a special treat from me!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_DRG =
                {
                    16862,  5000,       -- (Polearm) Harpoon +1
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_DRG =
                {
                    16876,  15000,      -- (Polearm) Lance +1
                    13824,  10000,      -- (Head) Strong Bandana
                    13707,  10000,      -- (Body) Strong Vest
                    12786,  10000,      -- (Hands) Strong Gloves
                    12910,  10000,      -- (Legs) Strong Trousers
                    13039,  10000,      -- (Feet) Strong Boots
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_DRG =
                {
                    18119,  25000,      -- (Polearm) Dark Mezraq +1
                    18259,  200,        -- (Ammunition) Angon
                    15238,  50000,      -- (Head) Drachen Armet +1
                    14486,  50000,      -- (Body) Drachen Mail +1
                    14903,  50000,      -- (Hands) Drachen Finger Gauntlets +1
                    15574,  50000,      -- (Legs) Drachen Brais +1
                    15365,  50000,      -- (Feet) Drachen Greaves +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13403,  10000,      -- (Earring) Assault Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_DRG =
                {
                    18111,  40000,      -- (Polearm) Mezraq +1
                    18259,  200,        -- (Ammunition) Angon
                    11077,  50000,      -- (Head) Lancer's Mezail +2
                    11097,  50000,      -- (Body) Lancer's Plackart +2
                    11117,  50000,      -- (Hands) Lancer's Vambraces +2
                    11137,  50000,      -- (Legs) Lancer's Cuissots +2
                    11157,  50000,      -- (Feet) Lancer's Schynbalds +2
                    11599,  50000,      -- (Neck) Lancer's Torque
                    11716,  50000,      -- (Earring) Lancer's Earring
                    16208,  50000,      -- (Back) Lancer's Pelerine
                    10663,  50000,      -- (Head) Wyrm Armet +2
                    10683,  50000,      -- (Body) Wyrm Mail +2
                    10703,  50000,      -- (Hands) Wyrm Finger Gauntlets +2
                    10723,  50000,      -- (Legs) Wyrm Brais +2
                    10743,  50000,      -- (Feet) Wyrm Greaves +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_DRG =
                {
                    19799,  300000,     -- (Polearm) Herja's Fork
                    20968,  100000,     -- (Polearm) Chanar Xyston +1
                    18259,  200,        -- (Ammunition) Angon
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11077,  50000,      -- (Head) Lancer's Mezail +2
                    11097,  50000,      -- (Body) Lancer's Plackart +2
                    11117,  50000,      -- (Hands) Lancer's Vambraces +2
                    11137,  50000,      -- (Legs) Lancer's Cuissots +2
                    11157,  50000,      -- (Feet) Lancer's Schynbalds +2
                    11599,  50000,      -- (Neck) Lancer's Torque
                    11716,  50000,      -- (Earring) Lancer's Earring
                    16208,  50000,      -- (Back) Lancer's Pelerine
                    10663,  50000,      -- (Head) Wyrm Armet +2
                    10683,  50000,      -- (Body) Wyrm Mail +2
                    10703,  50000,      -- (Hands) Wyrm Finger Gauntlets +2
                    10723,  50000,      -- (Legs) Wyrm Brais +2
                    10743,  50000,      -- (Feet) Wyrm Greaves +2
                    -- 25495,   50000,      -- (Neck) Dragoon's Collar
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_DRG)
    elseif (job == xi.job.SMN) then
        local stock_SMN = {}
        player:PrintToPlayer(string.format("Andreine : Greetings noble Summoner! Are all of the avatars getting along today?"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_SMN =
                {
                    17123,  5000,       -- (Staff) Ash Staff +1
                    17122,  5000,       -- (Staff) Ash Pole +1
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13093,  2000,       -- (Neck) Justice Badge
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13605,  2000,       -- (Back) Cape +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13440,  2000,       -- (Ring) Ascetic's Ring
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_SMN =
                {
                    17534,  15000,      -- (Staff) Whale Staff +1
                    17119,  15000,      -- (Staff) Elm Pole +1
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13233,  5000,       -- (Waist) Gold Obi +1
                    13618,  5000,       -- (Back) White Cape +1
                    14702,  5000,       -- (Earring) Aura Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_SMN =
                {
                    17520,  25000,      -- (Staff) Heavy Staff +1
                    17521,  25000,      -- (Staff) Mahogany Pole +1
                    15239,  50000,      -- (Head) Evoker's Horn +1
                    14487,  50000,      -- (Body) Evoker's Doublet +1
                    14904,  50000,      -- (Hands) Evoker's Bracers +1
                    15575,  50000,      -- (Legs) Evoker's Spats +1
                    15366,  50000,      -- (Feet) Evoker's Pigaches +1
                    15887,  10000,      -- (Neck) Resolute Belt
                    15885,  10000,      -- (Neck) Spectral Belt
                    15490,  10000,      -- (Back) Miraculous Cape
                    15971,  10000,      -- (Earring) Antivenom Earring
                    15972,  10000,      -- (Earring) Insomnia Earring
                    15776,  10000,      -- (Ring) Ebullient Ring
                    15777,  10000,      -- (Ring) Hale Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_SMN =
                {
                    17578,  40000,      -- (Staff) Zen Pole
                    17277,  20000,      -- (Ammunition) Hedgehog Bomb
                    11078,  50000,      -- (Head) Caller's Horn +2
                    11098,  50000,      -- (Body) Caller's Doublet +2
                    11118,  50000,      -- (Hands) Caller's Bracers +2
                    11138,  50000,      -- (Legs) Caller's Spats +2
                    11158,  50000,      -- (Feet) Caller's Pigaches +2
                    11619,  50000,      -- (Neck) Caller's Pendant
                    11717,  50000,      -- (Earring) Caller's Earring
                    11739,  50000,      -- (Back) Caller's Sash
                    10664,  50000,      -- (Head) Summoner's Horn +2
                    10684,  50000,      -- (Body) Summoner's Doublet +2
                    10704,  50000,      -- (Hands) Summoner's Bracers +2
                    10724,  50000,      -- (Legs) Summoner's Spats +2
                    10744,  50000,      -- (Feet) Summoner's Pigaches +2
                    11579,  30000,      -- (Neck) Fylgja Torque
                    15949,  30000,      -- (Waist) Pythia Sash +1
                    11564,  30000,      -- (Back) Tiresias' Cape
                    11685,  30000,      -- (Earring) Darkness Earring
                    14644,  30000,      -- (Ring) Dark Ring
                    14625,  100000,     -- (Ring) Evoker's Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_SMN =
                {
                    21208,  100000,     -- (Staff) Lehbrailg
                    19780,  30000,      -- (Ammunition) Mana Ampulla
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11078,  50000,      -- (Head) Caller's Horn +2
                    11098,  50000,      -- (Body) Caller's Doublet +2
                    11118,  50000,      -- (Hands) Caller's Bracers +2
                    11138,  50000,      -- (Legs) Caller's Spats +2
                    11158,  50000,      -- (Feet) Caller's Pigaches +2
                    11619,  50000,      -- (Neck) Caller's Pendant
                    11717,  50000,      -- (Earring) Caller's Earring
                    11739,  50000,      -- (Back) Caller's Sash
                    10664,  50000,      -- (Head) Summoner's Horn +2
                    10684,  50000,      -- (Body) Summoner's Doublet +2
                    10704,  50000,      -- (Hands) Summoner's Bracers +2
                    10724,  50000,      -- (Legs) Summoner's Spats +2
                    10744,  50000,      -- (Feet) Summoner's Pigaches +2
                    -- 25501,   50000,      -- (Neck) Summoner's Collar
                    10842,  50000,      -- (Waist) Bougonia Rope
                    27607,  50000,      -- (Back) Thaumaturge's Cape
                    11021,  30000,      -- (Earring) Darkness Pearl
                    -- 27578,   30000,      -- (Ring) Fenrir Ring
                    14625,  100000,     -- (Ring) Evoker's Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_SMN)
    elseif (job == xi.job.BLU) then
        local stock_BLU = {}
        player:PrintToPlayer(string.format("Andreine : You may know the secrets of monster techniques Blue Mage but I have the gear you'll need!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_BLU =
                {
                    16610,  5000,       -- (Sword) Wax Sword +1
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_BLU =
                {
                    17740,  15000,      -- (Sword) Steel Kilij +1
                    15173,  10000,      -- (Head) Kosshin
                    13730,  10000,      -- (Body) Frost Robe
                    12750,  10000,      -- (Hands) New Moon Armlets
                    12904,  10000,      -- (Legs) Linen Slacks +1
                    13040,  10000,      -- (Feet) Shoes +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13506,  5000,       -- (Ring) Bomb Ring
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_BLU =
                {
                    17639,  25000,      -- (Sword) Cutlass +1
                    11464,  50000,      -- (Head) Magus Keffiyeh +1
                    11291,  50000,      -- (Body) Magus Jubbah +1
                    15024,  50000,      -- (Hands) Magus Bazubands +1
                    16345,  50000,      -- (Legs) Magus Shalwar +1
                    11381,  50000,      -- (Feet) Magus Charuqs +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15887,  10000,      -- (Waist) Resolute Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_BLU =
                {
                    17664,  40000,      -- (Sword) Firmament +1
                    11079,  50000,      -- (Head) Mavi Kavuk +2
                    11099,  50000,      -- (Body) Mavi Mintan +2
                    11119,  50000,      -- (Hands) Mavi Bazubands +2
                    11139,  50000,      -- (Legs) Mavi Tayt +2
                    11159,  50000,      -- (Feet) Mavi Basmak +2
                    19255,  50000,      -- (Ammunition) Mavi Tathlum
                    11600,  50000,      -- (Neck) Mavi Scarf
                    11718,  50000,      -- (Earring) Mavi Earring
                    10665,  50000,      -- (Head) Mirage Keffiyeh +2
                    10685,  50000,      -- (Body) Mirage Jubbah +2
                    10705,  50000,      -- (Hands) Mirage Bazubands +2
                    10725,  50000,      -- (Legs) Mirage Shalwar +2
                    10745,  50000,      -- (Feet) Mirage Charuqs +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_BLU =
                {
                    18916,  300000,     -- (Sword) Heimdall's Doom
                    20743,  100000,     -- (Sword) Bihkah Sword +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11079,  50000,      -- (Head) Mavi Kavuk +2
                    11099,  50000,      -- (Body) Mavi Mintan +2
                    11119,  50000,      -- (Hands) Mavi Bazubands +2
                    11139,  50000,      -- (Legs) Mavi Tayt +2
                    11159,  50000,      -- (Feet) Mavi Basmak +2
                    19255,  50000,      -- (Ammunition) Mavi Tathlum
                    11600,  50000,      -- (Neck) Mavi Scarf
                    11718,  50000,      -- (Earring) Mavi Earring
                    10665,  50000,      -- (Head) Mirage Keffiyeh +2
                    10685,  50000,      -- (Body) Mirage Jubbah +2
                    10705,  50000,      -- (Hands) Mirage Bazubands +2
                    10725,  50000,      -- (Legs) Mirage Shalwar +2
                    10745,  50000,      -- (Feet) Mirage Charuqs +2
                    -- 25507,   50000,      -- (Neck) Mirage Stole
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_BLU)
    elseif (job == xi.job.COR) then
        local stock_COR = {}
        player:PrintToPlayer(string.format("Andreine : Ready to roll the dice Corsair? I wish you the best of luck out there!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_COR =
                {
                    16624,  5000,       -- (Sword) Xiphos +1
                    16491,  5000,       -- (Dagger) Bronze Knife +1
                    19225,  5000,       -- (Marksmanship) Musketoon +1
                    5359,   200,        -- (Ammunition) Bronze Bullet Pouch
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_COR =
                {
                    19106,  10000,      -- (Dagger) Thug's Jambiya +1
                    17260,  15000,      -- (Marksmanship) Pirate's Gun +1
                    5363,   2000,       -- (Ammunition) Bullet Pouch
                    15161,  10000,      -- (Head) Noct Beret
                    14422,  10000,      -- (Body) Noct Doublet
                    14854,  10000,      -- (Hands) Noct Gloves
                    14323,  10000,      -- (Legs) Noct Brais
                    15311,  10000,      -- (Feet) Noct Gaiters
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_COR =
                {
                    17603,  15000,      -- (Dagger) Cermet Kukri +1
                    19227,  25000,      -- (Marksmanship) Blunderbuss +1
                    5353,   5000,       -- (Ammunition) Iron Bullet Pouch
                    11467,  50000,      -- (Head) Corsair's Tricorne +1
                    11294,  50000,      -- (Body) Corsair's Frac +1
                    15027,  50000,      -- (Hands) Corsair's Gants +1
                    16348,  50000,      -- (Legs) Corsair's Culottes +1
                    11384,  50000,      -- (Feet) Corsair's Bottes +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_COR =
                {
                    16481,  35000,      -- (Dagger) Yataghan +1
                    19268,  40000,      -- (Marksmanship) Ribauldequin +1
                    5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
                    11080,  50000,      -- (Head) Navarch's Tricorne +2
                    11100,  50000,      -- (Body) Navarch's Frac +2
                    11120,  50000,      -- (Hands) Navarch's Gants +2
                    11140,  50000,      -- (Legs) Navarch's Culottes +2
                    11160,  50000,      -- (Feet) Navarch's Bottes +2
                    11601,  50000,      -- (Neck) Navarch's Choker
                    11719,  50000,      -- (Earring) Navarch's Earring
                    16209,  50000,      -- (Back) Navarch's Mantle
                    10666,  50000,      -- (Head) Commodore Tricorne +2
                    10686,  50000,      -- (Body) Commodore Frac +2
                    10706,  50000,      -- (Hands) Commodore Gants +2
                    10726,  50000,      -- (Legs) Commodore Trews +2
                    10746,  50000,      -- (Feet) Commodore Bottes +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11681,  30000,      -- (Earring) Breeze Earring
                    14636,  30000,      -- (Ring) Breeze Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_COR =
                {
                    20642,  65000,      -- (Dagger) Tzustes Knife +1
                    21293,  100000,     -- (Marksmanship) Bandeiras Gun +1
                    6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11080,  50000,      -- (Head) Navarch's Tricorne +2
                    11100,  50000,      -- (Body) Navarch's Frac +2
                    11120,  50000,      -- (Hands) Navarch's Gants +2
                    11140,  50000,      -- (Legs) Navarch's Culottes +2
                    11160,  50000,      -- (Feet) Navarch's Bottes +2
                    11601,  50000,      -- (Neck) Navarch's Choker
                    11719,  50000,      -- (Earring) Navarch's Earring
                    16209,  50000,      -- (Back) Navarch's Mantle
                    10666,  50000,      -- (Head) Commodore Tricorne +2
                    10686,  50000,      -- (Body) Commodore Frac +2
                    10706,  50000,      -- (Hands) Commodore Gants +2
                    10726,  50000,      -- (Legs) Commodore Trews +2
                    10746,  50000,      -- (Feet) Commodore Bottes +2
                    -- 25513,   50000,      -- (Neck) Commodore Charm
                    26337,  50000,      -- (Waist) Kwahu Kachina Belt
                    11006,  50000,      -- (Back) Thall Mantle
                    11046,  50000,      -- (Earring) Ouesk Pearl
                    28513,  50000,      -- (Earring) Phawaylla Earring
                    -- 27572,   50000,      -- (Ring) Garuda Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_COR)
    elseif (job == xi.job.PUP) then
        local stock_PUP = {}
        player:PrintToPlayer(string.format("Andreine : Oh, how wonderful to see a Puppetmaster! Such finesse in controlling your puppet!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_PUP =
                {
                    17476,  5000,       -- (Hand-to-Hand) Cat Baghnakhs +1
                    17859,  1000,       -- (Ranged) Animator
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    16282,  2000,       -- (Neck) Buffoon's Collar +1
                    13226,  2000,       -- (Waist) Blood Stone +1
                    13605,  2000,       -- (Back) Cape +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_PUP =
                {
                    16445,  15000,      -- (Hand-to-Hand) Claws +1
                    17858,  5000,       -- (Ranged) Turbo Animator
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13233,  5000,       -- (Waist) Gold Obi +1
                    13643,  5000,       -- (Back) Sarcenet Cape +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_PUP =
                {
                    18751,  25000,      -- (Hand-to-Hand) Black Adargas +1
                    17857,  15000,      -- (Ranged) Animator +1
                    11470,  50000,      -- (Head) Puppetry Taj +1
                    11297,  50000,      -- (Body) Puppetry Tobe +1
                    15030,  50000,      -- (Hands) Puppetry Dastanas +1
                    16351,  50000,      -- (Legs) Puppetry Churidars +1
                    11387,  50000,      -- (Feet) Puppetry Babouches +1
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15492,  10000,      -- (Back) Intensifying Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_PUP =
                {
                    18775,  40000,      -- (Hand-to-Hand) Savate Fists +1
                    17923,  25000,      -- (Ranged) Deluxe Animator
                    19249,  20000,      -- (Ammunition) Thew Bomblet
                    11081,  50000,      -- (Head) Cirque Capello +2
                    11101,  50000,      -- (Body) Cirque Farsetto +2
                    11121,  50000,      -- (Hands) Cirque Guanti +2
                    11141,  50000,      -- (Legs) Cirque Pantaloni +2
                    11161,  50000,      -- (Feet) Cirque Scarpe +2
                    11602,  50000,      -- (Neck) Cirque Necklace
                    11720,  50000,      -- (Earring) Cirque Earring
                    11751,  50000,      -- (Waist) Cirque Sash
                    10667,  50000,      -- (Head) Pantin Taj +2
                    10687,  50000,      -- (Body) Pantin Tobe +2
                    10707,  50000,      -- (Hands) Pantin Dastanas +2
                    10727,  50000,      -- (Legs) Pantin Churidars +2
                    10747,  50000,      -- (Feet) Pantin Babouches +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_PUP =
                {
                    20552,  100000,     -- (Hand-to-Hand) Akua Sainti +1
                    17923,  25000,      -- (Ranged) Deluxe Animator
                    19249,  20000,      -- (Ammunition) Thew Bomblet
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11081,  50000,      -- (Head) Cirque Capello +2
                    11101,  50000,      -- (Body) Cirque Farsetto +2
                    11121,  50000,      -- (Hands) Cirque Guanti +2
                    11141,  50000,      -- (Legs) Cirque Pantaloni +2
                    11161,  50000,      -- (Feet) Cirque Scarpe +2
                    11602,  50000,      -- (Neck) Cirque Necklace
                    11720,  50000,      -- (Earring) Cirque Earring
                    11751,  50000,      -- (Waist) Cirque Sash
                    10667,  50000,      -- (Head) Pantin Taj +2
                    10687,  50000,      -- (Body) Pantin Tobe +2
                    10707,  50000,      -- (Hands) Pantin Dastanas +2
                    10727,  50000,      -- (Legs) Pantin Churidars +2
                    10747,  50000,      -- (Feet) Pantin Babouches +2
                    -- 25519,   50000,      -- (Neck) Puppetmaster's Collar
                    10831,  50000,      -- (Waist) Paewr Belt
                    10987,  50000,      -- (Back) Meanagh Cape
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_PUP)
    elseif (job == xi.job.DNC) then
        local stock_DNC = {}
        player:PrintToPlayer(string.format("Andreine : The graceful movements of you Dancers are always so hypnotizing!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_DNC =
                {
                    16690,  5000,       -- (Hand-to-Hand) Cesti +1
                    16491,  5000,       -- (Dagger) Bronze Knife +1
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
            xi.shop.general(player, stock_DNC)
        elseif (level <= 60) then
            stock_DNC =
                {
                    19106,  10000,      -- (Dagger) Thug's Jambiya +1
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_DNC =
                {
                    17603,  15000,      -- (Dagger) Cermet Kukri +1
                    11476,  50000,      -- (Head) Dancer's Tiara +1 (Female)
                    11303,  50000,      -- (Body) Dancer's Casaque +1 (Female)
                    15036,  50000,      -- (Hands) Dancer's Bangles +1 (Female)
                    16358,  50000,      -- (Legs) Dancer's Tights +1 (Female)
                    11394,  50000,      -- (Feet) Dancer's Toe Shoes +1 (Female)
                    11475,  50000,      -- (Head) Dancer's Tiara +1 (Male)
                    11302,  50000,      -- (Body) Dancer's Casaque +1 (Male)
                    15035,  50000,      -- (Hands) Dancer's Bangles +1 (Male)
                    16357,  50000,      -- (Legs) Dancer's Tights +1 (Male)
                    11393,  50000,      -- (Feet) Dancer's Toe Shoes +1 (Male)
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_DNC =
                {
                    16481,  35000,      -- (Dagger) Yataghan +1
                    11082,  50000,      -- (Head) Charis Tiara +2
                    11102,  50000,      -- (Body) Charis Casaque +2
                    11122,  50000,      -- (Hands) Charis Bangles +2
                    11142,  50000,      -- (Legs) Charis Tights +2
                    11162,  50000,      -- (Feet) Charis Toe Shoes +2
                    19256,  50000,      -- (Ammunition) Charis Feather
                    11603,  50000,      -- (Neck) Charis Necklace
                    11721,  50000,      -- (Earring) Charis Earring
                    10668,  50000,      -- (Head) Etoile Tiara +2
                    10688,  50000,      -- (Body) Etoile Casaque +2
                    10708,  50000,      -- (Hands) Etoile Bangles +2
                    10728,  50000,      -- (Legs) Etoile Tights +2
                    10748,  50000,      -- (Feet) Etoile Toe Shoes +2
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11679,  30000,      -- (Earring) Thunder Earring
                    14638,  30000,      -- (Ring) Thunder Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_DNC =
                {
                    20642,  65000,      -- (Dagger) Tzustes Knife +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11082,  50000,      -- (Head) Charis Tiara +2
                    11102,  50000,      -- (Body) Charis Casaque +2
                    11122,  50000,      -- (Hands) Charis Bangles +2
                    11142,  50000,      -- (Legs) Charis Tights +2
                    11162,  50000,      -- (Feet) Charis Toe Shoes +2
                    19256,  50000,      -- (Ammunition) Charis Feather
                    11603,  50000,      -- (Neck) Charis Necklace
                    11721,  50000,      -- (Earring) Charis Earring
                    10668,  50000,      -- (Head) Etoile Tiara +2
                    10688,  50000,      -- (Body) Etoile Casaque +2
                    10708,  50000,      -- (Hands) Etoile Bangles +2
                    10728,  50000,      -- (Legs) Etoile Tights +2
                    10748,  50000,      -- (Feet) Etoile Toe Shoes +2
                    -- 25525,   50000,      -- (Neck) Etoile Gorget
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_DNC)
    elseif (job == xi.job.SCH) then
        local stock_SCH = {}
        player:PrintToPlayer(string.format("Andreine : You've got the book knowledge Scholar, now you just need the gear!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_SCH =
                {
                    17087,  5000,       -- (Club) Maple Wand +1
                    17137,  5000,       -- (Club) Ash Club +1
                    17123,  5000,       -- (Staff) Ash Staff +1
                    17122,  5000,       -- (Staff) Ash Pole +1
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13093,  2000,       -- (Neck) Justice Badge
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13605,  2000,       -- (Back) Cape +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13440,  2000,       -- (Ring) Ascetic's Ring
                    13475,  2000,       -- (Ring) Hermit's Ring
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
            xi.shop.general(player, stock_SCH)
        elseif (level <= 60) then
            stock_SCH =
                {
                    17141,  15000,      -- (Club) Solid Wand
                    17409,  15000,      -- (Club) Mythril Rod +1
                    17534,  15000,      -- (Staff) Whale Staff +1
                    17119,  15000,      -- (Staff) Elm Pole +1
                    15173,  10000,      -- (Head) Kosshin
                    13730,  10000,      -- (Body) Frost Robe
                    12750,  10000,      -- (Hands) New Moon Armlets
                    12904,  10000,      -- (Legs) Linen Slacks +1
                    13040,  10000,      -- (Feet) Shoes +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13233,  5000,       -- (Waist) Gold Obi +1
                    13610,  5000,       -- (Back) Black Cape +1
                    14702,  5000,       -- (Earring) Aura Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_SCH =
                {
                    17427,  25000,      -- (Club) Ebony Wand +1
                    17435,  25000,      -- (Club) Darksteel Rod +1
                    17520,  25000,      -- (Staff) Heavy Staff +1
                    17521,  25000,      -- (Staff) Mahogany Pole +1
                    11477,  50000,      -- (Head) Scholar's Mortarboard +1
                    11304,  50000,      -- (Body) Scholar's Gown +1
                    15037,  50000,      -- (Hands) Scholar's Bracers +1
                    16359,  50000,      -- (Legs) Scholar's Pants +1
                    11395,  50000,      -- (Feet) Scholar's Loafers +1
                    15887,  10000,      -- (Neck) Resolute Belt
                    15885,  10000,      -- (Neck) Spectral Belt
                    15490,  10000,      -- (Back) Miraculous Cape
                    15971,  10000,      -- (Earring) Antivenom Earring
                    15972,  10000,      -- (Earring) Insomnia Earring
                    15776,  10000,      -- (Ring) Ebullient Ring
                    15777,  10000,      -- (Ring) Hale Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_SCH =
                {
                    17118,  40000,      -- (Staff) Lituus +1
                    17277,  20000,      -- (Ammunition) Hedgehog Bomb
                    11083,  50000,      -- (Head) Savant's Bonnet +2
                    11103,  50000,      -- (Body) Savant's Gown +2
                    11123,  50000,      -- (Hands) Savant's Bracers +2
                    11143,  50000,      -- (Legs) Savant's Pants +2
                    11163,  50000,      -- (Feet) Savant's Loafers +2
                    19247,  50000,      -- (Ammunition) Savant's Treatise
                    11620,  50000,      -- (Neck) Savant's Chain
                    11722,  50000,      -- (Earring) Savant's Earring
                    10669,  50000,      -- (Head) Argute Mortarboard +2
                    10689,  50000,      -- (Body) Argute Gown +2
                    10709,  50000,      -- (Hands) Argute Bracers +2
                    10729,  50000,      -- (Legs) Argute Pants +2
                    10749,  50000,      -- (Feet) Argute Loafers +2
                    11579,  30000,      -- (Neck) Fylgja Torque
                    11584,  30000,      -- (Neck) Lemegeton Medallion +1
                    15949,  30000,      -- (Waist) Pythia Sash +1
                    11743,  30000,      -- (Waist) Searing Sash
                    27598,  30000,      -- (Back) Dew Silk Cape +1
                    11560,  30000,      -- (Back) Pedant Cape
                    11683,  30000,      -- (Earring) Aqua Earring
                    11682,  30000,      -- (Earring) Snow Earring
                    13308,  30000,      -- (Ring) Communion Ring
                    13306,  30000,      -- (Ring) Omniscient Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_SCH =
                {
                    21133,  100000,     -- (Club) Sasah Wand +1
                    21208,  100000,     -- (Staff) Lehbrailg
                    -- 21362,   30000,      -- (Ammunition) Ombre Tathlum +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    11083,  50000,      -- (Head) Savant's Bonnet +2
                    11103,  50000,      -- (Body) Savant's Gown +2
                    11123,  50000,      -- (Hands) Savant's Bracers +2
                    11143,  50000,      -- (Legs) Savant's Pants +2
                    11163,  50000,      -- (Feet) Savant's Loafers +2
                    19247,  50000,      -- (Ammunition) Savant's Treatise
                    11620,  50000,      -- (Neck) Savant's Chain
                    11722,  50000,      -- (Earring) Savant's Earring
                    10669,  50000,      -- (Head) Argute Mortarboard +2
                    10689,  50000,      -- (Body) Argute Gown +2
                    10709,  50000,      -- (Hands) Argute Bracers +2
                    10729,  50000,      -- (Legs) Argute Pants +2
                    10749,  50000,      -- (Feet) Argute Loafers +2
                    -- 25531,   50000,      -- (Neck) Argute Stole
                    28455,  50000,      -- (Waist) Ovate Rope
                    10839,  50000,      -- (Waist) Othila Sash
                    28596,  50000,      -- (Back) Oretania's Cape +1
                    28601,  50000,      -- (Back) Seshaw Cape
                    11683,  30000,      -- (Earring) Aqua Earring
                    11682,  30000,      -- (Earring) Snow Earring
                    13308,  30000,      -- (Ring) Communion Ring
                    13306,  30000,      -- (Ring) Omniscient Ring
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_SCH)
    elseif (job == xi.job.GEO) then
        local stock_GEO = {}
        player:PrintToPlayer(string.format("Andreine : Geomancers are always so spaced out when they come in here!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_GEO =
                {
                    17087,  5000,       -- (Club) Maple Wand +1
                    17137,  5000,       -- (Club) Ash Club +1
                    17144,  5000,       -- (Club) Bronze Hammer +1
                    21460,  1000,       -- (Handbell) Matre Bell
                    12744,  2000,       -- (Gloves) Cuffs +1
                    12897,  2000,       -- (Legs) Slops +1
                    12983,  2000,       -- (Feet) Ash Clogs +1
                    13093,  2000,       -- (Neck) Justice Badge
                    13190,  2000,       -- (Waist) Heko Obi +1
                    13605,  2000,       -- (Back) Cape +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    13548,  50000,      -- (Ring) Astral Ring
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_GEO =
                {
                    17141,  15000,      -- (Club) Solid Wand
                    17409,  15000,      -- (Club) Mythril Rod +1
                    15173,  10000,      -- (Head) Kosshin
                    13730,  10000,      -- (Body) Frost Robe
                    12750,  10000,      -- (Hands) New Moon Armlets
                    12904,  10000,      -- (Legs) Linen Slacks +1
                    13040,  10000,      -- (Feet) Shoes +1
                    13102,  5000,       -- (Neck) Paisley Scarf
                    13233,  5000,       -- (Waist) Gold Obi +1
                    13610,  5000,       -- (Back) Black Cape +1
                    14702,  5000,       -- (Earring) Aura Earring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_GEO =
                {
                    17427,  25000,      -- (Club) Ebony Wand +1
                    17435,  25000,      -- (Club) Darksteel Rod +1
                    12141,  50000,      -- (Head) Ebon Beret
                    12177,  50000,      -- (Body)  Ebon Frock
                    12213,  50000,      -- (Hands) Ebon Mitts
                    12249,  50000,      -- (Legs) Ebon Slops
                    12285,  50000,      -- (Feet) Ebon Clogs
                    15887,  10000,      -- (Neck) Resolute Belt
                    15885,  10000,      -- (Neck) Spectral Belt
                    15490,  10000,      -- (Back) Miraculous Cape
                    15971,  10000,      -- (Earring) Antivenom Earring
                    15972,  10000,      -- (Earring) Insomnia Earring
                    15776,  10000,      -- (Ring) Ebullient Ring
                    15777,  10000,      -- (Ring) Hale Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_GEO =
                {
                    18875,  40000,      -- (Club) Vodun Mace
                    17277,  20000,      -- (Ammunition) Hedgehog Bomb
                    11505,  50000,      -- (Head) Teal Chapeau
                    13778,  50000,      -- (Body) Teal Saio
                    12747,  50000,      -- (Hands) Teal Cuffs
                    14258,  50000,      -- (Legs) Teal Slops
                    11415,  50000,      -- (Feet) Teal Pigaches
                    11807,  50000,      -- (Head) Nebula Hat +1
                    11849,  50000,      -- (Body) Nebula Houppelande +1
                    11916,  50000,      -- (Hands) Nebula Cuffs +1
                    11955,  50000,      -- (Legs) Nebula Slops +1
                    11452,  50000,      -- (Feet) Nebula Pigaches +1
                    11584,  30000,      -- (Neck) Lemegeton Medallion +1
                    11743,  30000,      -- (Waist) Searing Sash
                    11560,  30000,      -- (Back) Pedant Cape
                    11682,  30000,      -- (Earring) Snow Earring
                    13306,  30000,      -- (Ring) Omniscient Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_GEO =
                {
                    21133,  100000,     -- (Club) Sasah Wand +1
                    21461,  50000,      -- (Handbell) Filiae Bell
                    -- 21362,   30000,      -- (Ammunition) Ombre Tathlum +1
                    27743,  100000,     -- (Head) Temachtiani Headband
                    27884,  100000,     -- (Body) Temachtiani Shirt
                    28032,  100000,     -- (Hands) Temachtiani Gloves
                    28171,  100000,     -- (Legs) Temachtiani Pants
                    28309,  100000,     -- (Feet) Temachtiani Boots
                    -- 25537,   50000,      -- (Neck) Bagua Charm
                    10839,  50000,      -- (Waist) Othila Sash
                    28601,  50000,      -- (Back) Seshaw Cape
                    11682,  30000,      -- (Earring) Snow Earring
                    -- 27574,   50000,      -- (Ring) Shiva Ring
                    4044,   16667,      -- Atramenterrane (Reforged Artifact Material)
                    4043,   16667,      -- Lavarion (Reforged Artifact Material)
                    4042,   16667,      -- Acuex Ore (Reforged Artifact Material)
                    4030,   16667,      -- Sekishitsu (Reforged Artifact Material)
                    4045,   16667,      -- Cyclone Cotton (Reforged Artifact Material)
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_GEO)
    elseif (job == xi.job.RUN) then
        local stock_RUN = {}
        player:PrintToPlayer(string.format("Andreine : Mysterious runes? High magical defenses? 100%% Rune Fencer!"),xi.msg.channel.NS_SAY)
        
        if (level <= 30) then
            stock_RUN =
                {
                    20781,  5000,       -- (Great Sword) Sowilo Claymore
                    17307,  2,          -- (Ammunition) Dart
                    12695,  2000,       -- (Gloves) Bronze Mittens +1
                    12823,  2000,       -- (Legs) Bronze Subligar +1
                    12951,  2000,       -- (Feet) Bronze Leggings +1
                    13069,  2000,       -- (Neck) Leather Gorget +1
                    13210,  2000,       -- (Waist) Leather Belt +1
                    13599,  2000,       -- (Back) Rabbit Mantle +1
                    14695,  2000,       -- (Earring) Hope Earring +1
                    14694,  2000,       -- (Earring) Energy Earring +1
                    13492,  2000,       -- (Ring) Copper Ring +1
                    -- 317, 100000,     -- (Item) Bronze Rose (Used to trigger augment application trades)
                }
        elseif (level <= 60) then
            stock_RUN =
                {
                    16936,  15000,      -- (Great Sword) Demonic Sword
                    12538,  10000,      -- (Head) Red Cap +1
                    12625,  10000,      -- (Body) Gambison +1
                    12779,  10000,      -- (Hands) Bracers +1
                    12903,  10000,      -- (Legs) Hose +1
                    13034,  10000,      -- (Feet) Socks +1
                    13070,  5000,       -- (Neck) Wolf Gorget +1
                    13223,  5000,       -- (Waist) Silver Belt +1
                    13609,  5000,       -- (Back) Wolf Mantle +1
                    14703,  5000,       -- (Earring) Loyalty Earring +1
                    13519,  5000,       -- (Ring) Mythril Ring +1
                    -- 318, 150000,     -- (Item) Crystal Rose (Used to trigger augment application trades)
                }
        elseif (level <= 75) then
            stock_RUN =
                {
                    16616,  25000,      -- (Great Sword) Zweihander +1
                    12120,  50000,      -- (Head) Ebon Mask
                    12156,  50000,      -- (Body) Ebon Harness
                    12192,  50000,      -- (Hands) Ebon Gloves
                    12228,  50000,      -- (Legs) Ebon Brais
                    12264,  50000,      -- (Feet) Ebon Boots
                    15523,  10000,      -- (Neck) Chivalrous Chain
                    15524,  10000,      -- (Neck) Fortified Chain
                    15521,  10000,      -- (Neck) Tempered Chain
                    15884,  10000,      -- (Waist) Potent Belt
                    15493,  10000,      -- (Back) Bushido Cape
                    13369,  10000,      -- (Earring) Spike Earring
                    14764,  10000,      -- (Earring) Minuet Earring
                    13545,  10000,      -- (Ring) Demon's Ring +1
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level < 99) then
            stock_RUN =
                {
                    19166,  40000,      -- (Great Sword) Cratus Sword +1
                    16074,  50000,      -- (Head) Hydra Mask +1
                    14538,  50000,      -- (Body) Hydra Mail +1
                    14950,  50000,      -- (Hands) Hydra Finger Gauntlets +1
                    15616,  50000,      -- (Legs) Hydra Cuisses +1
                    15704,  50000,      -- (Feet) Hydra Greaves +1
                    11803,  50000,      -- (Head) Alcide's Cap +1
                    11845,  50000,      -- (Body) Alcide's Harness +1
                    11912,  50000,      -- (Hands) Alcide's Mitts +1
                    11951,  50000,      -- (Legs) Alcide's Subligar +1
                    11448,  50000,      -- (Feet) Alcide's Leggings +1
                    13146,  30000,      -- (Neck) Tern Necklace
                    15922,  30000,      -- (Waist) Tern Stone
                    13619,  30000,      -- (Back) Tern Cape
                    11678,  30000,      -- (Earring) Flame Earring
                    14630,  30000,      -- (Ring) Flame Ring
                    -- 139, 250000,     -- (Item) Star Globe (Used to trigger augment application trades)
                }
        elseif (level == 99) then
            stock_RUN =
                {
                    20788,  100000,     -- (Great Sword) Hatzoaar Sword +1
                    20786,  100000,     -- (Great Sword) Thurisaz Blade +1
                    10435,  100000,     -- (Head) Dux Visor +1
                    10273,  100000,     -- (Body) Dux Scale Mail +1
                    10317,  100000,     -- (Hands) Dux Finger Gauntlets +1
                    10347,  100000,     -- (Legs) Dux Cuisses +1
                    10364,  100000,     -- (Feet) Dux Greaves +1
                    -- 25543,   50000,      -- (Neck) Futhark Torque
                    10831,  50000,      -- (Waist) Paewr Belt
                    10992,  50000,      -- (Back) Vassal's Mantle
                    11057,  50000,      -- (Earring) Ghillie Earring +1
                    10797,  50000,      -- (Ring) Dagaz Ring
                    10798,  50000,      -- (Ring) Eihwaz Ring
                    4046,   16667,      -- Corroded Ore (Reforged Artifact Material)
                    4025,   16667,      -- Snowsteel Sheet (Reforged Artifact Material)
                    4047,   16667,      -- Redoubtable Silk Thread (Reforged Artifact Material)
                    3923,   16667,      -- Rhodium Ingot (Reforged Artifact Material)
                    4029,   16667,      -- Runeweave (Reforged Artifact Material)
                    -- 321, 350000,     -- (Item) Mythril Bell (Used to trigger augment application trades)
                }
        end
        
        xi.shop.general(player, stock_RUN)
    end
    player:PrintToPlayer(string.format("Andreine's stock changes when you reach levels 31, 61, 76, and 99."),xi.msg.channel.SYSTEM_3)
end)

return m
