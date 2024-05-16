if CLIENT then
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_mes.vmt")
    EVENT.title = "EVENT_VULT_CONSUME"
end
--Function that increases bodies consumed by 1
local function incVultCounter(a)
            return a + 1
			--TODO
			--start a counter that says hes still digesting the body or something
			--CurTime()
			--if CurTime()+15 > digestitonTime
			--hes ready to eat again
         end
		 --hook that will increase bodies consumed by one
         if SERVER then
            hook.Add("EVENT_VULT_CONSUME", "ttt_increase_vult_counter", incVultCounter)
         end
--TODO
--Have another hook to check the win conditions