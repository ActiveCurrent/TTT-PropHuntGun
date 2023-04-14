// Entity information
ENT.Type = "anim"
ENT.Base = "base_anim"

function ENT:Think()
local ply = self:GetOwner()
local ent = self.Entity

if ply && SERVER && IsValid(ent) && ply:IsValid() && ply:IsPlayer() && ply:GetNWBool("PHR_Disguised") then 

	mypos = ply:GetNetworkedVector("drawproploc")
	ent:SetPos(mypos)


	if ply:GetPlayerLockedRot() then else 
		ent:SetAngles(ply:GetAngles()) -- actually change the angle
	end	
end

if CLIENT then
	-- Local variables
	local ply = self:GetOwner()
	local ent = self.Entity
	mypos = ply:GetNetworkedVector("drawproploc")
	ent:SetPos(mypos)
end


if SERVER then
	self:NextThink(CurTime())
elseif CLIENT then
	self:SetNextClientThink(CurTime())
end 

return true end