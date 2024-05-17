if CLIENT then
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_mes.vmt")
    EVENT.title = "EVENT_VULT_CONSUME"
end

--Function that increases bodies consumed by 1
local function incVultCounter(a)
    local currentBodiesEaten = a + 1
    if(currentBodiesEaten >= GetConVar("ttt2_vult_consumed_bodies_win_threshold"):GetInt()) then
        roles.VULTURE.shouldWin = true
        print("VULTURE WIN DEBUG")
    end
    return currentBodiesEaten
end

-- reset hooks at round end
hook.Add("TTTEndRound", "VultureEndRound", function()
	roles.VULTURE.shouldWin = false
end)

--hook that will increase bodies consumed by one
if SERVER then
    hook.Add("EVENT_VULT_CONSUME", "ttt_increase_vult_counter", incVultCounter)
end