// Send required files to client
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")


// Include needed files
include("shared.lua")


// Called when the entity initializes
function ENT:Initialize()
	local ply = self:GetOwner()
	self:SetModel(GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl"))
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetLagCompensated(true)
	self.health = 100
end 


function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end