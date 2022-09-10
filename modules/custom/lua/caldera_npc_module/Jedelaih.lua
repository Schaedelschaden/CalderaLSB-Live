-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Jedelaih
-- !pos -99 -2 -104 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Jedelaih")

local npcToReplaceName = "Jedelaih"

local acceptedSeals = {
					   -- Beastmen's Seal, Kindred's Crest, High Kindred Crest, Sacred Kindred Crest
					   1126, 2955, 2956, 2957
					   }

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrade", npcToReplaceName), function(player,npc,trade)
	local sealID
	local sealQty
	local foundType
	local resultingKSeals
	
	for i = 1, #acceptedSeals do
		sealQty = trade:getItemQty(acceptedSeals[i])
		
		if (sealQty > 0) then
			sealID = acceptedSeals[i]
			foundType = i
			break
		end
	end
	
	if (sealQty == 0 or sealQty == nil) then
		player:PrintToPlayer(string.format("Jedelaih : What're ya tryin' to pull! I didn't ask for that!"),xi.msg.channel.NS_SAY)
	elseif (foundType == 1 and sealQty % 3 == 0) then
		resultingKSeals = sealQty / 3
		
		if (resultingKSeals > 1) then
			player:PrintToPlayer(string.format("Jedelaih : I'll take these %i Beastmen's Seals and give you %i Kindred's Seals.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		else
			player:PrintToPlayer(string.format("Jedelaih : I'll take these %i Beastmen's Seals and give you %i Kindred's Seal.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		end
	elseif (foundType == 2 and sealQty % 2 == 0) then
		resultingKSeals = sealQty / 2
		
		if (resultingKSeals > 1) then
			player:PrintToPlayer(string.format("Jedelaih : I'll take these %i Kindred's Crests and give you %i Kindred's Seals.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		else
			player:PrintToPlayer(string.format("Jedelaih : I'll take these %i Kindred's Crests and give you %i Kindred's Seal.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		end
	elseif (foundType == 3) then
		resultingKSeals = sealQty
		
		if (sealQty > 1) then
			player:PrintToPlayer(string.format("Jedelaih : I'll take these %i High Kindred's Crests and give you %i Kindred's Seals.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		else
			player:PrintToPlayer(string.format("Jedelaih : I'll take this %i High Kindred's Crest and give you %i Kindred's Seal.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		end
	elseif (foundType == 4) then
		resultingKSeals = sealQty * 2
		
		if (sealQty > 1) then
			player:PrintToPlayer(string.format("Jedelaih : I'll take these %i Sacred Kindred's Crests and give you %i Kindred's Seals.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		else
			player:PrintToPlayer(string.format("Jedelaih : I'll take this %i Sacred Kindred's Crest and give you %i Kindred's Seals.", sealQty, resultingKSeals),xi.msg.channel.NS_SAY)
		end
	else
		player:PrintToPlayer(string.format("Jedelaih : I'm gonna need more of those before I can convert them for you."),xi.msg.channel.NS_SAY)
		return
	end
	
	local trades = {{{sealID, sealQty}}}
	
	if npcUtil.tradeHasExactly(trade, trades[1]) then
		player:addItem(1127, resultingKSeals)
		player:messageSpecial(ID.text.ITEM_OBTAINED, 1127)
		player:tradeComplete(trade)
		player:PrintToPlayer(string.format("Jedelaih : Gahahaha! Much obliged! *madly strums away*."),xi.msg.channel.NS_SAY)
	else
		player:PrintToPlayer(string.format("Jedelaih : What're ya tryin' to pull! I didn't ask for that!"),xi.msg.channel.NS_SAY)
		return
	end
end)

m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
	player:PrintToPlayer(string.format("Jedelaih : I'll convert Beastmen Seals, Kindred's Crests, High Kindred Crests, and Sacred Kindred Crests into Kindred's Seals!"),xi.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Jedelaih : My exchange rates are:"),xi.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Jedelaih : 3 Beastmen Seals -> 1 Kindred's Seal          2 Kindred's Crests -> 1 Kindred's Seal"),xi.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Jedelaih : 1 High Kindred's Crest -> 1 Kindred's Seal     1 Sacred Kindred's Crest -> 2 Kindred's Seals"),xi.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Jedelaih : Gahahaha! *madly strums away*"),xi.msg.channel.NS_SAY)
end)

return m 