-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Reja Ygridhi
-- Standard Merchant NPC
-- !pos -110.7740 -2.1500 -103.7501 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Reja_Ygridhi")

local npcToReplaceName = "Reja_Ygridhi"


m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
	player:PrintToPlayer(string.format("Reja Ygridhi : Get your storyline mission accessories here!"),xi.msg.channel.NS_SAY)
    
	local stock =
    {
		15840, 75000,-- Kupofried's Ring
        14739, 50000,-- Suppanomimi
		14740, 50000,-- Knight's Earring
		14741, 50000,-- Abyssal Earring
        14742, 50000,-- Beastly Earring
        14743, 50000,-- Bushinomimi
		15543, 50000,-- Rajas Ring
		15544, 50000,-- Sattva Ring
		15545, 50000,-- Tamas Ring
		15962, 50000,-- Static Earring
		15963, 50000,-- Magnetic Earring
		15964, 50000,-- Hollow Earring
		15965, 50000,-- Ethereal Earring
		-- 2127, 75000, -- Metal Chip
		14815, 75000, -- Stealth Earring
		15961, 75000, -- Musical Earring
		14812, 75000, -- Loquacious Earring
		14813, 75000, -- Brutal Earring
		15477, 75000, -- Boxers Mantle
		15488, 75000, -- Gunners Mantle
		15475, 150000, -- Charger Mantle
		15476, 150000, -- Jaeger Mantle
		15244, 150000, -- Flawless Ribbon
		15807, 200000, -- Balrahn's Ring
		15808, 200000, -- Ulthalam's Ring
		15809, 200000, -- Jalzahn's Ring
		11589, 250000, -- Aesir Torque
		16057, 250000, -- Aesir Ear Pendant
		11546, 250000, -- Aesir Mantle
		11590, 250000, -- Colossus's Torque
		16058, 250000, -- Colossus's Earring
		11547, 250000, -- Colossus's Mantle
	}

    xi.shop.general(player, stock)
end)

return m
