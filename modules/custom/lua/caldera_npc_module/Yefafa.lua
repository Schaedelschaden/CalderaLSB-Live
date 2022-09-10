-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Yefafa
-- !pos -115.7428 -2.1500 -95.0393 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("modules/module_utils")
-----------------------------------

local m = Module:new("Yefafa")

local npcToReplaceName = "Yefafa"


m:addOverride(string.format("xi.zones.Celennia_Memorial_Library.npcs.%s.onTrigger", npcToReplaceName), function(player,npc)
    player:PrintToPlayer(string.format("Yefafa : You want me to act like a Moogle huh!? Well, ku-po-po-KUPOW!"),xi.msg.channel.NS_SAY)
	player:dispelAllStatusEffect(bit.bor(xi.effectFlag.NONE, xi.effectFlag.DISPELABLE, xi.effectFlag.ERASABLE, xi.effectFlag.ATTACK,
										 xi.effectFlag.EMPATHY, xi.effectFlag.DAMAGE, xi.effectFlag.MAGIC_BEGIN,
										 xi.effectFlag.MAGIC_END, xi.effectFlag.ON_ZONE, xi.effectFlag.NO_LOSS_MESSAGE, xi.effectFlag.INVISIBLE,
										 xi.effectFlag.DETECTABLE, xi.effectFlag.NO_REST, xi.effectFlag.PREVENT_ACTION, xi.effectFlag.WALTZABLE,
										 xi.effectFlag.SONG, xi.effectFlag.ROLL, xi.effectFlag.CONFRONTATION, xi.effectFlag.LOGOUT,
										 xi.effectFlag.BLOODPACT, xi.effectFlag.ON_JOBCHANGE, xi.effectFlag.OFFLINE_TICK, xi.effectFlag.AURA))
    player:sendMenu(1)
end)

return m