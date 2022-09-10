-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: History
-- !pos -116.250 -3.650 -90.147 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/missions")
require("modules/module_utils")
-----------------------------------

local m = Module:new("History")

local npcToReplaceName = "History"


local acceptedTrades = {{3690, 200000}, -- Fighter Board
						{3689, 250000}, -- Wizardess Board
						{3686, 300000}, -- Duelist Board
						{3684, 350000}, -- Princess Board
						{3691, 400000}, -- Guardian Board
						{3685, 500000}} -- Empress Board
						
local stock_t1_locked = {
	8992,  250000,			-- Jester Malatrix's Shard
	8990,  250000,			-- Largantua's Shard
	8977,  250000,			-- Ironhorn Baldurno's Horn
	8981,  250000,			-- Abyssdiver's Feather
	8976,  250000,			-- Prickly Pitriv's Thread
	8988,  250000,			-- Waraxe Beak's Hide
	8982,  250000,			-- Intuila's Hide
	8983,  250000,			-- Emperor Arthro's Shell
	8707,  500000,			-- Raaz Hide
	8709,  500000, 			-- Raaz Tusk
	2169,  1000000,			-- Cerberus Hide
	4027,  1000000,			-- Spool of Akaso Thread
	722,   1000000,			-- Divine Log
	8725,  1000000,			-- Exalted Log
	702,   1000000,			-- Ebony Log
	4018,  1000000,			-- Guatambu Log
	8747,  1000000,			-- Chuck of Ra'Kaznar Ore
	8723,  1000000,			-- Chunk of Beryllium Ore
	4058,  1000000,			-- Chunk of Bismuth Ore
	3922,  1000000,			-- Chunk of Rhodium Ore
	9075,  3000000,			-- Chunk of Vulcanite Ore
	747,   2000000,			-- Orichalcum Ingot
	2275,  2000000,			-- Scintillant Ingot
	8724,  2000000,			-- Beryllium Ingot
	8748,  2000000,			-- Ra'Kaznar Ingot
	3923,  2000000,			-- Rhodium Ingot
	8704,  2000000,			-- Bismuth Ingot
	657,   2000000,			-- Lump of Tama-Hagane
	8751,  2000000,			-- Square of Ancestral Cloth
	836,   2000000,			-- Square of Damascene Cloth
	4028,  2000000,			-- Square of Akaso Cloth
	723,   2000000,			-- Piece of Divine Lumber
	8726,  2000000,			-- Piece of Exalted Lumber
	719,   2000000,			-- Piece of Ebony Lumber
	4019,  2000000,			-- Piece of Guatambu Lumber
	21392, 5000000,			-- Animator Z
	21393, 5000000,			-- Arasy Sachet
}
	
local stock_t2_locked = {
	9249, 1500000,			-- Chunk of Ruthenium Ore
	9247, 1500000,			-- Chunk of Niobium Ore
	8721, 1500000,			-- Chunk of Hepatizon Ore
	9251, 1500000,			-- Spool of Khoma Thread
	1313, 2500000,			-- Locks of Siren's hair
	8727, 2500000,			-- Sif's Lock
	3449, 2500000,			-- Celaeno's Cloth
	3544, 2500000,			-- Penelope's Cloth
	3549, 500000,			-- Vial of Belladonna sap
	3926, 4000000,			-- Urunday Log
	9245, 4000000,			-- Cypress Log
	3547, 5000000,			-- Sealord Skin
	4080, 5000000,			-- Moonbow Urushi
	4081, 5000000,			-- Moonbow Stone
	4077, 5000000,			-- Piece of Moonbow Steel
	4079, 5000000,			-- Square of Moonbow Leather
	4078, 5000000,			-- Bolt of Moonbow Cloth
	9252, 5000000,			-- Square of Khoma Cloth
	8720, 5000000,			-- Maliyakaleya Orb
	9250, 7500000,			-- Ruthenium Ingot
	9248, 7500000,			-- Niobium Ingot
	8722, 7500000,			-- Hepatizon Ingot
	3927, 7500000,			-- Piece of Urunday Lumber
	9246, 7500000,			-- Piece of Cypress Lumber
	2359, 7500000,			-- Star Sapphire
	1409, 7500000, 			-- Spool of Siren's Macrame
	8728, 7500000,			-- Spool of Sif's Macrame
	4014, 7500000,			-- Yggdreant Bole
	766,  10000000,			-- Ormolu Ingot
	8719, 10000000,			-- Piece of Maliyakaleya Coral
	9062, 10000000,			-- Dark Matter
	9003, 15000000,			-- Chunk of Plovid Flesh
	3548, 15000000,			-- Square of Sealord Leather
	9004, 15000000,			-- Macuil Plating
	9006, 15000000,			-- Defiant Scarf
	9061, 15000000,			-- Hades' Claw
	9063, 15000000,			-- Tartarian Soul
}

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
	player:PrintToPlayer(string.format("History : I will provide rewards for particular pieces of historical furniture you find on notorious monsters!"),xi.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("History : I also sell advanced materials to proven heroes!"),xi.msg.channel.NS_SAY)
end)


m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrade",  npcToReplaceName), function(player, npc, trade)
	local playerLvl = player:getMainLvl() + player:getItemLevel()
	local t1Unlock = 0
	local t2Unlock = 0
	local valueTotal = 0
	local tradeQty = {}
	
	-- Check for furnishings included in trade
	for i = 1, #acceptedTrades do
		if (npcUtil.tradeHas(trade, {acceptedTrades[i][1]})) then
			tradeQty[i] = trade:getItemQty(acceptedTrades[i][1])
			valueTotal = valueTotal + (tradeQty[i] * acceptedTrades[i][2])
			-- printf("History.lua onTrade  TRADE %i QTY: [%i]  TOTAL VALUE: [%i]", i, tradeQty[i], valueTotal)
		end
	end
		
	if (valueTotal > 0 and trade:getGil() == 0) then
		player:PrintToPlayer(string.format("History : Here's %i gil for your valuable finds!", valueTotal),xi.msg.channel.NS_SAY)
		player:tradeComplete()
		player:addGil(valueTotal)
	elseif (valueTotal == 0 and trade:getGil() == 0) then
		player:PrintToPlayer(string.format("History : Sorry, I can't take those items.", valueTotal),xi.msg.channel.NS_SAY)
	end
	
	-- Shops
	if (valueTotal == 0 and trade:getGil() > 0) then
		if (player:getCharVar("KillCounter_AbsoluteVirtue") >= 1) then
			t1Unlock = 1
		end
		
		if (player:getCharVar("KillCounter_Akvan") >= 1 and player:getCharVar("KillCounter_Kaggen") >= 1 and player:getCharVar("KillCounter_Pil") >= 1) then
			t2Unlock = 1
		end
		
		if (trade:getGil() == 2 and t1Unlock == 1 and t2Unlock == 1) then
			player:PrintToPlayer(string.format("History : I sell advanced materials to proven heroes! Here's the second page of my shop!"),xi.msg.channel.NS_SAY)
			xi.shop.general(player, stock_t2_locked)
		elseif (trade:getGil() == 1 and t1Unlock == 1) then
			player:PrintToPlayer(string.format("History : I sell advanced materials to proven heroes! Here's the first page of my shop!"),xi.msg.channel.NS_SAY)
			xi.shop.general(player, stock_t1_locked)
		else
			player:PrintToPlayer(string.format("History : Looks like there's still some killing to be done before I can sell anything to you."),xi.msg.channel.NS_SAY)
		end
	end
end)

return m 
