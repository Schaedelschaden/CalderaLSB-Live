-----------------------------------
-- xi.effect.FEALTY
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
   target:addMod(xi.mod.MEVA, 200)
   target:addMod(xi.mod.CHARMRES, 100)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
   target:delMod(xi.mod.MEVA, 200)
   target:delMod(xi.mod.CHARMRES, 100)
end

return effect_object
