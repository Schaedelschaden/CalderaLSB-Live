-----------------------------------
-- tpz.effect.DAMAGE_SPIKES
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    -- TODO: Is this non elemental damage? Physical? Fire?
    -- Why would SE use a separate status effects from blaze spikes if its fire though..
    target:addMod(tpz.mod.SPIKES, 1)
    target:addMod(tpz.mod.SPIKES_DMG, effect:getPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(tpz.mod.SPIKES, 1)
    target:delMod(tpz.mod.SPIKES_DMG, effect:getPower())
end

return effect_object
