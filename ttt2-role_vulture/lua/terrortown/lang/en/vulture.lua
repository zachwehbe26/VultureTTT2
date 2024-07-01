local L = LANG.GetLanguageTableReference("en")

--Role Language Strings
L[VULTURE.name] = "Vulture"
L[VULTURE.defaultTeam] = "Team Vulture"
L["hilite_win_" .. VULTURE.defaultTeam] = "TEAM VULTURE WON"
L["win_" .. VULTURE.defaultTeam] = "The Vulture has won!"
L["info_popup_" .. VULTURE.name] = [[You are a scavenger of the skirmish. Consume bodies with your Vulture talon to win!]]
L["body_found_" .. VULTURE.abbr] = "They were a Vulture!"
L["search_role_" .. VULTURE.abbr] = "This person was a Vulture!"
L["ev_win_" .. VULTURE.defaultTeam] = "The Vulture has won!"
L["target_" .. VULTURE.name] = "Vulture"
L["ttt2_desc_" .. VULTURE.name] = [[The Vulture needs to eat a certain number of bodies to win. They come equipped with a vulture talon, which is used to consume bodies for health. 
The Vulture is also able to see bodies throughout the map, allowing for stealthy plays.]]


-- Weapon name
L["vult_knife_name"]    = "Vulture Talon"
-- Wallhacks
L["vult_corpse_player"] = "{nick}'s delicious corpse."
-- Convar strings
L["label_vult_consumed_bodies_win_threshold"] = "How many bodies the Vulture needs to eat to win: "
L["label_vult_talon_damage"]                  = "How much damage the Vulture Talon does: "
L["label_vult_talon_healing"]                 = "How much healing the Vulture Talon gives: "
L["label_vult_digestion_time"]                = "How much time digestion lasts: "
-- Alerts
L["label_vult_consume_notification"]          = "The Vulture has feasted..."
