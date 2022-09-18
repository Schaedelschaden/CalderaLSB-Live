-----------------------------------
-- Area: Mamook
--   NM: Devout Radol Ja
-----------------------------------

require("modules/module_utils")
-----------------------------------
local m = Module:new("Devout_Radol_Ja")

local mobToReplaceName = "Devout_Radol_Ja"

m:addOverride(string.format("xi.zones.Mamook.mobs.%s.onMobDespawn", mobToReplaceName), function( mob )
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(259200, 432000)) -- 3 to 5 days
end

return m
