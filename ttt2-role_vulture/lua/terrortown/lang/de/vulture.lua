local L = LANG.GetLanguageTableReference("en")

--Role Language Strings
L[VULTURE.name] = "Vulture"
L[VULTURE.defaultTeam] = "Team Vulture"
L["hilite_win_" .. VULTURE.defaultTeam] = "TEAM VULTURE GEWANN"
L["win_" .. VULTURE.defaultTeam] = "Der Vulture hat gewonnen!"
L["info_popup_" .. VULTURE.name] = [[Du bist ein Aasfresser auf der Jagd. Friss leichen mit deiner Vulture Kralle um zu gewinnen!]]
L["body_found_" .. VULTURE.abbr] = "Er war ein Vulture!"
L["search_role_" .. VULTURE.abbr] = "Diese Person war ein Vulture!"
L["ev_win_" .. VULTURE.defaultTeam] = "Der Vulture hat gewonnen!"
L["target_" .. VULTURE.name] = "Vulture"
L["ttt2_desc_" .. VULTURE.name] = [[Der Vulture muss eine bestimmte Anzahl an Leichen essen um zu gewinnen. Der Vulture hat seine Vulture Kralle mit der er Leichen essen und sich selbst heilen kann. 
Der Vulture kann auch Leichen auf der ganzen Karte sehen.]]


-- Weapon name
L["vult_knife_name"]                            = "Vulture Kralle"
-- Wallhacks
L["vult_corpse_player"]                         = "{nick}s leckere Leiche."
-- Convar strings
L["label_vult_consumed_bodies_win_threshold"]   = "Wie viele Leichen muss der Vulture essen um zu gewinnen: "
L["label_vult_talon_damage"]                    = "Wie viel Schaden macht die Vulture Kralle: "
L["label_vult_talon_healing"]                   = "Wie viel heilt die Vulture Kralle: "
L["label_vult_digestion_time"]                  = "Wie lange dauert die Verdauung?: "
L["label_ttt2_vult_eat_warning"]                = "Sollen alle Spieler gewarnt werden wenn der Vulture eine Leiche gegessen hat: "
L["label_ttt2_vult_eat_fake"]                   = "Kann der Vulture gefälschte Leichen essen: " --todo: improve wording

-- Status string
L["label_vult_digestion_cooldown"]              = "Verdauung"
L["label_vult_digestion_cooldown_desc"]         = "Du hast gerade gegessen und musst erst verdauen bevor du wieder essen kannst."

-- Alerts
L["label_vult_consume_notification"]            = "Der Vulture hat gespeißt..."
L["label_vult_not_corpse"]            			= "Das ist keine Spieler Leiche! Du kannst es nicht essen."

-- Event
L["title_event_vulture_eat"]            = "Vulture Speißt"
L["desc_event_vulture_eat"]            = "Der Vulture hat eine Leiche verspeißt."