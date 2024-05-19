VULTURE_DATA = {}
VULTURE_DATA.amount_eaten = 0
VULTURE_DATA.amount_to_win = GetConVar("ttt2_vult_consumed_bodies_win_threshold"):GetInt()

if CLIENT then
	net.Receive("ttt2_role_vulture_update", function()
		VULTURE_DATA.amount_eaten = net.ReadUInt(16)
<<<<<<< Updated upstream
=======
		VULTURE_DATA.amount_to_win = net.ReadUInt(16)
>>>>>>> Stashed changes
	end)
end

if SERVER then
    util.AddNetworkString("ttt2_role_vulture_update")
end

function VULTURE_DATA:AddEaten()
    self.amount_eaten = self.amount_eaten + 1

    --sync to client
    net.Start("ttt2_role_vulture_update")
    net.WriteUInt(self.amount_eaten, 16)
    net.WriteUInt(self.amount_to_win, 16)
    net.Broadcast()
end

function VULTURE_DATA:GetEatenAmount()
    return self.amount_eaten
end

function VULTURE_DATA:GetAmountToWin()
	return self.amount_to_win
end