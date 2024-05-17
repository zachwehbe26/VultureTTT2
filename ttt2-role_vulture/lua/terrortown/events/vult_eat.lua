if CLIENT then
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_mes.vmt")
    EVENT.title = "EVENT_VULT_CONSUME"
end
--Function that increases bodies consumed by 1
local function incVultCounter(a)
    local currentBodiesEaten = a
    if(a >= GetConVar("ttt2_vult_consumed_bodies_win_threshold"):GetInt())
        print("Vulture wins")
    end
end

--hook that will increase bodies consumed by one
if SERVER then
    hook.Add("EVENT_VULT_CONSUME", "ttt_increase_vult_counter", incVultCounter)
end