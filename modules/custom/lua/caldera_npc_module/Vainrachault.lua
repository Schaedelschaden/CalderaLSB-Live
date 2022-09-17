-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Vainrachault
-- !pos -111.187 -2.15 -85.478
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Vainrachault")

local npcToReplaceName = "Vainrachault"

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
    local stock_under_99 = 
    {
        5402, 7500,         -- (Ammunition) Fire Card Case
        5403, 7500,         -- (Ammunition) Ice Card Case
        5404, 7500,         -- (Ammunition) Wind Card Case
        5405, 7500,         -- (Ammunition) Earth Card Case
        5406, 7500,         -- (Ammunition) Thunder Card Case
        5407, 7500,         -- (Ammunition) Water Card Case
        5408, 7500,         -- (Ammunition) Light Card Case
        5409, 7500,         -- (Ammunition) Dark Card Case
        5870, 12500,        -- (Ammunition) Trump Card Case
        17296,  1,          -- (Throwing) Pebble
        17298,  20,         -- (Ammunition) Tathlum
        17299,  50,         -- (Ammunition) Astragalos
        17290,  5000,       -- (Throwing) Coarse Boomerang
        6299,   500,        -- (Throwing) Shuriken Pouch
        6297,   2000,       -- (Throwing) Juji Shuriken Pouch
        6302,   5000,       -- (Throwing) Fuma Shuriken Pouch
        6300,   7500,       -- (Throwing) Koga Shuriken Pouch
        6304,   12000,      -- (Throwing) Roppo Shuriken Pouch
        4219,   200,        -- (Ammunition) Stone Arrow Quiver
        4222,   2000,       -- (Ammunition) Horn Arrow Quiver
        4224,   5000,       -- (Ammunition) Demon Arrow Quiver
        5819,   7500,       -- (Ammunition) Antlion Arrow Quiver
        6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
        4227,   200,        -- (Ammunition) Bronze Bolt Quiver
        4228,   2000,       -- (Ammunition) Mythril Bolt Quiver
        4229,   5000,       -- (Ammunition) Darksteel Bolt Quiver
        5821,   7500,       -- (Ammunition) Fusion Bolt Quiver
        6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
        6139,   11500,      -- (Ammunition) Midrium Bolt Quiver
        5359,   200,        -- (Ammunition) Bronze Bullet Pouch
        5363,   2000,       -- (Ammunition) Bullet Pouch
        5353,   5000,       -- (Ammunition) Iron Bullet Pouch
        17342,  75,         -- (Ammunition) Cannon Shell
        5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
        6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
    }
    
    local stock_over_99_basic = 
    {
        5402, 7500,         -- (Ammunition) Fire Card Case
        5403, 7500,         -- (Ammunition) Ice Card Case
        5404, 7500,         -- (Ammunition) Wind Card Case
        5405, 7500,         -- (Ammunition) Earth Card Case
        5406, 7500,         -- (Ammunition) Thunder Card Case
        5407, 7500,         -- (Ammunition) Water Card Case
        5408, 7500,         -- (Ammunition) Light Card Case
        5409, 7500,         -- (Ammunition) Dark Card Case
        5870, 12500,        -- (Ammunition) Trump Card Case
        6304,   12000,      -- (Throwing) Roppo Shuriken Pouch
        5819,   7500,       -- (Ammunition) Antlion Arrow Quiver
        6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
        6138,   35000,      -- (Ammunition) Mantid Arrow Quiver
        6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
        6139,   11500,      -- (Ammunition) Midrium Bolt Quiver
        6140,   35000,      -- (Ammunition) Damascus Bolt Quiver
        5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
        6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
        6143,   35000,      -- (Ammunition) Damascus Bullet Pouch
    }
    
    local stock_t1_locked = 
    {
        5402, 7500,         -- (Ammunition) Fire Card Case
        5403, 7500,         -- (Ammunition) Ice Card Case
        5404, 7500,         -- (Ammunition) Wind Card Case
        5405, 7500,         -- (Ammunition) Earth Card Case
        5406, 7500,         -- (Ammunition) Thunder Card Case
        5407, 7500,         -- (Ammunition) Water Card Case
        5408, 7500,         -- (Ammunition) Light Card Case
        5409, 7500,         -- (Ammunition) Dark Card Case
        5870, 12500,        -- (Ammunition) Trump Card Case
        6304,   12000,      -- (Throwing) Roppo Shuriken Pouch
        6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
        6138,   35000,      -- (Ammunition) Mantid Arrow Quiver
        6201,   50000,      -- (Ammunition) Tulfaire Arrow Quiver
        6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
        6139,   11500,      -- (Ammunition) Midrium Bolt Quiver
        6140,   35000,      -- (Ammunition) Damascus Bolt Quiver
        6205,   50000,      -- (Ammunition) Titanium Bolt Quiver
        5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
        6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
        6143,   35000,      -- (Ammunition) Damascus Bullet Pouch
        6209,   50000,      -- (Ammunition) Titanium Bullet Pouch
    }
    
    local stock_t2_locked = 
    {
        5402, 7500,         -- (Ammunition) Fire Card Case
        5403, 7500,         -- (Ammunition) Ice Card Case
        5404, 7500,         -- (Ammunition) Wind Card Case
        5405, 7500,         -- (Ammunition) Earth Card Case
        5406, 7500,         -- (Ammunition) Thunder Card Case
        5407, 7500,         -- (Ammunition) Water Card Case
        5408, 7500,         -- (Ammunition) Light Card Case
        5409, 7500,         -- (Ammunition) Dark Card Case
        5870, 12500,        -- (Ammunition) Trump Card Case
        6304,   12000,      -- (Throwing) Roppo Shuriken Pouch
        6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
        6138,   35000,      -- (Ammunition) Mantid Arrow Quiver
        6201,   50000,      -- (Ammunition) Tulfaire Arrow Quiver
        6202,   70000,      -- (Ammunition) Raaz Arrow Quiver
        6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
        6139,   11500,      -- (Ammunition) Midrium Bolt Quiver
        6140,   35000,      -- (Ammunition) Damascus Bolt Quiver
        6205,   50000,      -- (Ammunition) Titanium Bolt Quiver
        6206,   70000,      -- (Ammunition) Bismuth Bolt Quiver
        5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
        6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
        6143,   35000,      -- (Ammunition) Damascus Bullet Pouch
        6209,   50000,      -- (Ammunition) Titanium Bullet Pouch
        6210,   70000,      -- (Ammunition) Bismuth Bullet Pouch
    }
    
    local stock_t3_locked = 
    {
        5402, 7500,         -- (Ammunition) Fire Card Case
        5403, 7500,         -- (Ammunition) Ice Card Case
        5404, 7500,         -- (Ammunition) Wind Card Case
        5405, 7500,         -- (Ammunition) Earth Card Case
        5406, 7500,         -- (Ammunition) Thunder Card Case
        5407, 7500,         -- (Ammunition) Water Card Case
        5408, 7500,         -- (Ammunition) Light Card Case
        5409, 7500,         -- (Ammunition) Dark Card Case
        5870, 12500,        -- (Ammunition) Trump Card Case
        6304,   12000,      -- (Throwing) Roppo Shuriken Pouch
        6308,   30000,      -- (Throwing) Hachiya Shuriken Pouch
        6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
        6138,   35000,      -- (Ammunition) Mantid Arrow Quiver
        6201,   50000,      -- (Ammunition) Tulfaire Arrow Quiver
        6202,   70000,      -- (Ammunition) Raaz Arrow Quiver
        6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
        6139,   11500,      -- (Ammunition) Midrium Bolt Quiver
        6140,   35000,      -- (Ammunition) Damascus Bolt Quiver
        6205,   50000,      -- (Ammunition) Titanium Bolt Quiver
        6206,   70000,      -- (Ammunition) Bismuth Bolt Quiver
        5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
        6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
        6143,   35000,      -- (Ammunition) Damascus Bullet Pouch
        6209,   50000,      -- (Ammunition) Titanium Bullet Pouch
        6210,   70000,      -- (Ammunition) Bismuth Bullet Pouch
    }
    
    local stock_t4_locked = 
    {
        5402, 7500,         -- (Ammunition) Fire Card Case
        5403, 7500,         -- (Ammunition) Ice Card Case
        5404, 7500,         -- (Ammunition) Wind Card Case
        5405, 7500,         -- (Ammunition) Earth Card Case
        5406, 7500,         -- (Ammunition) Thunder Card Case
        5407, 7500,         -- (Ammunition) Water Card Case
        5408, 7500,         -- (Ammunition) Light Card Case
        5409, 7500,         -- (Ammunition) Dark Card Case
        5870, 12500,        -- (Ammunition) Trump Card Case
        6304,   12000,      -- (Throwing) Roppo Shuriken Pouch
        6308,   30000,      -- (Throwing) Hachiya Shuriken Pouch
        6137,   11500,      -- (Ammunition) Chapuli Arrow Quiver
        6138,   35000,      -- (Ammunition) Mantid Arrow Quiver
        6201,   50000,      -- (Ammunition) Tulfaire Arrow Quiver
        6202,   70000,      -- (Ammunition) Raaz Arrow Quiver
        6280,   90000,      -- (Ammunition) Ra'Kaznar Arrow Quiver
        6141,   11500,      -- (Ammunition) Oxidant Bolt Quiver
        6139,   11500,      -- (Ammunition) Midrium Bolt Quiver
        6140,   35000,      -- (Ammunition) Damascus Bolt Quiver
        6205,   50000,      -- (Ammunition) Titanium Bolt Quiver
        6206,   70000,      -- (Ammunition) Bismuth Bolt Quiver
        6281,   90000,      -- (Ammunition) Ra'Kaznar Bolt Quiver
        6310,   90000,      -- (Ammunition) Gashing Bolt Quiver
        5823,   7500,       -- (Ammunition) Oberon's Bullet Pouch
        6142,   11500,      -- (Ammunition) Midrium Bullet Pouch
        6143,   35000,      -- (Ammunition) Damascus Bullet Pouch
        6209,   50000,      -- (Ammunition) Titanium Bullet Pouch
        6210,   70000,      -- (Ammunition) Bismuth Bullet Pouch
        6282,   90000,      -- (Ammunition) Ra'Kaznar Bullet Pouch
    }
    
    local playerLvl = player:getMainLvl() + player:getAverageItemLevel()
    local t1Unlock = 0
    local t2Unlock = 0
    local t3Unlock = 0
    local t4Unlock = 0
    
    if (player:getCharVar("KillCounter_Byakko") >= 1 and player:getCharVar("KillCounter_Genbu") >= 1 and
        player:getCharVar("KillCounter_Seiryu") >= 1 and player:getCharVar("KillCounter_Suzaku") >= 1) then
        t1Unlock = 1
        -- printf("Vainrachault.lua onTrigger TIER 3 UNLOCKED  [%i]", t1Unlock)
    end
    
    if (player:getCharVar("KillCounter_IxAernDRG") >= 1 and player:getCharVar("KillCounter_IxAernDRK") >= 1 and player:getCharVar("KillCounter_IxAernMNK") >= 1 and
        player:getCharVar("KillCounter_JailOfFaith") >= 1 and player:getCharVar("KillCounter_JailOfFort") >= 1 and player:getCharVar("KillCounter_JailOfTemp") >= 1) then
        t2Unlock = 1
        -- printf("Vainrachault.lua onTrigger TIER 4 UNLOCKED")
    end
    
    if (player:getCharVar("KillCounter_Kirin") >= 1 and player:getCharVar("KillCounter_JailOfLove") >= 1) then
        t3Unlock = 1
        -- printf("Vainrachault.lua onTrigger TIER 5 UNLOCKED")
    end
    
    if (player:getCharVar("KillCounter_ShadowLord") >= 1 and player:getCharVar("KillCounter_Kamlanaut") >= 1) then
        t4Unlock = 1
        -- printf("Vainrachault.lua onTrigger TIER 6 UNLOCKED")
    end
    
    if (playerLvl >= 99 and t1Unlock == 1 and t2Unlock == 1 and t3Unlock == 1 and t4Unlock == 1) then
        xi.shop.general(player, stock_t4_locked)
        -- printf("Vainrachault.lua onTrigger TIER 6 SHOP")
    elseif (playerLvl >= 99 and t1Unlock == 1 and t2Unlock == 1 and t3Unlock == 1) then
        xi.shop.general(player, stock_t3_locked)
        -- printf("Vainrachault.lua onTrigger TIER 5 SHOP")
    elseif (playerLvl >= 99 and t1Unlock == 1 and t2Unlock == 1) then
        xi.shop.general(player, stock_t2_locked)
        -- printf("Vainrachault.lua onTrigger TIER 4 SHOP")
    elseif (playerLvl >= 99 and t1Unlock == 1) then
        xi.shop.general(player, stock_t1_locked)
        -- printf("Vainrachault.lua onTrigger TIER 3 SHOP")
    elseif (playerLvl >= 99) then
        xi.shop.general(player, stock_over_99_basic)
        -- printf("Vainrachault.lua onTrigger TIER 2 SHOP")
    else
        xi.shop.general(player, stock_under_99)
        -- printf("Vainrachault.lua onTrigger TIER 1 SHOP")
    end
    
    player:PrintToPlayer(string.format("Vainrachault : Looking for ranged ammunition? I have a wide variety available for sale!"),xi.msg.channel.NS_SAY)
end)

return m
