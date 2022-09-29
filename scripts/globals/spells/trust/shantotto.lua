-----------------------------------
-- Trust: Shantotto
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell, xi.magic.spell.SHANTOTTO_II)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.AJIDO_MARUJIDO] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.STAR_SIBYL] = xi.trust.message_offset.TEAMWORK_2,
        [xi.magic.spell.KORU_MORU] = xi.trust.message_offset.TEAMWORK_3,
        [xi.magic.spell.KING_OF_HEARTS] = xi.trust.message_offset.TEAMWORK_4
    })

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE, 60)

    local power = mob:getMainLvl() / 10
    mob:addMod(xi.mod.MATT, power)
    mob:addMod(xi.mod.MACC, power)
    mob:addMod(xi.mod.HASTE_MAGIC, 1000) -- 10% Haste (Magic)

    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
