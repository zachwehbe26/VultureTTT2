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
	hook.Add("TTTBeginRound","ttt_display hud",function()
	STATUS:RegisterStatus("ttt2_display_consume_hud", {
			hud = Material("vgui/ttt/icons/eating_icon.png"),
			type = "bad",
			name = "Body Consumption Count",
			sidebarDescription = "How many bodies you eat before you win."
		})
	end)
end

--Function that increases bodies consumed by 'a'
local function incVultCounter(a)
    VULTURE_DATA.amount_eaten = VULTURE_DATA.amount_eaten + a
    print("Currently you ate this many bodies:", VULTURE_DATA.amount_eaten)
    LANG.MsgAll("label_vult_consume_notification",nil,MSG_MSTACK_WARN)
	if(VULTURE_DATA.amount_eaten >= GetConVar("ttt2_vult_consumed_bodies_win_threshold"):GetInt()) then
        roles.VULTURE.shouldWin = true
        VULTURE_DATA.amount_eaten = 0
        print("Bodies eaten reset to:", VULTURE_DATA.amount_eaten)
    end
end


-- reset hooks at round end AND start
hook.Add("TTTEndRound", "VultureEndRound", function()
	roles.VULTURE.shouldWin = false
    VULTURE_DATA.amount_eaten = 0
	print("Round over!!!!!")
end)
hook.Add("TTTBeginRound", "VultureBeginRound", function()
	roles.VULTURE.shouldWin = false
    VULTURE_DATA.amount_eaten = 0
	print("Round begin!!!!!")
end)


--hook that will increase bodies consumed by one
if SERVER then
    hook.Add("EVENT_VULT_CONSUME", "ttt_increase_vult_counter", incVultCounter)
end


