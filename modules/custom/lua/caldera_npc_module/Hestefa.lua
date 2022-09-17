-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Hestefa
-- RSE Merchant NPC
-- !pos -114.7442 -2.1500 -99.5595 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------


local m = Module:new("Hestefa")

local npcToReplaceName = "Hestefa"

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
    player:PrintToPlayer(string.format("Hestefa : Get your Race Specific Equipment here!"),xi.msg.channel.NS_SAY)
    
    local stockElvaanM =
    {
        12656, 5000,            -- Magna Jerkin
        12763, 5000,            -- Magna Gauntlets
        12873, 5000,            -- Magna M Chausses
        13017, 5000,            -- Magna M Ledelsens
        18249, 5000,            -- Olibanum Sachet
        13252, 10000,           -- Forest Belt
        13257, 10000,           -- Forest Stone
        14835, 15000,           -- Wood Gauntlets
        14200, 15000,           -- Wood M Ledelsens
        13267, 20000,           -- Forest Rope
        13262, 20000,           -- Forest Sash
        11899, 25000,           -- Weald Gages
        11904, 25000,           -- Thicket Gages
    }
    
    local stockElvaanF =
    {
        12657, 5000,            -- Magna Bodice
        12764, 5000,            -- Magna Gloves
        12874, 5000,            -- Magna F Chausses
        13018, 5000,            -- Magna F Ledelsens
        18250, 5000,            -- Attar Sachet
        13252, 10000,           -- Forest Belt
        13257, 10000,           -- Forest Stone
        14836, 15000,           -- Wood Gloves 
        14201, 15000,           -- Wood F Ledelsens
        13267, 20000,           -- Forest Rope
        13262, 20000,           -- Forest Sash
        11899, 25000,           -- Weald Gages
        11904, 25000,           -- Thicket Gages
    }
    
    local stockHumeM =
    {
        12654, 5000,            -- Custom Tunic
        12761, 5000,            -- Custom M Gloves
        12871, 5000,            -- Custom Slacks
        13015, 5000,            -- Custom M Boots
        18247, 5000,            -- Balm Sachet
        13251, 10000,           -- Ocean Belt
        13256, 10000,           -- Ocean Stone
        14833, 15000,           -- Marine M Gloves
        14198, 15000,           -- Marine M Boots
        13266, 20000,           -- Ocean Rope
        13261, 20000,           -- Ocean Sash
        11903, 25000,           -- Tide Gages
        11898, 25000,           -- Wave Gages
    }
    
    local stockHumeF =
    {
        12655, 5000,            -- Custom Vest
        12762, 5000,            -- Custom F Gloves
        12872, 5000,            -- Custom Pants
        13016, 5000,            -- Custom F Boots
        18248, 5000,            -- Millefleurs Sachet
        13251, 10000,           -- Ocean Belt
        13256, 10000,           -- Ocean Stone
        14834, 15000,           -- Marine F Gloves
        14199, 15000,           -- Marine F Boots
        13266, 20000,           -- Ocean Rope
        13261, 20000,           -- Ocean Sash
        11903, 25000,           -- Tide Gages
        11898, 25000,           -- Wave Gages
    }
    
    local stockTaruM =
    {
        12658, 5000,            -- Wonder Kaftan
        12765, 5000,            -- Wonder Mitts
        12875, 5000,            -- Wonder Braccae
        13019, 5000,            -- Wonder Clomps
        18251, 5000,            -- Sweet Sachet
        13253, 10000,           -- Steppe Belt
        13258, 10000,           -- Steppe Stone
        14837, 15000,           -- Creek M Mitts
        14202, 15000,           -- Creek M Clomps
        13268, 20000,           -- Steppe Rope
        13263, 20000,           -- Steppe Sash
        11905, 25000,           -- Brook Gages
        11900, 25000,           -- Savanna Gages
    }
    
    local stockTaruF =
    {
        12658, 5000,            -- Wonder Kaftan
        12765, 5000,            -- Wonder Mitts
        12875, 5000,            -- Wonder Braccae
        13019, 5000,            -- Wonder Clomps
        18251, 5000,            -- Sweet Sachet
        13253, 10000,           -- Steppe Belt
        13258, 10000,           -- Steppe Stone
        14838, 15000,           -- Creek F Mitts
        14023, 15000,           -- Creek F Clomps
        13268, 20000,           -- Steppe Rope
        13263, 20000,           -- Steppe Sash
        11905, 25000,           -- Brook Gages
        11900, 25000,           -- Savanna Gages
    }
    
    local stockMithra =
    {
        12659, 5000,            -- Savage Separates
        12766, 5000,            -- Savage Gauntlets
        12876, 5000,            -- Savage Loincloth
        13020, 5000,            -- Savage Gaiters
        18252, 5000,            -- Civet Sachet
        13254, 10000,           -- Jungle Belt
        13259, 10000,           -- Jungle Stone
        14839, 15000,           -- River Gauntlets
        14204, 15000,           -- River Gaiters
        13269, 20000,           -- Jungle Rope
        13264, 20000,           -- Jungle Sash
        11901, 25000,           -- Tropic Gages
        11906, 25000,           -- Wild Gages
    }
    
    local stockGalka =
    {
        12660, 5000,            -- Elder's Surcoat
        12767, 5000,            -- Elder's Bracers
        12877, 5000,            -- Elder's Braguette
        13021, 5000,            -- Elder's Sandals
        18253, 5000,            -- Musk Sachet
        13255, 10000,           -- Desert Belt
        13260, 10000,           -- Desert Stone
        14840, 15000,           -- Dune Bracers
        14205, 15000,           -- Dune Sandals
        13270, 20000,           -- Desert Rope
        13265, 20000,           -- Desert Sash
        11902, 25000,           -- Strand Gages
        11907, 25000,           -- Torrid Gages
    }

    local race = {xi.race.ELVAAN_M, xi.race.ELVAAN_F, xi.race.HUME_M, xi.race.HUME_F, xi.race.TARU_M, xi.race.TARU_F, xi.race.MITHRA, xi.race.GALKA}
    local shopStock = {stockElvaanM, stockElvaanF, stockHumeM, stockHumeF, stockTaruM, stockTaruF, stockMithra, stockGalka}
    
    for i = 1, #race do
        if (player:getRace() == race[i]) then
            xi.shop.general(player, shopStock[i])
        end
    end
end)

return m 
