-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Makel-Pakel
-- !pos -106 -2 -99 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Makel-Pakel")

local npcToReplaceName = "Makel-Pakel"

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
	local stock_Grips = 
	{
		19043, 7500,	-- Tenax Strap
		19044, 7500, 	-- Disciple Grip
		19045, 10000,	-- Succubus Grip
		19039, 20000,	-- Orca Strap
		19024, 35000,	-- Sword Strap
		19021, 35000,	-- Katana Strap
		19022, 35000,	-- Axe Grip
		19023, 35000,	-- Staff Strap
		19025, 35000,	-- Pole Grip
		19026, 35000,	-- Spear Strap
		19027, 35000,	-- Claymore Grip
		19028, 50000,	-- Magic Strap
		19040, 50000,	-- Shark Strap
		19031, 50000,	-- Fire Grip
		19032, 50000,	-- Water Grip
		19033, 50000,	-- Wind Grip
		19034, 50000,	-- Ice Grip
		19035, 50000,	-- Thunder Grip
		19036, 50000,	-- Earth Grip
		19037, 50000,	-- Light Grip
		19038, 50000,	-- Dark Grip
		19029, 75000,	-- Brave Grip
		19030, 75000,	-- Wise Strap
		19048, 75000,	-- Reign Grip
		18801, 75000,	-- Danger Grip
		18803, 75000,	-- Pax Grip
		19052, 75000,	-- Divinus Grip
		19053, 75000,	-- Curatio Grip
		19054, 75000,	-- Fulcio Grip
		19055, 75000,	-- Macero Grip
		19056, 75000,	-- Elementa Grip
		19057, 75000,	-- Caecus Grip
		19058, 75000,	-- Vox Grip
		19059, 75000,	-- Quire Grip
	}
	
	xi.shop.general(player, stock_Grips)
	
	player:PrintToPlayer(string.format("Makel-Pakel : I hear you're looking for grips for two-handed weapons!"),xi.msg.channel.NS_SAY)
	-- local trigger = math.random(1,6)
	
	-- if (trigger == 1) then
-- --		player:PrintToPlayer(string.format("Makel-Pakel : *sniffle* G-g-go away! Some weird guy named Lmfaoo dresses up like a dancer and keeps assaulting me!"),xi.msg.channel.NS_SAY)
		-- player:PrintToPlayer(string.format("Makel-Pakel : I'm in recovery!"),xi.msg.channel.NS_SAY)
	-- elseif (trigger == 2) then
-- --		player:PrintToPlayer(string.format("Makel-Pakel : *whimper* Lmfaoo only makes me call him daddy..."),xi.msg.channel.NS_SAY)
		-- player:PrintToPlayer(string.format("Makel-Pakel : *glances around suspiciously*"),xi.msg.channel.NS_SAY)
	-- elseif (trigger == 3) then
-- --		player:PrintToPlayer(string.format("Makel-Pakel : No! Please!"),xi.msg.channel.NS_SAY)
		-- player:PrintToPlayer(string.format("Makel-Pakel : You haven't seen someone named Lmfaoo lurking around have you?"),xi.msg.channel.NS_SAY)
	-- elseif (trigger == 4) then
-- --		player:PrintToPlayer(string.format("Makel-Pakel : W-w-where am I?"),xi.msg.channel.NS_SAY)
		-- player:PrintToPlayer(string.format("Makel-Pakel : Gah! You scared me!"),xi.msg.channel.NS_SAY)
	-- elseif (trigger == 5) then
-- --		player:PrintToPlayer(string.format("Makel-Pakel : Who are you?!"),xi.msg.channel.NS_SAY)
		-- player:PrintToPlayer(string.format("Makel-Pakel : You're not going to start dancing are you?"),xi.msg.channel.NS_SAY)
	-- elseif (trigger == 6) then
-- --		player:PrintToPlayer(string.format("Makel-Pakel : How did I get here?!"),xi.msg.channel.NS_SAY)
		-- player:PrintToPlayer(string.format("Makel-Pakel : *heaves a sigh of relief*"),xi.msg.channel.NS_SAY)
	-- end
end)

return m