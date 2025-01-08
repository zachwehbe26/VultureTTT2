VULTURE_DATA = {}
VULTURE_DATA.amount_eaten = 0
VULTURE_DATA.amount_to_win = 99

if CLIENT then
	net.Receive("ttt2_role_vulture_update", function()
		VULTURE_DATA.amount_eaten = net.ReadUInt(16)
		VULTURE_DATA.amount_to_win = net.ReadUInt(16)
	end)
end

if SERVER then
	util.AddNetworkString("ttt2_role_vulture_update")
	
	hook.Add("TTTBeginRound","ttt_update_vult_threshold",function()
		
		roles.VULTURE.shouldWin = false
		VULTURE_DATA.amount_eaten = 0
		--Calculate how many corpses we need to eat to win
		VULTURE_DATA.amount_to_win = math.ceil(#util.GetActivePlayers() * GetConVar("ttt2_vult_consumed_bodies_win_threshold"):GetFloat())

		--Sends to client
		net.Start("ttt2_role_vulture_update")
		net.WriteUInt(VULTURE_DATA.amount_eaten, 16)
		net.WriteUInt(VULTURE_DATA.amount_to_win, 16)
		net.Broadcast()
	end)

	-- reset hooks at round end AND start
	hook.Add("TTTEndRound", "VultureEndRound", function()
		roles.VULTURE.shouldWin = false
		VULTURE_DATA.amount_eaten = 0
	end)
end

function VULTURE_DATA:AddEaten()
	self.amount_eaten = self.amount_eaten + 1
	
	-- warn everyone that a vulture is feasting
	if GetConVar("ttt2_vult_eat_warning"):GetBool() then
		LANG.MsgAll("label_vult_consume_notification", nil, MSG_MSTACK_WARN)
	end
	-- if vulture has eaten enough, then he wins
	if(self.amount_eaten >= self.amount_to_win) then
		roles.VULTURE.shouldWin = true
		--VULTURE_DATA.amount_eaten = 0
	end
	
	--Sync to client
	net.Start("ttt2_role_vulture_update")
	net.WriteUInt(VULTURE_DATA.amount_eaten, 16)
	net.WriteUInt(VULTURE_DATA.amount_to_win, 16)
	net.Broadcast()
end

--Needed for clientside HUD display
function VULTURE_DATA:GetEatenAmount()
	return self.amount_eaten
end

function VULTURE_DATA:GetAmountToWin()
	return self.amount_to_win
end