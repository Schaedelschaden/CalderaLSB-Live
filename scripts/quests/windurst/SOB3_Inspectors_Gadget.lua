-----------------------------------
-- Inspector's Gadget!
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

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.INSPECTOR_S_GADGET)

quest.reward =
{
    fame     = 10,
    fameArea = WINDURST,
    item     = xi.items.HEKO_OBI,
    title    = xi.title.FAKE_MOUSTACHED_INVESTIGATOR,
}

quest.sections =
{
    -- Section: Quest is available.
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.KNOW_ONE_S_ONIONS) == QUEST_COMPLETED
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Kohlo-Lakolo'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:needToZone() == false and
                        player:getMainLvl() >= 5 and
                        player:getFameLevel(WINDURST) >= 2
                    then
                        return quest:progressEvent(413) -- Quest starting event.
                    else
                        return quest:event(401) -- Default text.
                    end
                end,
            },

            onEventFinish =
            {
                [413] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
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
                    if player:hasKeyItem(xi.ki.FAKE_MOUSTACHE) then
                        return quest:progressEvent(421)
                    else
                        return quest:event(414)
                    end
                end,
            },

            -- Reminder text.
            ['Gomada-Vulmada'] = quest:event(417),
            ['Papo-Hopo']      = quest:event(416),
            ['Pichichi']       = quest:event(415, 0, xi.ki.FAKE_MOUSTACHE),
            ['Pyo_Nzon']       = quest:event(418),
            ['Shanruru']       = quest:event(420),
            ['Yafa_Yaa']       = quest:event(419),

            onEventFinish =
            {
                [415] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [421] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:needToZone(true)
                    end
                end,
            },
        },

        [xi.zone.WINDURST_WATERS] =
        {
            ['Chamama'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.FAKE_MOUSTACHE) then
                        return quest:event(553)
                    elseif quest:getVar(player, 'Prog') > 0 then
                        return quest:progressEvent(551, 0, xi.ki.FAKE_MOUSTACHE)
                    end
                end,

                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Prog') == 2 and
                        npcUtil.tradeHasExactly(trade, {{xi.items.BALL_OF_SARUTA_COTTON, 4}}) and
                        not player:hasKeyItem(xi.ki.FAKE_MOUSTACHE)
                    then
                        return quest:progressEvent(552)
                    end
                end,
            },

            onEventFinish =
            {
                [551] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        quest:setVar(player, 'Prog', 2)
                    end
                end,

                [552] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, xi.ki.FAKE_MOUSTACHE)
                end,
            },
        },
    },

    -- Section: Quest completed.
    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED and
                player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.ONION_RINGS) == QUEST_AVAILABLE
        end,

        [xi.zone.PORT_WINDURST] =
        {
            -- New default texts.
            ['Gomada-Vulmada'] = quest:event(425):replaceDefault(),
            ['Papo-Hopo']      = quest:event(424):replaceDefault(),
            ['Pichichi']       = quest:event(423):replaceDefault(),
            ['Pyo_Nzon']       = quest:event(426):replaceDefault(),
            ['Shanruru']       = quest:event(428):replaceDefault(),
            ['Yafa_Yaa']       = quest:event(427):replaceDefault(),
        },
    },
}

return quest
