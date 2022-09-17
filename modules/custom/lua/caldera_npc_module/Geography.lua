-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Geography
-- !pos -91 -2 -91 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------


local m = Module:new("Geography")

local npcToReplaceName = "Geography"

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
    
        player:PrintToPlayer(string.format("Geography : These thrown away abjuration armors might interest you!"),xi.msg.channel.NS_SAY)
        local stock =
                {
                    10409,  100000,     -- Iaso Mitra
                    10493,  100000,     -- Iaso Bliaut
                    10543,  100000,     -- Iaso Cuffs
                    10574,  100000,     -- Iaso Tights
                    10640,  100000,     -- Iaso Boots
                    10405,  100000,     -- Huginn Coronet
                    10489,  100000,     -- Huginn Haubert
                    10539,  100000,     -- Huginn Gauntlets
                    10570,  100000,     -- Huginn Hose
                    10636,  100000,     -- Huginn Gambieras
                    10408,  100000,     -- Spurrina Coif
                    10492,  100000,     -- Spurrina Doublet
                    10542,  100000,     -- Spurrina Gages
                    10573,  100000,     -- Spurrina Slops
                    10639,  100000,     -- Spurrina Nails
                    10406,  100000,     -- Tenryu Somen +1
                    10490,  100000,     -- Tenryu Domaru +1
                    10540,  100000,     -- Tenryu Tekko +1
                    10571,  100000,     -- Tenryu Hakama +1
                    10637,  100000,     -- Tenryu Sune-Ate +1
                    10407,  100000,     -- Khepri Bonnet
                    10491,  100000,     -- Khepri Jacket
                    10541,  100000,     -- Khepri Wristbands
                    10572,  100000,     -- Khepri Kecks
                    10638,  100000,     -- Khepri Gamashes
                }
    xi.shop.general(player, stock)
end)

return m 
