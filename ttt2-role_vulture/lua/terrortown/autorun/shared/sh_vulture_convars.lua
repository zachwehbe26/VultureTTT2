-- convar for how many bodies he needs to eat -- TODO!!!!!!!!!!!!!!!!!!!!!!!!
CreateConVar("ttt2_vult_consumed_bodies_win_threshold", 2, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
-- convar for how much damage his knife does
CreateConVar("ttt2_vult_talon_damage", 34, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
-- convar for how much health he gains after eating a body
CreateConVar("ttt2_vult_talon_healing", 30, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
-- convar for his digestion timer -- TODO!!!!!!!!!!!!!!!!!!!!!!!!
CreateConVar("ttt2_vult_digestion_time", 15, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicVultureCVars", function(tbl)
  tbl[ROLE_VULTURE] = tbl[ROLE_VULTURE] or {}

table.insert(tbl[ROLE_VULTURE], {
      cvar = "ttt2_vult_consumed_bodies_win_threshold",
      slider = true,
      min = 2,
      max = 16,
      decimal = 0,
      desc = "ttt2_vult_consumed_bodies_win_threshold (def. 4)"
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
      min = 5,
      max = 120,
      decimal = 0,
      desc = "ttt2_vult_digestion_time (def. 15)"
})
end)