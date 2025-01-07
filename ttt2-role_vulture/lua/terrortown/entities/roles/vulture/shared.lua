if SERVER then
	AddCSLuaFile()
end

roles.InitCustomTeam(ROLE.name, {
	icon = "vgui/ttt/dynamic/roles/icon_vult",
	color = Color(150, 123, 130, 255)
})

function ROLE:PreInitialize()
	self.color                      = Color(150, 123, 130, 255)

	self.abbr                       = "vult"
	self.surviveBonus               = 3
	self.score.killsMultiplier      = 2
	self.score.teamKillsMultiplier  = -8
	self.preventFindCredits         = true
	self.preventKillCredits         = true
	self.preventTraitorAloneCredits = true
	self.preventWin                 = false -- Can he win on his own? true means NO, false means YES
	self.unknownTeam                = false

	self.defaultTeam                = TEAM_VULTURE

	self.conVarData = {
		pct          = 0.15, -- necessary: percentage of getting this role selected (per player)
		maximum      = 1, -- maximum amount of roles in a round
		minPlayers   = 7, -- minimum amount of players until this role is able to get selected
		togglable    = true, -- option to toggle a role for a client if possible (F1 menu)
		random       = 33
	}
end

if SERVER then
	-- HANDLE WINNING HOOK
	hook.Add("TTTCheckForWin", "VultureCheckWin", function()
		if roles.VULTURE.shouldWin then
			roles.VULTURE.shouldWin = false

			return TEAM_VULTURE
		end
	end)

	-- Add the wallhacks on dead bodies
	hook.Add("TTTOnCorpseCreated", "VultAddedDeadBody", function(rag, ply)
		if not IsValid(rag) or not IsValid(ply) then return end

		local mvObject = rag:AddMarkerVision("corpse_vult")
		mvObject:SetOwner(ROLE_VULTURE)
		mvObject:SetVisibleFor(VISIBLE_FOR_ROLE)
		mvObject:SyncToClients()
	end)
	
	-- Remove the wallhacks on dead bodies
	hook.Add("EntityRemoved", "VultRemovedDeadBody", function(ent)
		if not IsValid(ent) or ent:GetClass() ~= "prop_ragdoll" then return end

		ent:RemoveMarkerVision("corpse_vult")
	end)
	
	-- Give Loadout on respawn and rolechange
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentWeapon("weapon_ttt_vult_knife")
	end

	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:StripWeapon("weapon_ttt_vult_knife")
	end
end

-- actual wallhacks part
if CLIENT then
	local TryT = LANG.TryTranslation
	local ParT = LANG.GetParamTranslation

	local materialCorpse = Material("vgui/ttt/tid/tid_big_corpse")

	hook.Add("TTT2RenderMarkerVisionInfo", "HUDDrawMarkerVisionVultCorpse", function(mvData)
		local client = LocalPlayer()
		local ent = mvData:GetEntity()
		local mvObject = mvData:GetMarkerVisionObject()

		if not client:IsTerror() or not mvObject:IsObjectFor(ent, "corpse_vult") then return end

		local distance = math.Round(util.HammerUnitsToMeters(mvData:GetEntityDistance()), 1)

		mvData:EnableText()

		mvData:AddIcon(materialCorpse)
		mvData:SetTitle(ParT("vult_corpse_player", {nick = CORPSE.GetPlayerNick(ent, "---")}))

		mvData:AddDescriptionLine(ParT("marker_vision_distance", {distance = distance}))
		mvData:AddDescriptionLine(TryT(mvObject:GetVisibleForTranslationKey()), COLOR_SLATEGRAY)
	end)
end

-- adding convars to the TTT2 menu
if CLIENT then
	function ROLE:AddToSettingsMenu(parent)
		local form = vgui.CreateTTT2Form(parent, "header_roles_additional")
		
		form:MakeSlider({
			serverConvar = "ttt2_vult_consumed_bodies_win_threshold",
			label = "label_vult_consumed_bodies_win_threshold",
			min = 0,
			max = 1,
			decimal = 2,
		})

		form:MakeSlider({
			serverConvar = "ttt2_vult_talon_damage",
			label = "label_vult_talon_damage",
			min = 1,
			max = 100,
			decimal = 0,
		})

		form:MakeSlider({
			serverConvar = "ttt2_vult_talon_healing",
			label = "label_vult_talon_healing",
			min = 1,
			max = 100,
			decimal = 0,
		})

		form:MakeSlider({
			serverConvar = "ttt2_vult_digestion_time",
			label = "label_vult_digestion_time",
			min = 5,
			max = 120,
			decimal = 0,
		})

		form:MakeCheckBox({
			serverConvar = "ttt2_vult_eat_warning",
			label = "label_ttt2_vult_eat_warning",
			min = 0,
			max = 1,
			decimal = 0,
		})

		form:MakeCheckBox({
			serverConvar = "ttt2_vult_eat_fake",
			label = "label_ttt2_vult_eat_fake",
			min = 0,
			max = 1,
			decimal = 0,
		})
	end
end
