// Entity information
ENT.Type = "anim"
ENT.Base = "base_anim"

function ENT:Think()
local ply = self:GetOwner()
local ent = self.Entity

if ply && SERVER && IsValid(ent) && ply:IsValid() && ply:IsPlayer() && ply:GetNWBool("PHR_Disguised") then 

	if (ent:GetModel() == GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl") || ent:GetModel() == player_manager.TranslatePlayerModel(ply:GetInfo("cl_playermodel"))) then
		ent:SetPos(ply:GetPos())
	else
		ent:SetPos(ply:GetPos() - Vector(0, 0, ent:OBBMins().z))
	end
	

	if ply:GetPlayerLockedRot() then else 
		
		local hullxmax = math.abs(math.Round(ent:OBBMaxs().x)) -- new prop hull maths
		local hullymax = math.abs(math.Round(ent:OBBMaxs().y))		
		local hullxmin = math.abs(hullxmax) * -1
		local hullymin = math.abs(hullymax) * -1
		local hullz = math.Round(ent:OBBMaxs().z)
	
		--print(math.Round(ply:GetAngles().y))
	
		if math.Round(ply:GetAngles().y) == 0 then
			local minvector = Vector(hullxmin, hullymin, 0)
			local maxvector = Vector(hullxmax, hullymax, hullz)
			--ply:SetHull(minvector, maxvector)
			--ply:SetHullDuck(minvector, maxvector)
		elseif math.Round(ply:GetAngles().y) == 180 then
			local minvector = Vector(hullxmin, hullymin, 0)
			local maxvector = Vector(hullxmax, hullymax, hullz)
			--ply:SetHull(minvector, maxvector)
			--ply:SetHullDuck(minvector, maxvector)
		elseif math.Round(ply:GetAngles().y) == 90 then
			local minvector = Vector(hullymin, hullxmin, 0)
			local maxvector = Vector(hullymax, hullxmax, hullz)
			--ply:SetHull(minvector, maxvector)
			--ply:SetHullDuck(minvector, maxvector)
		elseif math.Round(ply:GetAngles().y) == -90 then
			local minvector = Vector(hullymin, hullxmin, 0)
			local maxvector = Vector(hullymax, hullxmax, hullz)
			--ply:SetHull(minvector, maxvector)
			--ply:SetHullDuck(minvector, maxvector)
		end
		
		
	
		ent:SetAngles(ply:GetAngles()) -- actually change the angle
	end	
end

if CLIENT then
	-- Local variables
	local ply = self:GetOwner()
	local ent = self.Entity
	
	-- Set position and angles
	if IsValid(ent) && IsValid(ply) && ply:Alive() && ply == LocalPlayer() && ply:GetNWBool("PHR_Disguised") then
		-- Set position
		if ent:GetModel() == GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl") || ent:GetModel() == player_manager.TranslatePlayerModel(ply:GetInfo("cl_playermodel")) then
			ent:SetPos(ply:GetPos())
		else
			ent:SetPos(ply:GetPos() - Vector(0, 0, ent:OBBMins().z))
		end
	end
end


if SERVER then
	self:NextThink(CurTime())
elseif CLIENT then
	self:SetNextClientThink(CurTime())
end 

return true end