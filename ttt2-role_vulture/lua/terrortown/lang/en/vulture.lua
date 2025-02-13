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
L["vult_knife_name"]                            = "Vulture Talon"

-- Wallhacks
L["vult_corpse_player"]                         = "{nick}'s delicious corpse."

-- Convar strings
L["label_vult_consumed_bodies_win_threshold"]   = "How many bodies the Vulture needs to eat to win: "
L["label_vult_talon_damage"]                    = "How much damage the Vulture Talon does: "
L["label_vult_talon_healing"]                   = "How much healing the Vulture Talon gives: "
L["label_vult_digestion_time"]                  = "How much time digestion lasts: "
L["label_ttt2_vult_eat_warning"]                = "Should all players be warned when the vulture eats: "
L["label_ttt2_vult_eat_fake"]                   = "Can the Vulture eat death faker corpses: "

-- Status string
L["label_vult_digestion_cooldown"]              = "Digestion"
L["label_vult_digestion_cooldown_desc"]         = "You just ate and must digest before you can eat again."

-- Alerts
L["label_vult_consume_notification"]            = "The Vulture has feasted..."
L["label_vult_not_corpse"]            			= "This is not a player corpse! You cannot eat this one."

-- Event
L["title_event_vulture_eat"]            = "Vulture feast"
L["desc_event_vulture_eat"]            = "The Vulture has feasted on a corpse."

-- Scoreboard points
L["tooltip_vulture_eat_score"] = "Vulture feast: {score}"
L["vulture_eat_score"] = "Vulture feast:"
