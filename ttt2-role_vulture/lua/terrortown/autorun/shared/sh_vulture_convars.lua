-- convar for how many bodies the vulture needs to eat
CreateConVar("ttt2_vult_consumed_bodies_win_threshold", 0.35, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
-- convar for how much damage the vulture's knife does
CreateConVar("ttt2_vult_talon_damage", 34, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
-- convar for how much health the vulture gains after eating a body
CreateConVar("ttt2_vult_talon_healing", 30, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
-- convar for the vulture's digestion timer
CreateConVar("ttt2_vult_digestion_time", 15, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
-- convar for the vulture's global warning after consuming a body
CreateConVar("ttt2_vult_eat_warning", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicVultureCVars", function(tbl)
  tbl[ROLE_VULTURE] = tbl[ROLE_VULTURE] or {}

table.insert(tbl[ROLE_VULTURE], {
	cvar = "ttt2_vult_consumed_bodies_win_threshold",
	slider = true,
	min = 0,
	max = 1,
	decimal = 2,
	desc = "ttt2_vult_consumed_bodies_win_threshold (def. 0.35)"
})

table.insert(tbl[ROLE_VULTURE], {
	cvar = "ttt2_vult_talon_damage",
	slider = true,
	min = 1,
	max = 100,
	decimal = 0,
	desc = "ttt2_vult_talon_damage (def. 34)"
})

table.insert(tbl[ROLE_VULTURE], {
	cvar = "ttt2_vult_talon_healing",
	slider = true,
	min = 1,
	max = 100,
	decimal = 0,
	desc = "ttt2_vult_talon_healing (def. 30)"
})

table.insert(tbl[ROLE_VULTURE], {
	cvar = "ttt2_vult_digestion_time",
	slider = true,
	min = 3,
	max = 120,
	decimal = 0,
	desc = "ttt2_vult_digestion_time (def. 15)"
})

table.insert(tbl[ROLE_VULTURE], {
	cvar = "ttt2_vult_eat_warning",
	slider = true,
	min = 0,
	max = 1,
	decimal = 0,
	desc = "ttt2_vult_eat_warning (def. 1)"
})
end)
