﻿/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "event_handler.h"

void CAIEventHandler::addListener(const std::string& eventname, sol::function lua_func, const std::string& identifier)
{
    eventListeners[eventname].emplace_back(identifier, lua_func);
}

void CAIEventHandler::removeListener(std::string identifier)
{
    for (auto&& eventListener : eventListeners)
    {
        auto remove = [&identifier](const ai_event_t& event)
        {
            return identifier == event.identifier;
        };

        auto it = std::remove_if(eventListener.second.begin(), eventListener.second.end(), remove);
        eventListener.second.erase(it, eventListener.second.end());
    }
}
