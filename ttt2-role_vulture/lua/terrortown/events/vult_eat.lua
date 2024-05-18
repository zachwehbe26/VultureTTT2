if CLIENT then
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_vult.vmt")
    EVENT.title = "EVENT_VULT_CONSUME"
	
	--The deputy uses some sort of status to get the timer next to a png like a gun or in this case, a vulture.
	--But I don't think this is in normal glua, and doesn't exist outside of the source code(seriously try googling it)
	hook.Add("Initialize", "ttt2_vult_init", function()
		STATUS:RegisterStatus("ttt2_vult_cooldown_stat", {
			hud = Material("vgui/ttt/icons/digesting_icon.png"),
			type = "bad",
			name = "Digestion cooldown",
			sidebarDescription = "You cannot eat bodies until this cooldown is up."
		})
	end)
end

--Function that increases bodies consumed
local function incVultCounter()
	-- increment eaten bodies
    VULTURE_DATA:AddEaten()
	-- warn everyone that a vulture is feasting
    LANG.MsgAll("label_vult_consume_notification", nil, MSG_MSTACK_WARN)
	-- if vulture has eaten enough, then he wins
	if(VULTURE_DATA.amount_eaten >= GetConVar("ttt2_vult_consumed_bodies_win_threshold"):GetInt()) then
        roles.VULTURE.shouldWin = true
        VULTURE_DATA.amount_eaten = 0
    end
end


-- reset hooks at round end AND start
hook.Add("TTTEndRound", "VultureEndRound", function()
	roles.VULTURE.shouldWin = false
    VULTURE_DATA.amount_eaten = 0
end)

hook.Add("TTTBeginRound", "VultureBeginRound", function()
	roles.VULTURE.shouldWin = false
    VULTURE_DATA.amount_eaten = 0
end)

--hook that will increase bodies consumed by one
if SERVER then
    hook.Add("EVENT_VULT_CONSUME", "ttt_increase_vult_counter", incVultCounter)
end