if CLIENT then
	EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_vult")
	EVENT.title = "title_event_vulture_eat"

	function EVENT:GetText()
		return {
			{
				string = "desc_event_vulture_eat",
				params = {
					vulture = self.event.vulture.nick,
					corpse = self.event.corpse.nick,
				},
				translateParams = true,
			},
		}
	end
end

if SERVER then
	function EVENT:Trigger(corpseid, corpsenick, vulture)	
		
		self:AddAffectedPlayers(
			{ vulture:SteamID64(), corpseid },
			{ vulture:Nick(), corpsenick }
		)

		return self:Add({
			vulture = {
				nick = vulture:Nick(),
				sid64 = vulture:SteamID64(),
			},
			corpse = {
				nick = corpsenick,
				sid64 = corpseid,
			},
		})
	end

	function EVENT:CalculateScore()
		local event = self.event

		self:SetPlayerScore(event.vulture.sid64, {
			score = 1,
		})
	end
end

function EVENT:Serialize()
	return self.event.vulture.nick .. " has eaten " .. self.event.corpse.nick .. "'s corpse."
end