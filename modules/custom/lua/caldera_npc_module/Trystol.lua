-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Trystol
-- !pos -101 -2 -84 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Trystol")

local npcToReplaceName = "Trystol"


m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
    local stock_BST = 
    {
        -- 17907,   7500,       -- (Ammunition) Swirling Broth
        -- 21445,   7500,       -- (Ammunition) Lyrical Broth
        -- 21444,   7500,       -- (Ammunition) Livid Broth
        -- 21488,   7500,       -- (Ammunition) Pristine Sap
        -- 21448,   7500,       -- (Ammunition) Pale Sap
        -- 17908,   7500,       -- (Ammunition) Shimmering Broth
        -- 21447,   7500,       -- (Ammunition) Crumbly Soil
        -- 21496,   7500,       -- (Ammunition) Furious Broth
        -- 21498,   7500,       -- (Ammunition) Crackling Broth
        -- 21499,   7500,       -- (Ammunition) Creepy Broth
        -- 21490,   7500,       -- (Ammunition) Aged Humus
        -- 21497,   7500,       -- (Ammunition) Rapid Broth
        -- 21449,   7500,       -- (Ammunition) Dire Broth
        -- 21492,   7500,       -- (Ammunition) Insipid Broth
        -- 21446,   7500,       -- (Ammunition) Airy Broth
        -- 17909,   7500,       -- (Ammunition) Spicy Broth
        -- 21450,   7500,       -- (Ammunition) Electrified Broth
        -- 21438,   7500,       -- (Ammunition) Poisonous Broth
        -- 21440,   7500,       -- (Ammunition) Sugary Broth
        -- 21442,   7500,       -- (Ammunition) Sticky Webbing
        -- 21494,   7500,       -- (Ammunition) Wetlands Broth
        -- 17917,  15000,       -- (Ammunition) (HQ) Bubbly Broth
        -- 21489,   15000,      -- (Ammunition) (HQ) Truly Pristine Sap
        -- 21493,   15000,      -- (Ammunition) (HQ) Deepwater Broth
        -- 21451,   15000,      -- (Ammunition) (HQ) Bug-Ridden Broth
        -- 21439,   15000,      -- (Ammunition) (HQ) Venomous Broth
        -- 21441,   15000,      -- (Ammunition) (HQ) Glazed Broth
        -- 21443,   15000,      -- (Ammunition) (HQ) Slimy Webbing
        -- 21495,   15000,      -- (Ammunition) (HQ) Heavenly Broth
        21446, 10000,       -- Airy Broth (Amiable Roche)
        21490, 10000,       -- Aged Humus (Sweet Caroline)
        17922, 10000,       -- Blackwater Broth (Headbreaker Ken)
        21498, 10000,       -- Crackling Broth (Anklebiter Jedd)
        21499, 10000,       -- Creepy Broth (Cursed Annabelle)
        21447, 10000,       -- Crumbly Soil (Brainy Waluis)
        21449, 10000,       -- Dire Broth (Generous Arthur)
        21450, 10000,       -- Electrified Broth (Redolent Candi)
        17912, 10000,       -- Fizzy Broth (Caring Kiyomaro)
        21496, 10000,       -- Furious Broth (Suspicious Alice)
        21492, 10000,       -- Insipid Broth (Surging Storm)
        21444, 10000,       -- Livid Broth (Warlike Patrick)
        21445, 10000,       -- Lyrical Broth (Rhyming Shizuna)
        17920, 10000,       -- Meaty Broth (Blackbeard Randy)
        17921, 10000,       -- Muddy Broth (Threestar Lynn)
        21448, 10000,       -- Pale Sap (Hurler Percival)
        21438, 10000,       -- Poisonous Broth (Acuex Familiar)
        21488, 10000,       -- Pristine Sap (Weevil Familiar)
        21497, 10000,       -- Rapid Broth (Fleet Reinhard)
        17913, 10000,       -- Saline Broth (Sharpwit Hermes)
        17911, 10000,       -- Salubrious Broth (Attentive Ibuki)
        17908, 10000,       -- Shimmering Broth (Sunburst Malfik)
        17909, 10000,       -- Spicy Broth (Scissorleg Xerin)
        21442, 10000,       -- Sticky Webbing (Spider Familiar)
        21440, 10000,       -- Sugary Broth (Colibri Familiar)
        17907, 10000,       -- Swirling Broth (Droopy Dortwin)
        17910, 10000,       -- Transluscent Broth (Herald Henry)
        21494, 10000,       -- Wetlands Broth (Mosquito Familiar)
        17914, 10000,       -- Wispy Broth (Brave Hero Glenn)
        21451, 15000,       -- Bug-Ridden Broth (Alluring Honey)
        17919, 15000,       -- Tantalizing Broth (Vivacious Vickie)
        21493, 15000,       -- Deepwater Broth (Submerged Iyo)
        21439, 15000,       -- Venomous Broth (Fluffy Bredo)
        21489, 15000,       -- Truly Pristine Sap (Stalwart Angelina)
        17918, 15000,       -- Windy Greens (Swooping Zhivago)
        17916, 15000,       -- Fermented Broth (Aged Angus)
        17917, 15000,       -- Bubbly Broth (Bouncing Bertha)
        21443, 15000,       -- Slimy Webbing (Gussy Hachirobe)
        21441, 15000,       -- Glazed Broth (Choral Leera)
        17915, 15000,       -- Viscous Broth (Pondering Peter)
        21495, 15000,       -- Heavenly Broth (Left-Handed Yoko)
    }
    xi.shop.general(player, stock_BST)
    
    player:PrintToPlayer(string.format("Trystol : I have all of the foods for attracting the best pets a Beastmaster could ask for!"),xi.msg.channel.NS_SAY)
end)

return m
