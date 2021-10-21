-----------------------------------
-- The Promise
--
-- Kohlo-Lakolo, !pos -26.8 -6 190 240
-----------------------------------
require('scripts/globals/items')
require("scripts/globals/keyitems")
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/interaction/quest')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_PROMISE)

quest.reward =
{
    fame     = 10,
    fameArea = WINDURST,
    item     = xi.items.PROMISE_BADGE,
}

quest.sections =
{
    -- Section: Quest is available.
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.WILD_CARD) == QUEST_COMPLETED
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Kohlo-Lakolo'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:needToZone() == false and
                        player:getMainLvl() >= 5 and
                        player:getFameLevel(WINDURST) >= 5
                    then
                        if player:getRank(xi.nation.WINDURST) < 9 then
                            return quest:progressEvent(513, 0, xi.ki.INVISIBLE_MAN_STICKER) -- Quest starting event in time.
                        else
                            return quest:progressEvent(532, 0, xi.ki.INVISIBLE_MAN_STICKER) -- Quest starting event late.
                        end
                    else
                        if player:getRank(xi.nation.WINDURST) < 9 then
                            return quest:event(505) -- Default text in time.
                        else
                            return quest:event(535) -- Default text late.
                        end
                    end
                end,
            },
            ['Gomada-Vulmada'] =
            {
                onTrigger = function(player, npc)
                    if player:getRank(xi.nation.WINDURST) >= 9 then
                        return quest:event()
                    end
                end,
            }
            ['Papo-Hopo'] =
            {
                onTrigger = function(player, npc)
                    if player:getRank(xi.nation.WINDURST) >= 9 then
                        return quest:event()
                    end
                end,
            }
            ['Pichichi'] =
            {
                onTrigger = function(player, npc)
                    if player:getRank(xi.nation.WINDURST) >= 9 then
                        return quest:event()
                    end
                end,
            }
            ['Pyo_Nzon'] =
            {
                onTrigger = function(player, npc)
                    if player:getRank(xi.nation.WINDURST) >= 9 then
                        return quest:event()
                    end
                end,
            }
            ['Yafa_Yaa'] =
            {
                onTrigger = function(player, npc)
                    if player:getRank(xi.nation.WINDURST) >= 9 then
                        return quest:event()
                    end
                end,
            }

            onEventFinish =
            {
                [513] = function(player, csid, option, npc)
                    quest:begin(player)
                    quest:setVar(player, 'Prog', 1) -- Start in time.
                end,
                [532] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    -- Section: Quest accepeted.
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Kohlo-Lakolo'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.INVISIBLE_MAN_STICKER) then
                        if quest:getVar(player, 'Prog') == 1 then
                            if player:getRank(xi.nation.WINDURST) < 9 then
                                return quest:progressEvent(522, 0, xi.ki.INVISIBLE_MAN_STICKER) -- Quest Complete. In time.
                            else
                                return quest:progressEvent(542, 0, xi.ki.INVISIBLE_MAN_STICKER) -- Quest Complete. Started in time, arrived late.
                            end
                        else
                            return quest:progressEvent(534, 0, xi.ki.INVISIBLE_MAN_STICKER) -- Quest Complete. Started late.
                        end
                    else
                        if quest:getVar(player, 'Prog') == 1 then
                            if player:getRank(xi.nation.WINDURST) < 9 then
                                return quest:event(514) -- Reminder. In time.
                            else
                                return quest:event(543, 0, xi.ki.INVISIBLE_MAN_STICKER) -- Reminder. Started in time, but are late.
                            end
                        else
                            return quest:event(533, 0, xi.ki.INVISIBLE_MAN_STICKER) -- Reminder. Started late.
                        end
                    end
                end,
            },
            ['Gomada-Vulmada'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 1 and
                        player:getRank(xi.nation.WINDURST) < 9
                    then
                        return quest:event(518)
                    else
                        return quest:event(528)
                    end
                end,
            }
            ['Papo-Hopo'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 1 and
                        player:getRank(xi.nation.WINDURST) < 9
                    then
                        return quest:event(515)
                    else
                        return quest:event(525)
                    end
                end,
            }
            ['Pichichi'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 1 or
                        player:getRank(xi.nation.WINDURST) >= 9
                    then
                        return quest:event(530)
                    end
                end,
            }
            ['Pyo_Nzon'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 1 and
                        player:getRank(xi.nation.WINDURST) < 9
                    then
                        return quest:event(517)
                    else
                        return quest:event()
                    end
                end,
            }
            ['Shanruru'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 0 or
                        player:getRank(xi.nation.WINDURST) >= 9
                    then
                        return quest:event(529)
                    end
                end,
            }
            ['Yafa_Yaa'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 1 and
                        player:getRank(xi.nation.WINDURST) < 9
                    then
                        return quest:event(516)
                    else
                        return quest:event(526)
                    end
                end,
            }

            onEventFinish =
            {
                [522] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setCharVar('SOBfinalEvent', 1)
                    end
                end,
                [534] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setCharVar('SOBfinalEvent', 1)
                    end
                end,
                [542] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setCharVar('SOBfinalEvent', 1)
                    end
                end,
            },
        },

        [xi.zone.WINDURST_WATERS] =
        {
            ['Chamama'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.INVISIBLE_MAN_STICKER) then
                        return quest:event(800)
                    elseif quest:getVar(player, 'Chamama') > 0 then
                        return quest:event(798, 0, xi.items.SHOALWEED, xi.ki.INVISIBLE_MAN_STICKER)
                    else
                        return quest:progressEvent(797, 0, xi.items.SHOALWEED, xi.ki.INVISIBLE_MAN_STICKER)
                    end
                end,

                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Chamama') == 1 and
                        npcUtil.tradeHasExactly(trade, {{xi.items.SHOALWEED, 1}}) and
                        not player:hasKeyItem(xi.ki.INVISIBLE_MAN_STICKER)
                    then
                        return quest:progressEvent(799, 0, 0, xi.ki.INVISIBLE_MAN_STICKER)
                    end
                end,
            },

            onEventFinish =
            {
                [797] = function(player, csid, option, npc)
                    quest:setVar(player, 'Chamama', 1)
                end,

                [799] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, xi.ki.INVISIBLE_MAN_STICKER)
                end,
            },
        },
    },

    -- Section: Quest completed.
    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Gomada-Vulmada'] =
            {
                onTrigger = function(player, npc)
                    if player:getCharVar('SOBfinalEvent') == 1 then
                        return quest:event(540)
                    else
                        return quest:event(590)
                    end
                end,
            }
            ['Kohlo-Lakolo'] =
            {
                onTrigger = function(player, npc)
                    if player:getCharVar('SOBfinalEvent') == 1 then
                        if  then
                            return quest:progressEvent(584)
                        else
                            return quest:event(528)
                        end
                    else
                        local random = math.random(0, 1)
                        if random = 0
                            return quest:event(544)
                        else
                            return quest:event(585)
                        end
                    end
                end,
            },
            ['Papo-Hopo'] =
            {
                onTrigger = function(player, npc)
                    if player:getCharVar('SOBfinalEvent') == 1 then
                        return quest:event(537)
                    else
                        return quest:event(587)
                    end
                end,
            }
            ['Pichichi'] =
            {
                onTrigger = function(player, npc)
                    if player:getCharVar('SOBfinalEvent') == 1 then
                        return quest:event(536)
                    else
                        return quest:event(586)
                    end
                end,
            }
            ['Pyo_Nzon'] =
            {
                onTrigger = function(player, npc)
                    if player:getCharVar('SOBfinalEvent') == 1 then
                        return quest:event(539)
                    else
                        return quest:event(589)
                    end
                end,
            }
            ['Shanruru'] =
            {
                onTrigger = function(player, npc)
                    if player:getCharVar('SOBfinalEvent') == 1 then
                        return quest:event(541)
                    else
                        return quest:event(591)
                    end
                end,
            }
            ['Yafa_Yaa'] =
            {
                onTrigger = function(player, npc)
                    if player:getCharVar('SOBfinalEvent') == 1 then
                        return quest:event(538)
                    else
                        return quest:event(588)
                    end
                end,
            }

            onEventFinish =
            {
                [584] = function(player, csid, option, npc)
                    player:setCharVar('SOBfinalEvent', 0)
                end,
            },
        },
    },
}

return quest
