
if SERVER then
	AddCSLuaFile()
	util.AddNetworkString( "DisguiseDestroyed" )
	util.AddNetworkString( "PHR_ChatPrint" ) 
	util.AddNetworkString( "PHR_LockPrint" ) 
	util.AddNetworkString( "PHR_UnLockPrint" ) 
	util.AddNetworkString("CL2SV_ExchangeProp")
	util.AddNetworkString("CL2SV_TargetProp")
	resource.AddFile("materials/vgui/ttt/PropHuntGun_ico.png")
	resource.AddFile("materials/vgui/ttt/UnLockedPropRotation_ico.png")
	resource.AddFile("materials/vgui/ttt/LockedPropRotation_ico.png")
	
	resource.AddFile("materials/smokenade/smokenade.vmt")
	resource.AddFile("materials/smokenade/smokenade.vtf")
	resource.AddFile("materials/smokenade/smokenade_normal.vtf")
end

TAUNT_TABLE = {}
RANDOM_MODEL = {}
AMMO_GUNS_MODELS = {}
EXPLOITABLE_DOORS = {
	"func_door",
	"prop_door_rotating", 
	"func_door_rotating"
}
BANNED_STARTING_PROPS = {
	"models/props_c17/canisterchunk02i.mdl",
	"models/props_junk/glassjug01_chunk01.mdl",
	"models/props_c17/canisterchunk01c.mdl",
	"models/props_c17/oildrumchunk01e.mdl",
	"models/props_c17/oildrum_crush.mdl",
	"models/props_c17/canisterchunk02b.mdl",
	"models/props_c17/canisterchunk01l.mdl",
	"models/props_c17/furnituredrawer001a_shard01.mdl",
	"models/props_c17/canisterchunk02f.mdl",
	"models/props_c17/furniturechair001a_chunk03.mdl",
	"models/props_c17/canisterchunk02e.mdl",
	"models/props_c17/tv_monitor01_screen.mdl",
	"models/props_c17/pottery02a_break03.mdl",
	"models/props_c17/canisterchunk01g.mdl",
	"models/props_c17/handrail04_end.mdl",
	"models/props_c17/utilityconnecter006d.mdl",
	"models/props_junk/terracotta_chunk01f.mdl",
	"models/props_junk/vent001_chunk8.mdl",
	"models/props_c17/utilityconnecter005.mdl",
	"models/props_junk/terracotta_chunk01b.mdl",
	"models/props_junk/vent001_chunk7.mdl",
	"models/props_c17/canisterchunk02h.mdl",
	"models/props_c17/canisterchunk02d.mdl",
	"models/props_junk/terracotta_chunk01b.mdl",
	"models/props_c17/pottery01a_break02.mdl",
	"models/props_junk/watermelon01_chunk02a.mdl",
	"models/props_c17/canisterchunk01i.mdl",
	"models/props_junk/terracotta_chunk01f.mdl",
	"models/props_c17/canisterchunk01b.mdl",
	"models/props_c17/canisterchunk01k.mdl",
	"models/props_junk/terracotta_chunk01a.mdl",
	"models/props_c17/pottery04a_break04.mdl",
	"models/props_c17/canisterchunk02b.mdl",
	"models/props_junk/wood_crate001a_chunk06.mdl",
	"models/props_c17/canisterchunk02g.mdl",
	"models/props_c17/canisterchunk01a.mdl",
	"models/props_junk/watermelon01_chunk02b.mdl",
	"models/props_junk/garbage_glassbottle002a_chunk02.mdl",
	"models/props_junk/garbage_glassbottle001a_chunk04.mdl",
	"models/props_c17/canisterchunk01m.mdl",
	"models/props_junk/metalbucket01a_static.mdl",
	"models/props_junk/glassjug01_chunk03.mdl",
	"models/props_junk/trashdumpster02a.mdl",
	"models/props_junk/vent001_chunk5.mdl",
	"models/props_c17/pottery04a_break01.mdl",
	"models/props_c17/utilityconnecter006b.mdl",
	"models/props_c17/canisterchunk02c.mdl",
	"models/props_c17/pottery01a_break04.mdl",
	"models/props_c17/pottery01a_break01.mdl",
	"models/props_c17/pottery02a_break01.mdl",
	"models/props_junk/wood_pallet001a_shard01.mdl",
	"models/props_junk/garbage_glassbottle001a_chunk01.mdl",
	"models/props_junk/glassjug01_chunk02.mdl",
	"models/props_c17/light_domelight01_off.mdl",
	"models/props_c17/truss02d.mdl",
	"models/props_c17/pottery04a_break02.mdl",
	"models/props_c17/pottery01a_break03.mdl",
	"models/props_c17/truss02e.mdl",
	"models/props_c17/canisterchunk01f.mdl",
	"models/props_c17/truss02c.mdl",
	"models/props_c17/pottery02a_break04.mdl"

}
for i=1,35,1 do -- old method
    local path = "sound/taunts/" .. i
	local wavpath = "taunts/" .. i .. ".wav"
	local mp3path = "taunts/" .. i .. ".mp3"
    table.insert(TAUNT_TABLE, wavpath)
	table.insert(TAUNT_TABLE, mp3path)
    resource.AddFile(path)
end

local tauntFinder = file.Find("sound/PropHuntGun/taunts/*", "GAME") --new taunt finder
for j = 0, table.Count(tauntFinder), 1 do
	if tauntFinder[j] != nil then
		table.insert(TAUNT_TABLE, "PropHuntGun/taunts/"..tauntFinder[j])
		--print("Loaded PropHuntGun/taunts/"..tauntFinder[j])
	end
end

local modelFinder = file.Find("models/props_junk/*.mdl", "GAME") --new taunt finder
for j = 0, table.Count(modelFinder), 1 do
	if modelFinder[j] != nil then
		table.insert(RANDOM_MODEL, "models/props_junk/"..modelFinder[j])
		--print("Loaded models/"..modelFinder[j])
	end
end

local modelFinder2 = file.Find("models/props_c17/*.mdl", "GAME") --new taunt finder
for j = 0, table.Count(modelFinder2), 1 do
	if modelFinder2[j] != nil then
		table.insert(RANDOM_MODEL, "models/props_c17/"..modelFinder2[j])
		--print("Loaded models/"..modelFinder[j])
	end
end

local weaponsFinder = file.Find("models/weapons/*.mdl", "GAME") --new taunt finder
for j = 0, table.Count(weaponsFinder), 1 do
	if weaponsFinder[j] != nil then
		table.insert(AMMO_GUNS_MODELS, "models/weapons/"..weaponsFinder[j])
	end
end

local ammoFinder = file.Find("models/items/*.mdl", "GAME") --new taunt finder
for j = 0, table.Count(ammoFinder), 1 do
	if ammoFinder[j] != nil then
		table.insert(AMMO_GUNS_MODELS, "models/items/"..ammoFinder[j])
	end
end

ignorePredictionOrRecipientFilter = true
local hidesound = Sound("buttons/combine_button3.wav")
local unhidesound2 = Sound("buttons/combine_button5.wav")
local unhidesound = Sound("ambient/levels/labs/electric_explosion2.wav")
local unhidebeep = Sound("buttons/button24.wav")




---- TTT Prop Hunt Gun ----

-- The prop hunt gun for trouble in terrorist town by Active_Current
-- with help and advice from Malivil

-- Extra credits
-- Various code taken from the Prop Disguiser and the PropHunt gamemode 
-- Prop Disguiser credit: Jonascone, Exho, Perwex & AlgeeTwice
-- Drako_2k for code from his smoke grenade weapon
-- Porter for flashbang code
-- extra credits on my workshop

-- my steamworkshop upload https://steamcommunity.com/sharedfiles/filedetails/?id=2796353349



if CLIENT then
	SWEP.PrintName = "The PropHuntGun"
    SWEP.Slot = 7
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = true
	SWEP.Icon = "vgui/ttt/PropHuntGun_ico.png"

   SWEP.EquipMenuData = {
      type = "item_weapon",
      desc = "Left click enables/disables PropHunt mode (fire)\n\nUse key (e) to select a new prop.\n\nRight click to use special ability! (aim)\n\nReload key (r) to taunt!\n\nWalk key (alt) to unlock rotation.\n\nMod by Active_Current"
   };
end

SWEP.HoldType			= "normal"
SWEP.Base				= "weapon_tttbase"
SWEP.Kind 				= WEAPON_EQUIP2
SWEP.CanBuy 			= { ROLE_TRAITOR, ROLE_DETECTIVE }
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.AutoSpawnable 		= false
SWEP.ViewModel          = "models/weapons/c_toolgun.mdl"
SWEP.WorldModel         = "models/weapons/w_toolgun.mdl"
SWEP.DrawCrosshair 		= true
SWEP.ViewModelFlip		= false
SWEP.UseHands 			= true
SWEP.DeploySpeed 		= 4

-- Basically all of this configuration junk is useless so just ignore it, use my convars listed on the workshop

------ CONFIGURATION ------
--SWEP.Primary.Delay 		= 30 -- Time limit after undisguising until next disguise
SWEP.Secondary.Delay	= 2 -- The exact opposite of that ^

SWEP.DisguiseProp 		= Model("models/props_c17/oildrum001.mdl")-- Default disguise model we dont use this

--SWEP.DisguiseTime 		= 10 -- How long, seconds, for the player to be disguised
--SWEP.DisguiseHealth 	= 50 -- Health for the disguised prop to have. Works with about half the models

--SWEP.MaxRadius			= 100 -- Max radius of a chosen prop. If its bigger than the player cannot use it
--SWEP.MinRadius			= 5 -- Min radius of a chosen prop
------ //END CONFIGURATION//------

SWEP.Prop				= nil
SWEP.Disguised			= false
SWEP.AllowDrop          = true

-- Put the Model Names of props that pass the criteria but you dont want anyone to use. Seperate each string WITH a comma
-- Example of a model path would be "models/props_junk/wood_crate001a.mdl" 
SWEP.Blacklist = {

}

-------------------------------
-- MESSAGE FUNCTIONS --
-------------------------------

local function PHR_Msg(txt, ply)
	if SERVER then
			net.Start("PHR_ChatPrint")
				net.WriteString(txt)
			net.Send(ply)
	end
end

local function PHR_LockMsg(txt, ply)
	if SERVER then
			net.Start("PHR_LockPrint")
				net.WriteString(txt)
			net.Send(ply)
	end
end

local function PHR_UnLockMsg(txt, ply)
	if SERVER then
			net.Start("PHR_UnLockPrint")
				net.WriteString(txt)
			net.Send(ply)
	end
end

-------------------------------


-------------------------------
-- WEAPON USES --
-------------------------------

function SWEP:PrimaryAttack() --now toggle prophunt mode
	if not SERVER then return end
	local ply = self.Owner
	if not self:GetNWBool("PHR_WepDisguised") then
		self:PropDisguise() -- Detroit, become prop
	else
		--PHR_Msg("You are already in PropHunt mode.", ply)
		self.Owner:SetNWBool("PHR_Disguised", false)
		self:SetNextSecondaryFire(CurTime()+self.Secondary.Delay)
		self:PropUnDisguise()
	end
end

function SWEP:SecondaryAttack() --special attacks
if not SERVER then return end
	local ply = self.Owner
	if self:GetNWBool("PHR_WepDisguised") then
		self:specialAttack()
	end
end

rand_taunt = Sound(table.Random(TAUNT_TABLE))
function SWEP:Reload() --taunting on reload
	local ply = self.Owner
	local taunttime = GetGlobalInt("ttt_autotaunt_interval", 45)
	-- Modifying the forced taunt message if taunts have a cooldown
	local tauntMessage = "Auto taunt reset to "..taunttime.."s"
	if SERVER and GetConVar("ttt_prophuntgun_taunt_cooldown"):GetInt() > 0 then
		tauntMessage = "Taunt on cooldown for " .. GetConVar("ttt_prophuntgun_taunt_cooldown"):GetInt() .. "s"
	end
	if self:GetNWBool("PHR_WepDisguised") then
		timer.Create(ply:SteamID().."_TauntMsg", 0.25, 1, function() PHR_UnLockMsg(tauntMessage, ply) end)-- stay classy, timer
		timer.Remove( ply:SteamID().."_TauntTime" ) -- reset timer, timer was not classy elsewhere
		timer.Create(ply:SteamID().."_TauntTime", taunttime, 0, function() if IsValid(self) then self:taunt() else timer.Remove( ply:SteamID().."_TauntTime" ) end end) -- start new taunt timer
	end
	self:taunt() 
end

-------------------------------



-------------------------------
-- WEAPON FUNCTIONS --
-------------------------------

UsedModels = {}


function SWEP:PropDisguise()
if not SERVER then return end
	local ply = self.Owner
	local time = GetGlobalInt("ttt_prop_hunt_gun_time", 500)
	local taunttime = GetGlobalInt("ttt_autotaunt_interval", 45)
	ply:SetNetworkedString(ply:SteamID().."MyPlayerModel", ply:GetModel())
	self:SetNWBool("PHR_TimeOut", false)
	ply.last_throw_taunt_time = CurTime()
	
	--PHR_Msg("PropHuntMode enabled.", ply) -- messages and specials
	if GetConVar("ttt_prophuntgun_display_press_e_message"):GetBool() then
		ply:PrintMessage( HUD_PRINTCENTER, "Go next to a prop and press 'E' to change into it!" )
		timer.Create("PropHuntGunDisguiseMessage", 1, 4, function ()
			ply:PrintMessage( HUD_PRINTCENTER, "Go next to a prop and press 'E' to change into it!" )
		end)
	end
	ply:SetNWBool("PHR_Special_Ready", true)
	self:specialNotify()
	
	if self:GetNWBool("PHR_WepDisguised") then print("HOW DID YOU GET THIS FAR??") return end -- Random fokin checks
	if not IsValid(ply) or not ply:Alive() then print("Player aint valid, yo") return end
	if IsValid(ply.ttt_prop) then ply.ttt_prop:Remove() end -- just in case
	
	ply:SetNWBool("PlayerLockedRotation", GetConVar("ttt_prophuntgun_prop_rotation_on_by_default"):GetBool())
	playerhp = ply:Health() --remember the players hp for undisguise
	ply:SetNWBool("PHR_Disguised", true)
	

	if IsValid(ply.ttt_prop) then else
		ply.ttt_prop = ents.Create("ttt_prop") -- create the first entity
		ply.ttt_prop:Spawn()
		ply.ttt_prop:SetOwner(ply)	
		ply.ttt_prop:SetName(ply:Nick().."'s Disguised Prop")
		ply.last_taunt_time = 0
	end
	
	-- Some depreciated stuff --
	--ply.ttt_prop:SetSolid(SOLID_BBOX) -- using this will cause the prop to have a collision, so when the player crouches they climb onto it and it glitches the prop forwards
	--ply.ttt_prop:SetAngles(ply:GetAngles()) -- using this will cause the prop to have players rotation on start (okay but you can hide inside things this way/get stuck)
	--ply.ttt_prop:SetParent(ply) -- the nastiest, it links the prop to the player so they become one clientside, needs to be removed for rotation etc
	if ply.ttt_prop:GetParent() && ply.ttt_prop:GetParent():IsValid() then
		ply.ttt_prop:SetParent(nil)
	end
	-- ------------------------ --
		
	local prevmodel = ply:GetNetworkedString("prevmodel") -- setting up the previously used model (if it exists)
		if prevmodel != nil then

			if prevmodel == GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl") then
				if GetConVar('ttt_prophuntgun_enable_randomprop'):GetInt() == 1 then 
					ply.ttt_prop:SetPos(ply:GetPos() - Vector(0, 0, ply.ttt_prop:OBBMins().z + 20))
					ply:SetModelScale(1.05)
					ply.ttt_prop:SetModel(ply.choosemodel)	
					
					local SetMDL = FindMetaTable("Entity").SetModel     --updating the invisible model of the player (for the hitbox)
					hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
						local mdlpath = ply.choosemodel
						SetMDL( ply , mdlpath ) 
					end)
					hook.Run("UpdatePlayerModel")
					SendFullStateUpdate()
				
					if ply:GetNetworkedInt("savehealth") != nil && ply:GetNetworkedInt("savehealth") != 0 then
						ply:SetHealth(ply:GetNetworkedInt("savehealth")) 
					end
				else
					ply.ttt_prop:SetPos(ply:GetPos() - Vector(0,0,10))
					ply:SetModelScale(1.05)
					ply.ttt_prop:SetModel(GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl"))
				end
			else
				if GetConVar('ttt_prophuntgun_enable_randomprop'):GetInt() == 1  then 
					if ply.propchanged == 0 then

						ply.ttt_prop:SetPos(ply:GetPos() - Vector(0, 0, ply.ttt_prop:OBBMins().z + 20))
						ply:SetModelScale(1.05)
						ply.ttt_prop:SetModel(ply.choosemodel)
					
						ply.propchanged = 1
	
						local SetMDL = FindMetaTable("Entity").SetModel     --updating the invisible model of the player (for the hitbox)
						hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
							local mdlpath = ply.choosemodel
							SetMDL( ply , mdlpath ) 
						end)
						hook.Run("UpdatePlayerModel")
						SendFullStateUpdate()
				
						if ply:GetNetworkedInt("savehealth") != nil && ply:GetNetworkedInt("savehealth") != 0 then
							ply:SetHealth(ply:GetNetworkedInt("savehealth")) 
						end
						
						ply:SetNetworkedString("prevmodel",ply.choosemodel)
						
						local ent = ply.ttt_prop
						
						ent_health = math.Clamp( ( math.Round(ent:OBBMaxs().z) + math.Round(ent:OBBMaxs().x) + math.Round(ent:OBBMaxs().y) ) * 1.3 , 1, 1000 ) --ent:GetPhysicsObject():GetVolume()
						ply.ttt_prop.health = ent_health
						checktrue = false
						
						for j = 0, 1000, 1 do
							if ent:GetModel() == UsedModels[j] && ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth") != nil && ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth") !=0 then --
								ply:SetHealth(ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth")) --checking if the player has used this model this round
								checktrue = true
							end 
						end
					
						if checktrue != true then
							ply:SetNetworkedInt("savehealth", ply.ttt_prop.health) -- save prop health for reinit
							ply:SetHealth(ply.ttt_prop.health)	
						end
						checktrue = false
						
						ply:ResetHull()
						local hullxymax = math.Round(math.Max(ent:OBBMaxs().x, ent:OBBMaxs().y)) -- new prop hull maths
						local hullxymin = hullxymax * -1
						local hullz = math.Round(ent:OBBMaxs().z)
						ply:SetHull(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
						ply:SetHullDuck(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
					
						local bottom,top = ply:GetHull() -- calculating prophull networkvector for calcview
						ply:SetNetworkedVector("prophull", top)
					
						local mymodel = ent:GetModel() -- defining the previous model
						table.insert(UsedModels, mymodel)
						print("PropHuntGun: "..ply:Nick().." is now ".. mymodel)  --for the console
						ply:SetNetworkedString("prevmodel", mymodel)
					else
						ply.ttt_prop:SetPos(ply:GetPos() - Vector(0, 0, ply.ttt_prop:OBBMins().z + 20))
						ply:SetModelScale(1.05)
						ply.ttt_prop:SetModel(prevmodel)

						local SetMDL = FindMetaTable("Entity").SetModel     --updating the invisible model of the player (for the hitbox)
						hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
							local mdlpath = prevmodel
							SetMDL( ply , mdlpath ) 
						end)
						hook.Run("UpdatePlayerModel")
						SendFullStateUpdate()
			
						if ply:GetNetworkedInt("savehealth") != nil && ply:GetNetworkedInt("savehealth") != 0 then
							ply:SetHealth(ply:GetNetworkedInt("savehealth")) 
						end
					end
				else
					ply.ttt_prop:SetPos(ply:GetPos() - Vector(0, 0, ply.ttt_prop:OBBMins().z + 20))
					ply:SetModelScale(1.05)
					ply.ttt_prop:SetModel(prevmodel)

					local SetMDL = FindMetaTable("Entity").SetModel     --updating the invisible model of the player (for the hitbox)
					hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
						local mdlpath = prevmodel
						SetMDL( ply , mdlpath ) 
					end)
					hook.Run("UpdatePlayerModel")
					SendFullStateUpdate()
			
					if ply:GetNetworkedInt("savehealth") != nil && ply:GetNetworkedInt("savehealth") != 0 then
						ply:SetHealth(ply:GetNetworkedInt("savehealth")) 
					end
				end
			end
		else
			if GetConVar('ttt_prophuntgun_enable_randomprop'):GetInt() == 1 then 

				ply.ttt_prop:SetPos(ply:GetPos() - Vector(0, 0, ply.ttt_prop:OBBMins().z + 20))
				ply:SetModelScale(1.05)
				ply.ttt_prop:SetModel(ply.choosemodel)
	
				local SetMDL = FindMetaTable("Entity").SetModel     --updating the invisible model of the player (for the hitbox)
				hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
					local mdlpath = ply.choosemodel
					SetMDL( ply , mdlpath ) 
				end)
				hook.Run("UpdatePlayerModel")
				SendFullStateUpdate()
				
				if ply:GetNetworkedInt("savehealth") != nil && ply:GetNetworkedInt("savehealth") != 0 then
					ply:SetHealth(ply:GetNetworkedInt("savehealth")) 
				end
				
				print("PropHuntGun: "..ply:Nick().." is now ".. ply.choosemodel)  --for the console
			else
				ply.ttt_prop:SetPos(ply:GetPos() - Vector(0,0,10))
				ply:SetModelScale(1.05)
				ply.ttt_prop:SetModel(GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl"))
			end	
		end
			
	ply:ResetHull()
	local hullxymax = math.Round(math.Max(ply.ttt_prop:OBBMaxs().x, ply.ttt_prop:OBBMaxs().y)) -- hull maths for starter object
	local hullxymin = hullxymax * -1
	local hullz = math.Round(ply.ttt_prop:OBBMaxs().z)
	
	local minvector = Vector(hullxymin, hullxymin, 0)
	local maxvector = Vector(hullxymax, hullxymax, hullz)
	
	ply:SetHull(minvector, maxvector)
	ply:SetHullDuck(minvector, maxvector)
	local bottom,top = ply:GetHull() -- calculating prophull nwvector for calcview
	ply:SetNetworkedVector("prophull", top)
	
	ply:SetNetworkedVector("duckOffset", ply:GetViewOffsetDucked() )
	ply:SetViewOffsetDucked(ply:GetViewOffset()) --remove ducking view glitch
	
	ply:DrawViewModel(false) -- removing the weapons and the player (view)
	ply:DrawWorldModel(false)
	ply:SetColor(Color(255, 255, 255, 0))
	ply:SetMaterial("sprites/heatwave")
	
	timer.Create(ply:SteamID().."_DisguiseTime", time, 1, function() -- Undisguise after the time limit (cringe)
		self:SetNWBool("PHR_TimeOut", true)
		self:PropUnDisguise()                                        -- cringe things are set to 500 seconds
	end)
	timer.Create(ply:SteamID().."_TauntTime", taunttime, 0, function() self:taunt() end) -- init taunt infinitely with interval taunttime
	ply:SetNWFloat("PHR_TimeLeft", CurTime() + time)-- Clientside timer
	ply:SetNWFloat("PHR_TauntTimeLeft", CurTime() + GetGlobalInt("ttt_autotaunt_interval", 45))
	ply:SetNWBool("PHR_Disguised", true) -- Shared - player disguised
	self:SetNWBool("PHR_WepDisguised", true)
	self.AllowDrop = false
	ply:EmitSound(hidesound, 75, 60)
	ply:EmitSound(unhidebeep, 80, 70)
	
	
	
	if ply.ttt_prop != nil && self:GetNWBool("PHR_WepDisguised")  then -- choose new prop, prop manipulation
		
		net.Receive("CL2SV_ExchangeProp", function(len,ply)
		local ent = net.ReadEntity() -- new prop selection method (more accurate)
		
		--function GAMEMODE:PlayerUse(ply, ent) -- on use (e) -- old method
			if IsValid(ply.ttt_prop) then

				if table.HasValue(EXPLOITABLE_DOORS, ent:GetClass()) then else  -- checking if the entity is a door  (THEN RETURN FALSE END to stop use)
					if ent:GetPhysicsObject():IsValid() && ent:GetSkin() != nil && ent:GetModel() != nil && ply.ttt_prop:GetModel() != ent:GetModel() && ent != nil then
						ply.ttt_prop:SetModel(ent:GetModel())
						ply.propchanged = 1
					
						local SetMDL = FindMetaTable("Entity").SetModel --updating the invisible model of the player (for the hitbox)
						hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
							local mdlpath = ent:GetModel()
							SetMDL( ply , mdlpath ) 
						end)
						hook.Run("UpdatePlayerModel")
						SendFullStateUpdate() -- end of playermodel update
		
						ply.ttt_prop:SetSkin(ent:GetSkin())
						ply.ttt_prop:SetSolid(SOLID_BSP)
						ply.ttt_prop:SetPos(ply:GetPos() - Vector(0, 0, ent:OBBMins().z + 20))
						ent_health = math.Clamp( ( math.Round(ent:OBBMaxs().z) + math.Round(ent:OBBMaxs().x) + math.Round(ent:OBBMaxs().y) ) * 1.3 , 1, 1000 ) --ent:GetPhysicsObject():GetVolume()
						ply.ttt_prop.health = ent_health
						checktrue = false
					
						if ply:GetNetworkedString("prevmodel") != nil then
							ply:SetNetworkedInt(ply:SteamID().."_"..ply:GetNetworkedString("prevmodel").."_savehealth", ply:Health()) -- remember individual prop healths
							table.insert(UsedModelsHealth, ply:GetNetworkedInt(ply:SteamID().."_"..ply:GetNetworkedString("prevmodel").."_savehealth")) -- add the identifiers to a list to be removed on death
						end
					
						for j = 0, 100, 1 do
							if ent:GetModel() == UsedModels[j] && ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth") != nil && ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth") !=0 then --
								ply:SetHealth(ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth")) --checking if the player has used this model this round
								checktrue = true
							end 
						end
					
						if checktrue != true then
							ply:SetNetworkedInt("savehealth", ply.ttt_prop.health) -- save prop health for reinit
							ply:SetHealth(ply.ttt_prop.health)	
						end
						checktrue = false
						
						ply.ttt_prop.max_health = "500"
						ply:EmitSound(hidesound, 80, 70) -- beep boop sounds
						
						ply:ResetHull()
						local hullxymax = math.Round(math.Max(ent:OBBMaxs().x, ent:OBBMaxs().y)) -- new prop hull maths
						local hullxymin = hullxymax * -1
						local hullz = math.Round(ent:OBBMaxs().z)
						ply:SetHull(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
						ply:SetHullDuck(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
					
						local bottom,top = ply:GetHull() -- calculating prophull networkvector for calcview
						ply:SetNetworkedVector("prophull", top)
					
						local mymodel = ent:GetModel() -- defining the previous model
						table.insert(UsedModels, mymodel)
						print("PropHuntGun: "..ply:Nick().." is now ".. mymodel)  --for the console
						ply:SetNetworkedString("prevmodel", mymodel)
					end
				end
			end 
		end)
	end 
end



UsedModelsHealth = {}

function SWEP:PropUnDisguise()
if not SERVER then return end
	local ply = self.Owner
	local cd = GetGlobalInt("ttt_prop_hunt_gun_cooldown", 0)
	
	if self:GetNWBool("PHR_WepDisguised") then
		local creditsSave 	= ply:GetCredits()
		local equipNumSave 	= ply:GetEquipmentItems()
		local temphp		= ply:Health()
		ply:SetNetworkedInt("savehealth", ply:Health()) -- save new prop health for reinit
		ply:SetNetworkedInt(ply:SteamID().."_"..ply:GetNetworkedString("prevmodel").."_savehealth", ply:Health()) -- remember individual prop healths
		table.insert(UsedModelsHealth, ply:GetNetworkedInt(ply:SteamID().."_"..ply:GetNetworkedString("prevmodel").."_savehealth")) -- add the identifiers to a list to be removed on death
		ply:SetHealth(playerhp)
		ply:SetNWFloat("PHR_TimeLeft", 0)
		ply:SetNWBool("PHR_Disguised", false)
		self:SetNWBool("PHR_WepDisguised", false)
		ply:SetNWBool("PHR_Door_Special", false)
		ply:SetNWBool("PlayerLockedRotation", GetConVar("ttt_prophuntgun_prop_rotation_on_by_default"):GetBool())
		timer.Destroy(ply:SteamID().."_DisguiseTime")
		timer.Remove( ply:SteamID().."_DisguiseTime" )
		timer.Remove( ply:SteamID().."_TauntTime" ) -- reset timer
		self.AllowDrop = true
		ply:EmitSound(unhidesound2, 45, 40) -- beep boop sounds
		ply:EmitSound(hidesound, 75, 60)
		ply:EmitSound(unhidesound, 35, 65)
		ply:EmitSound(unhidebeep, 35, 65)
		
		ply:SetPos(ply.ttt_prop:GetPos())
		ply:SetVelocity(ply.ttt_prop:GetVelocity())
		ply.ttt_prop:SetModel(GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl"))
		ply.ttt_prop:Remove() -- Banish our prop
		ply.ttt_prop = nil
		
		ply.isGrapple = false --stop grappling if we have it
		
		ply:DrawViewModel(true)
		ply:DrawWorldModel(true) --reset the player
		ply:SetColor(Color(255, 255, 255, 255))
		ply:SetMaterial("models/glass")
		ply:SelectWeapon(self:GetClass())
		ply:ResetHull() -- fix the players hull etc
		local resetduck = ply:GetNetworkedVector("duckOffset")
		ply:SetViewOffsetDucked(resetduck)
		
		hook.Remove("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID())
		local SetMDL = FindMetaTable("Entity").SetModel                                --resetting the invisible model of the player (for the hitbox)
		hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
			local MyPlayerModel = ply:GetNetworkedString(ply:SteamID().."MyPlayerModel")
			local mdlpath = MyPlayerModel
			SetMDL( ply , mdlpath ) 
		end)
		hook.Run("UpdatePlayerModel")
		SendFullStateUpdate()
		ply:SetModel(MyPlayerModel)
		ply:SetModelScale(1)
		
		self:SetNextPrimaryFire(CurTime()+cd)
		
		--ply:SetHealth(temphp) -- Clamp health, explanation below : edit : ???? they never gave an explanation thanks bub
		local tout = self:GetNWBool("PHR_TimeOut", true)
		if tout then
			PHR_Msg("Timer ran out so PropHunt mode was disabled!", ply)
		else
			--PHR_Msg("Disabled PropHunt mode.", ply)
		end
		ply:SetCredits(creditsSave)
		ply:GiveEquipmentItem(equipNumSave)
		
		local bottom,top = ply:GetHull() -- calculating prophull networkvector for calcview
		ply:SetNetworkedVector("prophull", top)
		
		ply:StopSound(rand_taunt)
		
		if prophuntgun_rememberweapon != nil then
			prophuntgun_rememberweapon:SetDeploySpeed( 999 )
			ply:SelectWeapon(prophuntgun_rememberweapon:GetClass())--give player their weapon on undisguise
			prophuntgun_rememberweapon:SetDeploySpeed( 2 )
		else
			local gotmygun = 0
			timer.Create(ply:SteamID().."WaitWeaponSwitch", 0.1, 1, function() 
				for _, v in ipairs( ply:GetWeapons() ) do -- get all the weapons the player has and loop through them
					if v:GetSlot() == 0 then
						if v.Kind == 3 then
							v:SetDeploySpeed( 999 )
							ply:SelectWeapon(v:GetClass())--give player their weapon on undisguise
							v:SetDeploySpeed( 2 )
							gotmygun = 1
						end
					
						if gotmygun == 0 then
							if v.Kind == 2 then
								v:SetDeploySpeed( 999 )
								ply:SelectWeapon(v:GetClass()) --check for secondary 
								v:SetDeploySpeed( 2 )
								gotmygun = 1
							end
						end
					
						if gotmygun == 0 then
							if v.Kind == 1 then
								ply:SelectWeapon(v:GetClass()) -- else give crowbar
							end
						end
					end 
				end
			end)
		end
	end
end

function SWEP:taunt()
	if not SERVER then return end
    local ply = self.Owner

	-- Not allowing taunting constantly to prevent players from holding 'R' and preventing them from ever taunting
	if ply:GetNWFloat("PHR_TauntTimeLeft", CurTime()) - CurTime() < GetConVar("ttt_autotaunt_interval"):GetInt() - GetConVar("ttt_prophuntgun_taunt_cooldown"):GetInt() then
		-- Mute their last taunt
		ply:StopSound(rand_taunt)		
		ply:SetNWFloat("PHR_TauntTimeLeft",GetGlobalInt("ttt_autotaunt_interval", 45) + CurTime()) --reset the icon
		ply.last_taunt = rand_taunt
		if self:GetNWBool("PHR_WepDisguised") && ply.last_taunt_time + 0.25 <= CurTime() then repeat
			rand_taunt = Sound(table.Random(TAUNT_TABLE))
		until rand_taunt != ply.last_taunt && file.Exists("sound/"..rand_taunt, "GAME" )
		ply.last_taunt_time = CurTime()
		ply:EmitSound(rand_taunt, 100)
		end
	end
end







-------------------------------
-- HANDLERS AND HOOKS --
-------------------------------

function DamageHandler(ent, dmginfoinfo)
	if ply && ply:IsValid() && ply:Alive() && ply:IsPlayer() && dmginfo:GetDamage() > 0 && ply:GetNWBool("PHR_Disguised") then --&& attacker:IsPlayer()
		self.health = self.health - dmginfo:GetDamage() -- update saved individual prop health
		if self.health <= 0 then  -- prop death
			ply:Kill()	
		end
	end
end 

local function RoundEndHandler() -- fixy fixy everyone at the round end... fook there used to be a lota stuff here now p much nothing
	for i, v in ipairs( player.GetAll() ) do
    	if v:GetNWBool("PHR_Disguised") then
			timer.Remove(v:SteamID().."_DisguiseTime")
			timer.Remove( v:SteamID().."_TauntTime" ) -- reset timer
			v:ResetHull()
			v:SetNetworkedString("prevmodel", GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl"))
			v:SetNWBool("PHR_Disguised", false)
			v:SetNWBool("PHR_Door_Special", false)
			prevmodel = nil
			UsedModelsHealth = {}
			UsedModels = {}
		end
	end
end

local function RemoveHandler(ply) --removing and fixing player on death
	if ply && ply:IsValid() && ply:IsPlayer() && ply:GetNWBool("PHR_Disguised") then
		timer.Remove(ply:SteamID().."_DisguiseTime")
		timer.Remove( ply:SteamID().."_TauntTime" ) -- reset timer
		timer.Remove(ply:SteamID().."_draw_prop_timer") -- remove draw prop timer
		ply.ttt_prop:Remove() -- removing the prop entity
		ply.ttt_prop = nil
		ply:ResetHull()	
		local bottom,top = ply:GetHull() -- calculating prophull networkvector for calcview
		ply:SetNetworkedVector("prophull", top)
		ply:SetNetworkedString("prevmodel", GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl"))
		ply:SetNWBool("PHR_Disguised", false)
		ply:SetNWBool("PHR_WepDisguised", false)
		ply:SetNWBool("PHR_Door_Special", false)
		prevmodel = nil
		ply:SetNetworkedInt("savehealth", 100)	-- reset prop health save
		
		hook.Remove("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID())
		local SetMDL = FindMetaTable("Entity").SetModel                                --resetting the invisible model of the player (for the hitbox)
		hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
			local MyPlayerModel = ply:GetNetworkedString(ply:SteamID().."MyPlayerModel")
			local mdlpath = MyPlayerModel
			SetMDL( ply , mdlpath ) 
		end)
		ply:SetModel(MyPlayerModel) --resetting invisible model back to normal  (for hitbox)
		hook.Run("UpdatePlayerModel")
		SendFullStateUpdate()
		
		ply:SetModelScale(1)
		ply:SetWalkSpeed(200)
		
		local resetduck = ply:GetNetworkedVector("duckOffset")
		ply:SetViewOffsetDucked(resetduck)
		
		ply.isGrapple = false --stop grappling if we have it
		
		ply:StopSound(rand_taunt)
			
		UsedModelsHealth = {}
		UsedModels = {}
	end
end 

local function DisconnectHandler(ply) --removing and fixing player on disconnect
	if ply && ply:IsValid() && ply:IsPlayer() && ply:GetNWBool("PHR_Disguised") then
		timer.Remove(ply:SteamID().."_DisguiseTime")
		timer.Remove( ply:SteamID().."_TauntTime" ) -- reset timer
		ply:SetNetworkedVector("prophull", top)
		ply:SetNetworkedString("prevmodel", GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl"))
		ply:SetNWBool("PHR_Disguised", false)
		ply:SetNWBool("PHR_WepDisguised", false)
		ply:SetNWBool("PHR_Door_Special", false)
		prevmodel = nil
		ply:SetNetworkedInt("savehealth", 100)	-- reset prop health save	
		hook.Remove("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID())	
		UsedModelsHealth = {}
		UsedModels = {}

	end
end 


local function PropHunterCalcView( ply, pos, angles, fov ) -- calculating the player view

local view = {origin = origin, angles = angles, fov = fov} --fixing tpose
	if ply:GetNWBool("PHR_Disguised") then
		local prophull = ply:GetNetworkedVector("prophull")
		local trace = {}
		local filterent = ents.FindByClass("ttt_prop")
		table.insert(filterent, ply)
		
		if prophull.z <90 then
			trace.start = pos + Vector(0, 0, prophull.z - 60) -- so that the camera hits objects and has collision
			trace.endpos = pos + (angles:Forward() * -60) + Vector(0, 0, prophull.z - 60)
			trace.filter = filterent
		else
			trace.start = pos + Vector(0, 0, prophull.z - 60)
			trace.endpos = pos + (angles:Forward() * -100) Vector(0, 0, prophull.z - 60) 
			trace.filter = filterent
		end
		
		local tr = util.TraceLine(trace)
		view.origin = tr.HitPos + (angles:Forward() * 5)
		return view  
	end  
end 

hook.Add( "PlayerSwitchWeapon", "WeaponSwitchExample", function( ply, oldWeapon, newWeapon ) -- stops weapon switches if player is disguised
    		if newWeapon:GetClass() == "weapon_ttt_prop_hunt_gun" then
				prophuntgun_rememberweapon = oldWeapon
			end
			if ply:GetNWBool("PHR_Disguised") then
			return true end end)
 
hook.Add( "TTTTargetIDPlayerBlockInfo", "HidingTheNames", function(ply) -- hiding player names (not icons). Uses CustomRoles for TTT hook
    		if ply:GetNWBool("PHR_Disguised") then
			return true end end)
			
hook.Add( "TTTTargetIDPlayerBlockIcon", "HidingTheIcons", function(ply) -- hiding icon for detective. Uses CustomRoles TTT hook
    		if ply:GetNWBool("PHR_Disguised") && ply:GetRole() == ROLE_DETECTIVE then
			return true end end)



if CLIENT then
	local white = Color( 255, 255, 255 )
	local PropDisguiseCol = Color(219, 141, 52)
	
	net.Receive( "DisguiseDestroyed", function( len, ply ) -- Recieve the message
		chat.AddText( PropDisguiseCol, "PropHuntGun: ", white, 
		"Your disguise was destroyed and you were ",  Color( 170, 0, 0 ), "KILLED",white,"!!")
	end)
	
	net.Receive( "PHR_ChatPrint", function( len, ply ) -- Recieve the message
		local txt = net.ReadString()
		chat.AddText( PropDisguiseCol, "PropHuntGun: ", white, txt)
	end)
	
	net.Receive( "PHR_LockPrint", function( len, ply ) -- Recieve the message
		local txt = net.ReadString()
		chat.AddText( Color(255,159,159), txt)
	end)
	
	net.Receive( "PHR_UnLockPrint", function( len, ply ) -- Recieve the message
		local txt = net.ReadString()
		chat.AddText( Color(159,255,175), txt)
	end)
end



-----------------------------------------------------------


--not working currently
-- update()  now not not working currently!

--- ROTATION AREA ---  actual rotation in ttt_prop/shared.lua

-- Player pressed a key (lock area)

--Rotation explained because its not explained anywhere, not even prop hunt had this fixed
--If the prop entity has the parent (player) then the player will see it follow clientside
--In shared.lua of the prop entity make it follow the player at every tick (important)
--simply allow it to rotate with key press by setting angles in the same place

hook.Add("KeyPress", "PlayerPressedKey", 
function(ply, key)
	if SERVER then
		if ( key == IN_WALK ) then
			if ply:GetNWBool("PHR_Disguised") then
				if ply:GetNWBool("PlayerLockedRotation") then
					ply:SetNWBool("PlayerLockedRotation", false)
					ply:EmitSound(unhidebeep, 40, 40)
					if ply.ttt_prop:GetParent() && ply.ttt_prop:GetParent():IsValid() then
						ply.ttt_prop:SetParent(nil)
					end
					--PHR_UnLockMsg("(alt) Prop Rotation Unlocked ", ply) -- old message system
				else
					ply:SetNWBool("PlayerLockedRotation", true)
					ply:EmitSound(unhidebeep, 40, 30)
					--PHR_LockMsg("(alt) Prop Rotation Locked ", ply) -- old message system
				end 
			end
		end
		
		if ( key == IN_DUCK ) then -- random prop on press control
			if ply:GetNWBool("PHR_Disguised") then
				if GetConVar('ttt_prophuntgun_enable_chooseprop'):GetInt() == 1 then 
					ply.choosemodel = table.Random(RANDOM_MODEL)
					
					if table.HasValue(BANNED_STARTING_PROPS, ply.choosemodel) then repeat
						ply.choosemodel = table.Random(RANDOM_MODEL)
					until 
						not table.HasValue(BANNED_STARTING_PROPS, ply.choosemodel)
					end
					
					ply.oldmodel = ply.ttt_prop:GetModel()
					ply.ttt_prop:SetPos(ply:GetPos() - Vector(0, 0, ply.ttt_prop:OBBMins().z + 20))
					ply:SetModelScale(1.05)
					ply.ttt_prop:SetModel(ply.choosemodel)
					ply.modelsize = ply.ttt_prop:OBBMaxs().z + ply.ttt_prop:OBBMaxs().y + ply.ttt_prop:OBBMaxs().x 
					
					--print(ply.modelsize)			
					if ply.modelsize < 7 then
						ply.ttt_prop:SetModel(ply.oldmodel)
					elseif ply.modelsize == 18.055249452591 then
						ply.ttt_prop:SetModel(ply.oldmodel)
					
					else
						
						ply:EmitSound(unhidebeep, 70, 40)
						local SetMDL = FindMetaTable("Entity").SetModel     --updating the invisible model of the player (for the hitbox)
						hook.Add("UpdatePlayerModel", "defaultskinoveride_" .. ply:SteamID(), function()
							local mdlpath = ply.choosemodel
							SetMDL( ply , mdlpath ) 
						end)
						hook.Run("UpdatePlayerModel")
						SendFullStateUpdate()
				
						if ply:GetNetworkedInt("savehealth") != nil && ply:GetNetworkedInt("savehealth") != 0 then
							ply:SetHealth(ply:GetNetworkedInt("savehealth")) 
						end
						
						local ent = ply.ttt_prop
						
						ply.ttt_prop:SetSkin(ent:GetSkin())
						ply.ttt_prop:SetSolid(SOLID_BSP)

						
						ent_health = math.Clamp( ( math.Round(ent:OBBMaxs().z) + math.Round(ent:OBBMaxs().x) + math.Round(ent:OBBMaxs().y) ) * 1.3 , 1, 1000 ) --ent:GetPhysicsObject():GetVolume()
						ply.ttt_prop.health = ent_health
						checktrue = false
						
						for j = 0, 1000, 1 do
							if ent:GetModel() == UsedModels[j] && ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth") != nil && ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth") !=0 then --
								ply:SetHealth(ply:GetNetworkedInt(ply:SteamID().."_"..UsedModels[j].."_savehealth")) --checking if the player has used this model this round
								checktrue = true
							end 
						end
					
						if checktrue != true then
							ply:SetNetworkedInt("savehealth", ply.ttt_prop.health) -- save prop health for reinit
							ply:SetHealth(ply.ttt_prop.health)	
						end
						checktrue = false
						
						ply:ResetHull()
						local hullxymax = math.Round(math.Max(ent:OBBMaxs().x, ent:OBBMaxs().y)) -- new prop hull maths
						local hullxymin = hullxymax * -1
						local hullz = math.Round(ent:OBBMaxs().z)
						ply:SetHull(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
						ply:SetHullDuck(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
					
						local bottom,top = ply:GetHull() -- calculating prophull networkvector for calcview
						ply:SetNetworkedVector("prophull", top)
					
						local mymodel = ent:GetModel() -- defining the previous model
						table.insert(UsedModels, mymodel)
						print("PropHuntGun: "..ply:Nick().." is now ".. mymodel)  --for the console
						ply:SetNetworkedString("prevmodel", mymodel)
					end
				end
			end
		end
	end 
end)

local meta = FindMetaTable("Player")
function meta:GetPlayerLockedRot()
	return self:GetNWBool("PlayerLockedRotation", false)
end

-- end of rotate area, sad face in the chat :(

-----------------------------------------------------------

-- target area (accurate prop targetting) 
hook.Add("KeyPress", "tracetest.GetPropInfo", function(ply,key)
	if CLIENT then
		timer.Create(ply:SteamID().."use", 0.01, 1, function() -- making sure you only choose the prop once
			if ((ply:Alive() && ply:GetNWBool("PHR_Disguised")) && key == IN_USE) then	
				local trace = {}
				local prophull = ply:GetNetworkedVector("prophull")
				local filter = {}
	
				trace.start = ply:EyePos()  + Vector(0, 0, prophull.z - 60)
				if prophull.z < 46 then
					trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 100)  + Vector(0, 0, prophull.z - 60)
				else
					trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 400)  + Vector(0, 0, prophull.z - 60)
				end
		
				for k,v in ipairs (ents.FindByClass("ttt_prop")) do
					table.insert(filter,v )
				end
				table.insert(filter,ply)
				trace.filter = filter
			
				local traceHit = util.TraceLine(trace) 

				if traceHit.Entity && traceHit.Entity:IsValid() && traceHit.Entity:GetSkin() != nil && traceHit.Entity:GetModel() != nil && traceHit.Entity:GetModel() != ply:GetModel() then
					if table.HasValue(EXPLOITABLE_DOORS, traceHit.Entity:GetClass()) then else
						if GetGlobalBool("ttt_prophuntgun_enable_chooseWeapons") then 
							net.Start("CL2SV_ExchangeProp")
							net.WriteEntity(traceHit.Entity)
							net.SendToServer()
						elseif not traceHit.Entity.AutoSpawnable then
							net.Start("CL2SV_ExchangeProp")
							net.WriteEntity(traceHit.Entity)
							net.SendToServer()
						end
					end
				elseif GetGlobalBool("ttt_prophuntgun_show_not_valid_prop_message") then
					ply:ChatPrint("Not valid prop/Not close enough")
				end
			end
		end)
	end
end)

-----------------------------------------------------------






--HUD AREA 
--used for prop outline
--was in a special location for a special reason

function PropHalo()
	if LocalPlayer():GetNWBool("PHR_Disguised") then
		showinggreen = 0
		local trace = {}
		local tracefar = {}
		local tracesuperfar = {}
		local prophull = LocalPlayer():GetNetworkedVector("prophull")
		local filter = {}
	
		trace.start = LocalPlayer():EyePos()  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
		trace.endpos = LocalPlayer():EyePos() + (LocalPlayer():EyeAngles():Forward() * 99)  + Vector(0, 0, prophull.z - 60)

		for k,v in ipairs (ents.FindByClass("ttt_prop")) do
			table.insert(filter,v )
		end
		table.insert(filter,LocalPlayer())

		trace.filter = filter  
		local traceHit = util.TraceLine(trace) 

		if traceHit.Entity && traceHit.Entity:IsValid() && traceHit.Entity:GetSkin() != nil && traceHit.Entity:GetModel() != nil && traceHit.Entity:GetModel() != LocalPlayer():GetModel() then
			local ent_table = {}
			table.insert(ent_table, traceHit.Entity)
			if table.HasValue(EXPLOITABLE_DOORS, traceHit.Entity:GetClass()) then else
				if GetGlobalBool("ttt_prophuntgun_enable_chooseWeapons") then 
					halo.Add(ent_table, Color(20, 250, 0), 1.2, 1.2, 1, true, true)
					showinggreen = 1
				elseif not traceHit.Entity.AutoSpawnable then
					halo.Add(ent_table, Color(20, 250, 0), 1.2, 1.2, 1, true, true)
					showinggreen = 1
				end
			end
		end

		tracefar.start = LocalPlayer():EyePos() + (LocalPlayer():EyeAngles():Forward() * 100)  + Vector(0, 0, prophull.z - 60) --
		tracefar.endpos = LocalPlayer():EyePos() + (LocalPlayer():EyeAngles():Forward() * 350)  + Vector(0, 0, prophull.z - 60)

		tracefar.filter = filter
		local tracefarHit = util.TraceLine(tracefar) 
		
		if tracefarHit.Entity && tracefarHit.Entity:IsValid() && tracefarHit.Entity:GetSkin() != nil && tracefarHit.Entity:GetModel() != nil && tracefarHit.Entity:GetModel() != LocalPlayer():GetModel() then
			local ent_table = {}
			table.insert(ent_table, tracefarHit.Entity)
			if table.HasValue(EXPLOITABLE_DOORS, tracefarHit.Entity:GetClass()) then else
				if showinggreen == 0 then 
					if GetGlobalBool("ttt_prophuntgun_enable_chooseWeapons") then 
						halo.Add(ent_table, Color(245, 191, 66), 1.2, 1.2, 1, true, true)
					elseif not tracefarHit.Entity.AutoSpawnable then
						halo.Add(ent_table, Color(245, 191, 66), 1.2, 1.2, 1, true, true)
					end
				end
			end
		end
	
		tracesuperfar.start = LocalPlayer():EyePos() + (LocalPlayer():EyeAngles():Forward() * 350)  + Vector(0, 0, prophull.z - 60) --
		tracesuperfar.endpos = LocalPlayer():EyePos() + (LocalPlayer():EyeAngles():Forward() * 2000)  + Vector(0, 0, prophull.z - 60)

		tracesuperfar.filter = filter
		local tracesuperfarHit = util.TraceLine(tracesuperfar) 
		
		if tracesuperfarHit.Entity && tracesuperfarHit.Entity:IsValid() && tracesuperfarHit.Entity:GetSkin() != nil && tracesuperfarHit.Entity:GetModel() != nil && tracesuperfarHit.Entity:GetModel() != LocalPlayer():GetModel() then
			local ent_table = {}
			table.insert(ent_table, tracesuperfarHit.Entity)
			if table.HasValue(EXPLOITABLE_DOORS, tracesuperfarHit.Entity:GetClass()) then else
				if GetGlobalBool("ttt_prophuntgun_enable_chooseWeapons") then 
					halo.Add(ent_table, Color(255, 0, 6), 1.2, 1.2, 1, true, true)
				elseif not tracesuperfarHit.Entity.AutoSpawnable then
					halo.Add(ent_table, Color(255, 0, 6), 1.2, 1.2, 1, true, true)
				end
			end
		end
		
		local CVARshouldDrawhint = GetGlobalInt("ttt_prop_hunt_gun_entityfinder", 0)
		if CVARshouldDrawhint == 1 then
			halo.Add(ents.FindInSphere( LocalPlayer():EyePos() + Vector(0, 0, prophull.z - 60), 200), Color(245, 191, 66), 1.2, 1.2, 1, true, true)
		end
		
		if LocalPlayer():GetNWBool("PHR_Disguised") then
			if LocalPlayer():GetNWBool("PHR_Door_Special") then --- making doors pink for door locker
				local trace = {}
				local tracefar = {}
				local tracesuperfar = {}
				local prophull = LocalPlayer():GetNetworkedVector("prophull")
				local filter = {}
	
				trace.start = LocalPlayer():EyePos()  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
				trace.endpos = LocalPlayer():EyePos() + (LocalPlayer():EyeAngles():Forward() * 999)  + Vector(0, 0, prophull.z - 60)

				for k,v in ipairs (ents.FindByClass("ttt_prop")) do
					table.insert(filter,v )
				end
				table.insert(filter,LocalPlayer())

				trace.filter = filter  
				local traceHit = util.TraceLine(trace)
				local door = traceHit.Entity
			
				if IsValid(door) then
					if DCheck( door, LocalPlayer() ) then
						local ent_table = {}
						table.insert(ent_table, door)
						halo.Add(ent_table, Color(245, 66, 233), 1.2, 1.2, 1, true, true)
					end 
				end 
			end
		end
	end
end
hook.Add("PreDrawHalos", "PropHalo", PropHalo)

function HUDPaint()
	local ply = LocalPlayer()
	local lockedMat = Material("vgui/ttt/LockedPropRotation_ico.png")
	local unlockedMat = Material("vgui/ttt/UnLockedPropRotation_ico.png")
	local defY = ScrH() / 2
	local totaltime = GetGlobalInt("ttt_autotaunt_interval", 45)
	local taunttimeleft = ply:GetNWFloat("PHR_TauntTimeLeft") - CurTime()

	if ply:GetNWBool("PHR_Disguised") then
	
		local w = ScrW()
		local h = ScrH()
		local x_axis, y_axis, width, height = 285, defY+defY*0.75, 230, 20
		draw.RoundedBox(9, x_axis, y_axis, width, height, Color(10,10,10,127.5))
	
		taunttimeleft = math.Round(taunttimeleft or 0, 1)
		if taunttimeleft < 0 then 
				ply:SetNWFloat("PHR_TauntTimeLeft",GetGlobalInt("ttt_autotaunt_interval", 45) + CurTime())
				taunttimeleft = ply:GetNWFloat("PHR_TauntTimeLeft") - CurTime()
		end
		
		local Segments = width / totaltime 
		local TauntCountdownBar = taunttimeleft * Segments 
		TauntCountdownBar = math.Clamp(TauntCountdownBar, 3, 1000)
	
		draw.RoundedBox(2, x_axis, y_axis, TauntCountdownBar, 5, Color(255, 0, 0,200))
		draw.SimpleText(taunttimeleft, "Trebuchet24", x_axis + 205, y_axis +10, Color(255,255,255,255), 1, 1)
		
		----------------------------------------- -- special ability area
		if ply:GetNWBool("PHR_Special_Ready") then
			draw.RoundedBox(2, x_axis, y_axis+12, 180, 5, Color(249, 233, 10,200))
		end
		draw.RoundedBox(2, x_axis, y_axis+12, 180, 5, Color(249, 233, 10,50))
		
		SfX = function(ply) 
			ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
		end
		------------------------------------------
		
		if ply:GetNWBool("PlayerLockedRotation") then	
			surface.SetMaterial(lockedMat)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(275, defY+defY*0.8, 250, 100) --2 for y
		else
			surface.SetMaterial(unlockedMat)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(275, defY+defY*0.8, 250, 100) --2 for y 
		end
	
		if CLIENT then
			if (ply:Alive() && ply:GetNWBool("PHR_Disguised")) then	
				local trace = {}
				local prophull = ply:GetNetworkedVector("prophull")
				local filter = {}
	
				trace.start = ply:EyePos()  + Vector(0, 0, prophull.z - 60)
				trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 2000)  + Vector(0, 0, prophull.z - 60)
		
				for k,v in ipairs (ents.FindByClass("ttt_prop")) do
					table.insert(filter,v )
				end
				table.insert(filter,ply)
				trace.filter = filter
				
				local traceHit = util.TraceLine(trace)
				local traceHitdraw = traceHit.HitPos
				ply:SetNetworkedVector("drawproploc", traceHitdraw) -- helping out the propdraw special 
				if traceHit.Entity && traceHit.Entity:IsValid() && traceHit.Entity:GetSkin() != nil && traceHit.Entity:GetModel() != nil && traceHit.Entity:GetModel() != ply:GetModel() then
					if table.HasValue(EXPLOITABLE_DOORS, traceHit.Entity:GetClass()) then else
						local targetprop = traceHit.Entity
						if targetprop != nil then
							local targetmodel = targetprop:GetModel()
							local targetmaxhealth = math.Round(math.Clamp( ( math.Round(targetprop:OBBMaxs().z) + math.Round(targetprop:OBBMaxs().x) + math.Round(targetprop:OBBMaxs().y) ) * 1.3 , 1, 1000 ))
					
							if ply:GetNetworkedInt(ply:SteamID().."_"..targetmodel.."_savehealth") != 0 && ply:GetNetworkedInt(ply:SteamID().."_"..targetmodel.."_savehealth") != nil then 
								targethealth = math.Round(ply:GetNetworkedInt(ply:SteamID().."_"..targetmodel.."_savehealth"))
								draw.SimpleText(targethealth.."/"..targetmaxhealth, "DebugFixedSmall",  ( ScrW() / 2 ) + ( ScrW() / 170 ) * 3, ScrH() / 2 + ( ScrW() / 170 ), Color(255,255,255,255), 1, 1)
							else
								draw.SimpleText(targetmaxhealth.."/"..targetmaxhealth, "DebugFixedSmall", ( ScrW() / 2 ) + ( ScrW() / 170 ) * 3, ScrH() / 2 + ( ScrW() / 170 ) , Color(255,255,255,255), 1, 1)
							end
						end
					end
				end
			end
		end	
	end
end
hook.Add("HUDPaint", "TTT_HUDPaint", HUDPaint)








-------------------------------
-- SPECIAL WEAPON FUNCTIONS --
-------------------------------
-------------------------------
-- SPECIAL WEAPON FUNCTIONS --
-------------------------------
-------------------------------
-- SPECIAL WEAPON FUNCTIONS --
-------------------------------
-------------------------------
-- SPECIAL WEAPON FUNCTIONS --
-------------------------------

--CHOOSING THE SPECIAL ABILITY

function PlayerSpawn(ply)
	timer.Remove( ply:SteamID().."_TauntTime" )
	activatedSpecials = {}
	ply.isGrapple = false
	if GetConVar('ttt_prophuntgun_enable_specials'):GetInt() == 1 then
		if GetConVar('ttt_prophuntgun_special_smoke'):GetInt() == 1 then
			table.insert(activatedSpecials,1)
		end	
		
		if GetConVar('ttt_prophuntgun_special_flash'):GetInt() == 1 then
			table.insert(activatedSpecials,2)
		end
	
		if GetConVar('ttt_prophuntgun_special_throwtaunt'):GetInt() == 1 then
			table.insert(activatedSpecials,3)
		end
	
		if GetConVar('ttt_prophuntgun_special_fakeprop'):GetInt() == 1 then
			table.insert(activatedSpecials,4)
		end
	
		if GetConVar('ttt_prophuntgun_special_speed'):GetInt() == 1 then
			table.insert(activatedSpecials,5)
		end
	
		if GetConVar('ttt_prophuntgun_special_swappos'):GetInt() == 1 then
			table.insert(activatedSpecials,6)
		end
	
		if GetConVar('ttt_prophuntgun_special_dropinv'):GetInt() == 1 then
			table.insert(activatedSpecials,7)
		end
	
		if GetConVar('ttt_prophuntgun_special_yeet'):GetInt() == 1 then
			table.insert(activatedSpecials,8)
		end
		
		if GetConVar('ttt_prophuntgun_special_newtonshoot'):GetInt() == 1 then
			table.insert(activatedSpecials,9)
		end
		
		if GetConVar('ttt_prophuntgun_special_grapple'):GetInt() == 1 then
			table.insert(activatedSpecials,10)
		end	
		
		if GetConVar('ttt_prophuntgun_special_teleport'):GetInt() == 1 then
			table.insert(activatedSpecials,11)
		end
		
		if GetConVar('ttt_prophuntgun_special_propel'):GetInt() == 1 then
			table.insert(activatedSpecials,12)
		end
		
		if GetConVar('ttt_prophuntgun_special_lock'):GetInt() == 1 then
			table.insert(activatedSpecials,13)
		end
		
	end
	
	
	ply.choosemodel = table.Random(RANDOM_MODEL) -- helping out random prop spawn
	
	if table.HasValue(BANNED_STARTING_PROPS, ply.choosemodel) then repeat
		ply.choosemodel = table.Random(RANDOM_MODEL)
	until 
		not table.HasValue(BANNED_STARTING_PROPS, ply.choosemodel)
	end
	ply.propchanged = 0
	
	--ply.ChooseAbil = math.random(11, 0) -- should be n+1, 0
	ply.ChooseAbil = table.Random(activatedSpecials)
	if GetConVar("ttt_prophuntgun_debug_specials_forceuse"):GetInt() != 0 then
		ply.ChooseAbil = GetConVar("ttt_prophuntgun_debug_specials_forceuse"):GetInt()	--for testing
		print("---------------------------------------------------------ALERT---------------------------------------------------------")
		print("PROPHUNTGUN ALERT: You have chosen ID:"..GetConVar("ttt_prophuntgun_debug_specials_forceuse"):GetInt().." as your debug forceuse special ability. Set ttt_prophuntgun_debug_specials_forceuse to 0 if you wish to fix.")
		print("---------------------------------------------------------ALERT---------------------------------------------------------")
	end
end
--SWEP:choose()
-- 1 = smoke
-- 2 = flash bang
-- 3 = throw taunt to any prop
-- 4 = draw a prop with your mouse to confuse innocents
-- 5 = speed boost
-- 6 = swap position with another prop
-- 7 = drop targeted players inventory
-- 8 = eagleflight gun (fly forwards)
-- 9 = newtonshoot (shoot dmg)
-- 10 = grapple hook
-- 11 = teleport (disabled by default)
-- 12 = propel
-- 13 = lock doors at distance

-------------------------------


function SWEP:specialNotify()
-- setting up special attack notifications --
	local ply = self.Owner
	ply.isGrapple = false
	if ply.ChooseAbil == 1 then
		PHR_Msg("Your special ability is smoke!", ply)
		isSmoke = false
	end	
	if ply.ChooseAbil == 2 then 
		PHR_Msg("Your special ability is flash!", ply)
		isFlash = false
	end	
	if ply.ChooseAbil == 3 then 
		PHR_Msg("Your special ability is throw taunt!", ply)
		isTaunt = false
	end	
	if ply.ChooseAbil == 4 then 
		PHR_Msg("Your special ability is fake prop!", ply)
		isDraw = false
	end
	if ply.ChooseAbil == 5 then 
		PHR_Msg("Your special ability is speed boost!", ply)
		isSpeed = false
	end
	if ply.ChooseAbil == 6 then 
		PHR_Msg("Your special ability is swap posistion!", ply)
		isSwap = false
	end
	if ply.ChooseAbil == 7 then 
		PHR_Msg("Your special ability is drop inventory!", ply)
		isDrop = false
	end
	if ply.ChooseAbil == 8 then 
		PHR_Msg("Your special ability is yeet!", ply)	
		isEagle = true
		ply:SetNWBool("PHR_Special_Ready", false)
		timer.Create(ply:SteamID().."_drop_cooldown", 10, 1, function() -- special treatment to avoid abuse (cooldown starts on ph mode activation)
			isEagle = false
			ply:SetNWBool("PHR_Special_Ready", true)
		end)
	end
	if ply.ChooseAbil == 9 then 
		PHR_Msg("Your special ability is newton shoot!", ply)
		isShoot = false
	end
	if ply.ChooseAbil == 11 then 
		PHR_Msg("Your special ability is teleport!", ply)
		isTeleport = false
	end
	if ply.ChooseAbil == 10 then 
		PHR_Msg("Your special ability is grapple!", ply)
		nextshottime = CurTime()
	end
	if ply.ChooseAbil == 12 then 
		PHR_Msg("Your special ability is propel!", ply)
	end
	if ply.ChooseAbil == 13 then 
		PHR_Msg("Your special ability is lock doors!", ply)
		ply:SetNWBool("PHR_Door_Special", true)
		isLock = false
	end
	-- setting up special attack notifications --
end




function SWEP:specialAttack()
	local ply = self.Owner
	ply.isGrapple = false
	if self:GetNWBool("PHR_WepDisguised") then
		if ply.ChooseAbil == 1 then
			if not isSmoke then
				isSmoke = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:smoke()
				timer.Create(ply:SteamID().."_smoketimer", 2.5, 1, function() 
					isSmoke = false 
					ply:SetNWBool("PHR_Special_Ready", true) 
				end)
			end
		
		elseif ply.ChooseAbil == 2 then
			if not isFlash then
				isFlash = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:flash()
				timer.Create(ply:SteamID().."_flashtimer", 10, 1, function() 
					isFlash = false 
					ply:SetNWBool("PHR_Special_Ready", true) 
				end)
			end
			
		elseif ply.ChooseAbil == 3 then
			if not isTaunt then
				isTaunt = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:throwtaunt()
				timer.Create(ply:SteamID().."_throw_taunt_timer", 10, 1, function() 
					isTaunt = false 
					ply:SetNWBool("PHR_Special_Ready", true) 
				end)
			end
		
		elseif ply.ChooseAbil == 4 then
			if not isDraw then
				isDraw = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:drawprop()
				timer.Create(ply:SteamID().."_draw_prop_timer", 5, 1, function() 
					isDraw = false 
					ply:SetNWBool("PHR_Special_Ready", true)
					if ply.ttt_drawprop:IsValid() then 
						self:undrawprop() 
					end 
				end)
			end	
	
		elseif ply.ChooseAbil == 5 then
			if not isSpeed then
				isSpeed = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:speed()
				timer.Create(ply:SteamID().."_speed_boost_cooldown", 10, 1, function() 
					isSpeed = false 
					ply:SetNWBool("PHR_Special_Ready", true)
				end)
			end	
		
		elseif ply.ChooseAbil == 6 then
			if not isSwap then
				isSwap = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:swapPos()
				timer.Create(ply:SteamID().."_swap_cooldown", 10, 1, function() 
					isSwap = false
					ply:SetNWBool("PHR_Special_Ready", true)
				end)
			end
		
		elseif ply.ChooseAbil == 7 then
			if not isDrop then
				isDrop = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:dropInv()
				timer.Create(ply:SteamID().."_drop_cooldown", 5, 1, function() 
					isDrop = false
					ply:SetNWBool("PHR_Special_Ready", true)
				end)
			end
			
		elseif ply.ChooseAbil == 8 then
			if not isEagle then
				isEagle = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:eagleflight()
				timer.Create(ply:SteamID().."_eagle_cooldown", 10, 1, function() 
					isEagle = false
					ply:SetNWBool("PHR_Special_Ready", true)
				end)
			end
			
		elseif ply.ChooseAbil == 9 then
			if not isShoot then
				isShoot = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:shoot()
				timer.Create(ply:SteamID().."_shoot_cooldown", 7, 1, function() 
					isShoot = false
					ply:SetNWBool("PHR_Special_Ready", true)
				end)
			end
		
		elseif ply.ChooseAbil == 11 then
			if not isTeleport then
				isTeleport = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:teleport()
				timer.Create(ply:SteamID().."_telp_cooldown", 3, 1, function() 
					isTeleport = false
					ply:SetNWBool("PHR_Special_Ready", true)
				end)
			end
		
		elseif ply.ChooseAbil == 10 then
			ply.isGrapple = true
	
		elseif ply.ChooseAbil == 12 then
			self:propel()
			ply:SetNWBool("PHR_Special_Ready", true)
			
		elseif ply.ChooseAbil == 13 then
			if not isLock then
				isLock = true
				ply:SetNWBool("PHR_Special_Ready", false)
				self:lock()
				timer.Create(ply:SteamID().."_lock_cooldown", 10, 1, function() 
					isLock = false
					ply:SetNWBool("PHR_Special_Ready", true)
				end)
			end
		end	
	end
end





-------------------------
-- the actions --
-------------------------

-- start of door lock area

SWEP.DoorHealth			= 300000 -- How much health the doors have
SWEP.LockRange			= 8000 -- How close you have to be to the door to lock it 
SWEP.LockTime 			= 8 -- How long it stays locked
SWEP.CooldownTime 		= 10 -- How long the door has to cool down before being locked again
SWEP.DoorLock 			= true -- Do the doors automatically unlock?
SWEP.DoorBreak 			= false -- Do the doors break?

function SWEP:lock()
if not SERVER then return end
	local ply = self.Owner
	local trace = {}
	local prophull = ply:GetNetworkedVector("prophull")
	local filter = {}
	
	trace.start = ply:EyePos()  + Vector(0, 0, prophull.z - 60) 
	trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 900)  + Vector(0, 0, prophull.z - 60)
	for k,v in ipairs (ents.FindByClass("ttt_prop")) do
		table.insert(filter,v )
	end
	table.insert(filter,ply)
	trace.filter = filter  
	local traceHit = util.TraceLine(trace) 
	local door = traceHit.Entity

	if DCheck( door, self.Owner ) then
		if SERVER then -- I decided to do this instead of using SWEP delays.
			if door:GetNWBool("DoorCooldown") then
				local timel = timer.TimeLeft(door:EntIndex() .. "_CoolDown")
				local timel = math.Round( math.Clamp(timel, 0, self.CooldownTime))
				CustomMsg(self.Owner, "This door is cooling down for " .. timel .. " more seconds!", Color(200,0,0))
				return false
			end
		end
		
		if not door:GetNWBool("TTTLocked") then    
			if SERVER then
				door:SetNWEntity("DoorOwner", self.Owner) -- Sets the locker of that specific door
				door:EmitSound( "doors/door_metal_medium_close1.wav" )
				door:Fire("lock", "", 0)
				door:SetNWBool("TTTLocked", true)
 
				local prehealth = self.DoorHealth -- Why not use health? Cause it breaks a lot...
				door:SetNWInt(door:EntIndex() .. "_health", prehealth)

				DamageLog(self.Owner:Nick() .. " locked a door")
				CustomMsg(self.Owner, "Door locked!", Color(0,255,0))

				if self.DoorLock then
					timer.Create(door:EntIndex() .. "DoorLockedTime", self.LockTime, 1, function()
						door:Fire( "unlock", "", 0 )
						door:EmitSound( "doors/door1_move.wav" )
						door:SetNWBool("TTTLocked", false)
						door:SetNWEntity("DoorOwner", nil)
						CustomMsg(door:GetNWEntity("DoorOwner"), "One of your doors has unlocked due to time!", Color(255,255,0))
						timer.Destroy(door:EntIndex() .. "DoorLockedTime")
					end)
				end
				door:SetNWFloat("LockedUntil", CurTime() + self.LockTime) -- Used for the DrawHUD timer
			end
		elseif door:GetNWBool("TTTLocked") then
			if SERVER then
				CustomMsg(self.Owner, "This door is already locked!", Color(255,255,0))
			end
		end
	end
	
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(10,Sfx)
end

function SWEP:DrawHUD()
	local tr = self.Owner:GetEyeTrace() -- Simplified trace because I dont care about distance
	local door = tr.Entity
	if door:GetNWBool("TTTLocked") then
		local timeleft = math.Clamp(  door:GetNWFloat("LockedUntil", 0)-CurTime(), 0, self.LockTime  )
		local timeleft = math.Round(timeleft,1)
		local owner = door:GetNWEntity("DoorOwner")
		local dhealth = door:GetNWInt(door:EntIndex() .. "_health")
		local dhealth = math.Clamp(dhealth, 0, self.DoorHealth)
		--self.DrawCrosshair = false -- Hides the crosshair to make things look neater
               
		local w = ScrW()
		local h = ScrH()
		local x_axis, y_axis, width, height = w/2-w/14, h/2.8, w/7, h/20
		draw.RoundedBox(2, x_axis, y_axis, width , height, Color(10,10,10,200)) -- Onscreen stuff
		draw.SimpleText("Door locked by prop", "Trebuchet24", w/2, h/2.8 + height/2, Color(255, 40, 40,255), 1, 1)
		draw.RoundedBox(2, x_axis, y_axis * 1.3, width, height * 2, Color(10,10,10,200))
		draw.SimpleText("Health: "..dhealth, "Trebuchet24", w/2, h/2.8 + height*2.6, Color(255, 255, 255), 1, 1)
		if self.DoorLock then
			draw.SimpleText("Unlocks in: "..timeleft, "Trebuchet24", w/2, h/2.8 + height*3.5, Color(255, 255, 255), 1, 1)
		end
	else
		self.DrawCrosshair = true -- Shows the crosshair again
	end
end

function PropHaloDoor()
	if LocalPlayer():GetNWBool("PHR_Disguised") && LocalPlayer().ChooseAbil == 13 then
		local trace = {}
		local tracefar = {}
		local tracesuperfar = {}
		local prophull = LocalPlayer():GetNetworkedVector("prophull")
		local filter = {}
	
		trace.start = LocalPlayer():EyePos()  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
		trace.endpos = LocalPlayer():EyePos() + (LocalPlayer():EyeAngles():Forward() * 999)  + Vector(0, 0, prophull.z - 60)

		for k,v in ipairs (ents.FindByClass("ttt_prop")) do
			table.insert(filter,v )
		end
		table.insert(filter,LocalPlayer())

		trace.filter = filter  
		local traceHit = util.TraceLine(trace)
		local door = traceHit.Entity

		if DCheck( door, LocalPlayer() ) then
			local ent_table = {}
			table.insert(ent_table, door)
			halo.Add(ent_table, Color(245, 66, 233), 1.2, 1.2, 1, true, true)
		end
	end
end
hook.Add("PreDrawHalos", "PropHalodoor", PropHaloDoor)

function DCheck( prop, ply )
    if not IsValid( prop ) then print("[Debug]: " .. tostring(prop) .. " is not valid" ) return false end
    -- Do NOT check if the player is valid, it causes issues with the Entity Damage function

    -- These types will not work because they cannot recieve a health value no matter what I try
    local b_list = { "func_door", "func_door_rotating" }
    local object = prop:GetClass()
       
    for h, i in pairs(b_list) do
        if (object == "prop_door_rotating" and IsValid(prop) and object ~= i) then
            return true
		elseif object == i then
			if SERVER then
				CustomMsg(ply, "Incompatible door!", Color(200,0,0))
				ply:ChatPrint("This door is incompatible with the Locker!")
				print("[Debug]: Player tried to use blacklisted door " .. tostring(i) )
				print("[Debug]: Send these to Exho if you have questions")
			end
			return false
		end
	end
end

hook.Add("TTTPrepareRound", "FixAllYallDoors",function()
	for e,f in pairs( ents.GetAll() ) do
		if f == "prop_door_rotating" then
			print("[Debug]: All doors reset" )
			f:SetNWBool("TTTLocked", false)
			f:SetNWEntity("DoorOwner", nil)
			f:SetNWFloat("LockedUntil", nil)
			timer.Destroy(f:EntIndex() .. "DoorLockedTime")
		end
	end
end)

--end of door area

function SWEP:propel()
	local ply = self:GetOwner()
	ply:EmitSound( "Weapon_PhysCannon.Launch" )
	if SERVER then
		ply:SetVelocity(ply:GetAimVector() * -500)
	end
end

-- start of grapple area

local sndPowerUp		= Sound("weapons/crossbow/hit1.wav")
local sndPowerDown		= Sound("Airboat.FireGunRevDown")
local sndTooFar			= Sound("buttons/button10.wav")

function SWEP:Think()
	if (!self.Owner || self.Owner == NULL) then return end
	local ply = self.Owner
	if ply.isGrapple then
		if ( self.Owner:KeyPressed( IN_ATTACK2 ) ) then
			self:StartAttack()
		elseif ( self.Owner:KeyDown( IN_ATTACK2 ) && inRange && not HitSky ) then
			self:UpdateAttack()
		elseif ( self.Owner:KeyReleased( IN_ATTACK2 ) && inRange &&  not HitSky ) then
			self:EndAttack( true )
		end
	end
end

function SWEP:DoTrace( endpos )
	local ply = self.Owner
	local prophull = ply:GetNetworkedVector("prophull")
	local trace = {}
		trace.start = self.Owner:EyePos() + Vector(0, 0, prophull.z - 60)
		trace.endpos = trace.start + (self.Owner:GetAimVector() * 14096)
		if(endpos) then trace.endpos = (endpos - self.Tr.HitNormal * 7) end
		trace.filter = { self.Owner, self.Weapon, self.ttt_prop }
	self.Tr = nil
	self.Tr = util.TraceLine( trace )
end

function SWEP:StartAttack()
	--Get begining and end poins of trace.
	local gunPos = self.Owner:GetShootPos() --Start of distance trace.
	local disTrace = self.Owner:GetEyeTrace() --Store all results of a trace in disTrace.
	local hitPos = disTrace.HitPos --Stores Hit Position of disTrace.
	--Calculate Distance
	--Thanks to rgovostes for this code.
	local x = (gunPos.x - hitPos.x)^2;
	local y = (gunPos.y - hitPos.y)^2;
	local z = (gunPos.z - hitPos.z)^2;
	local distance = math.sqrt(x + y + z);
	--Only latches if distance is less than distance CVAR
	local distanceCvar = GetConVarNumber("grapple_distance")
	inRange = false
	if (distance <= distanceCvar) then
		inRange = true
	end
	--test if you grapple the sky (later added by Scahry)
	HitSky=false
	if(disTrace.HitSky)then
		HitSky=true
	end
	if inRange && not HitSky then
		if (SERVER) then			
			if (!self.Beam) then --If the beam does not exist, draw the beam.
				--grapple_beam
				self.Beam = ents.Create( "trace1" )
					local prophull = self.Owner:GetNetworkedVector("prophull")
					self.Beam:SetPos( self.Owner:GetPos() + Vector(0, 0, prophull.z - 60))
				self.Beam:Spawn()
			end		
			self.Beam:SetParent( self.Owner )
			self.Beam:SetOwner( self.Owner )

		end	
		self:DoTrace()
		self.speed = 10000 --Rope latch speed. Was 3000.
		self.startTime = CurTime()
		self.endTime = CurTime() + self.speed
		self.stufff = -1		
		if (SERVER && self.Beam) then
			self.Beam:GetTable():SetEndPos( self.Tr.HitPos )
		end		
		self:UpdateAttack()	
		self.Owner:EmitSound( sndPowerDown )
	end
	self.Owner:EmitSound( sndPowerUp )
end

function SWEP:UpdateAttack()
	self.Owner:LagCompensation( true )
	if (!endpos) then endpos = self.Tr.HitPos end
	if (SERVER && self.Beam) then
		self.Beam:GetTable():SetEndPos( endpos )
	end
	lastpos = endpos
			if ( self.Tr.Entity:IsValid() ) then	
					endpos = self.Tr.Entity:GetPos()
					if ( SERVER ) then
					self.Beam:GetTable():SetEndPos( endpos )
					end	
			end		
			local vVel = (endpos - self.Owner:GetPos())
			local Distance = endpos:Distance(self.Owner:GetPos())		
			local et = (self.startTime + (Distance/self.speed))
			if(self.stufff != 0) then
				self.stufff = (et - CurTime()) / (et - self.startTime)
			end
			if(self.stufff < 0) then
				self.Owner:EmitSound( sndPowerUp )
				self.stufff = 0
			end		
			if(self.stufff == 0) then
			zVel = self.Owner:GetVelocity().z
			vVel = vVel:GetNormalized()*(math.Clamp(Distance,0,7))
				if( SERVER ) then
				local gravity = GetConVarNumber("sv_Gravity")
				vVel:Add(Vector(0,0,(gravity/100)*1.5)) --Player speed. DO NOT MESS WITH THIS VALUE!
				if(zVel < 0) then
					vVel:Sub(Vector(0,0,zVel/100))
				end
				self.Owner:SetVelocity(vVel)
				end
			end	
	endpos = nil
	self.Owner:LagCompensation( false )	
end

function SWEP:EndAttack( shutdownsound )
	if ( shutdownsound ) then
		self.Owner:EmitSound( sndPowerDown )
	end
	if ( CLIENT ) then return end
	if ( !self.Beam ) then return end
	self.Beam:Remove()
	self.Beam = nil
end

-- end of grapple area

function SWEP:teleport() -- too buggy to use
if not SERVER then return end
	local ply = self.Owner
	local trace = {}
	local prophull = ply:GetNetworkedVector("prophull")
	local filter = {}

	trace.start = ply:EyePos() + (ply:EyeAngles():Forward() * 200)  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
	trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 800)  + Vector(0, 0, prophull.z - 60)
	for k,v in ipairs (ents.FindByClass("ttt_prop")) do
		--table.insert(filter,v )
	end
	table.insert(filter,ply)
	trace.filter = filter  
	local traceHit = util.TraceLine(trace)
	
	local tr = ply:GetEyeTrace()
	
	--if traceHit.HitWorld then
		local teleportpos = tr.HitPos  - Vector(0, 0, ply.ttt_prop:OBBMins().z )
		local ang = ply:GetAngles()
		local edata_up = EffectData()
		edata_up:SetOrigin(ply:GetPos())
		ang = Angle(0, ang.y, ang.r)
		edata_up:SetAngles(ang)
		edata_up:SetEntity(ply)
		edata_up:SetMagnitude(1)
		edata_up:SetRadius(1)
	
		util.Effect("teleport_beamup", edata_up)
	
		local edata_dn = EffectData()
		edata_dn:SetOrigin(teleportpos)
		ang = Angle(0, ang.y, ang.r) 
		edata_dn:SetAngles(ang)
		edata_dn:SetEntity(ply)
		edata_dn:SetMagnitude(1)
		edata_dn:SetRadius(1)

		util.Effect("teleport_beamdown", edata_dn)
		ply:EmitSound(unhidesound, 100, 100)
		timer.Create(ply:SteamID().."teleporting", 1.5, 1, function() 
			ply:SetPos(trace.endpos)
		end)
	--end
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(20,Sfx)
end

function SWEP:shoot()
	if not IsValid(self:GetOwner()) then return end
	self.Owner:EmitSound( "weapons/ar2/fire1.wav", 54, 100 )
	local cone = 0.005 or 0.1
	local num = 6
	
	local prophull = self:GetOwner():GetNetworkedVector("prophull")   
	local bullet = {}
	bullet.Num    = num
	bullet.Src    = self:GetOwner():GetShootPos() + Vector(0, 0, prophull.z - 60)
	bullet.Dir    = self:GetOwner():GetAimVector()-- + Vector(0, 0, prophull.z - 60)
	bullet.Spread = Vector( cone, cone, 0 )
	bullet.Tracer = 1
	bullet.Force  = 600 / 10
	bullet.Damage = 1
	bullet.TracerName = "AirboatGunHeavyTracer"
	
	ignorePredictionOrRecipientFilter = true
	local owner = self:GetOwner()
	local fwd = 600 / num
	local up = 300 / num
	bullet.Callback = function(att, tr, dmginfo)
		local ply = tr.Entity
		if SERVER and IsValid(ply) and ply:IsPlayer() and (not ply:IsFrozen()) then
			local pushvel = tr.Normal * fwd
			pushvel.z = math.max(pushvel.z, up)
			ply:SetGroundEntity(nil)
			ply:SetLocalVelocity(ply:GetVelocity() + pushvel)
			ply.was_pushed = {att=owner, t=CurTime(), wep=self:GetClass()}
		end
	end
	self:GetOwner():FireBullets( bullet )
   
	--local sfx = EffectData()
	--sfx:SetOrigin(self:GetOwner():GetShootPos() + Vector(0, 0, prophull.z - 60))
	--sfx:SetStart(self:GetOwner():GetShootPos() + Vector(0, 0, prophull.z - 60))
	--util.Effect("AirboatGunHeavyTracer",sfx, true, true)
   
   local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				self.Owner:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(7,Sfx)
end


function SWEP:eagleflight()
if not SERVER then return end
	local ply = self.Owner
	local propmodel = ply.ttt_prop:GetModel()
	local startpos = ply:GetPos()
	local startangles = ply:GetAngles()
	if propmodel == GetGlobalString("ttt_prop_hunt_gun_default_prop", "models/player/Kleiner.mdl") then PHR_Msg("Sorry, you cannot yeet dr kleiner right now", ply) else
		self:PropUnDisguise()
		sound.Play( "ambient/creatures/town_child_scream1.wav", self.Owner:GetPos())
		ply:EmitSound( "PropHuntGun/yeet-sound-effect.wav", 70, 100 )
		ply:SelectWeapon( "weapon_ttt_unarmed" )
		physProp = ents.Create( "prop_physics" )
		ply:Spectate( OBS_MODE_CHASE )
		ply:SpectateEntity( physProp )	
		physProp.vel = ply:GetAimVector()*-50
		local velocity = ply:GetAimVector() * 1000000
		physProp:SetAngles( startangles )
		physProp:SetModel( propmodel )
		physProp:Spawn()
		physProp:Activate()
		physProp:SetPos( startpos )
		ply:SetParent( physProp )
		physProp:SetVelocity( velocity )
	
		local phys = physProp:GetPhysicsObject()
		if ( !IsValid( phys ) ) then ent:Remove() return end
		phys:ApplyForceCenter( velocity )
	
		local j = 1
		while true do
			local phys_obj = physProp:GetPhysicsObjectNum( j )
			if phys_obj then
				phys_obj:SetVelocity( velocity )
				phys_obj:SetMass(10)
				j = j + 1
			else
				break
			end
		end
	
		ply.physProp = physProp
		physProp.hp = ply:Health()
		physProp.c = ply:GetCredits()
		physProp.Owner = ply
		physProp.explode = function()
			local ply = physProp.Owner
			local pos = physProp:GetPos()
			local ent = ents.Create( "env_explosion" )
			ent:SetPos( physProp:GetPos() )
			ent:SetOwner( ply )
			ent:SetPhysicsAttacker( physProp )
			ent:Spawn()
			ent:SetKeyValue( "iMagnitude", "0" )
			ent:Fire( "Explode", 0, 0 )
			ply:SetPos(pos)
			physProp:unphysProp()
			ply:SetHealth(physProp.hp)
			ply:SetCredits(physProp.c)
		end

		physProp.unphysProp = function()
			local stepback = physProp.vel
			local ply = physProp.Owner
			ply:SetParent()
			ply.physProp = nil
			local pos = physProp:GetPos()
			ply:Spawn()
			ply:SetPos( pos )
			local yaw = physProp:GetAngles().yaw
			ply:SetAngles( Angle( 0, yaw, 0 ) )
			timer.Simple( 0.01, function()
				YeetnoStuck(ply,stepback)
			end )
			physProp:Remove()
			ply:SelectWeapon( "weapon_ttt_prop_hunt_gun" )
		end

		table.insert(yeeTefrn,physProp)
		timer.Simple( 5, function()
			if (IsValid(physProp)) then
				physProp.explode(physProp)
			end
		end)
	end
end


function SWEP:dropInv()
if not SERVER then return end
	local ply = self.Owner
	local trace = {}
	local prophull = ply:GetNetworkedVector("prophull")
	local filter = {}
	
	trace.start = ply:EyePos()  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
	trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 900)  + Vector(0, 0, prophull.z - 60)
	for k,v in ipairs (ents.FindByClass("ttt_prop")) do
		table.insert(filter,v )
	end
	table.insert(filter,ply)
	trace.filter = filter  
	local traceHit = util.TraceLine(trace) 

	if traceHit.Entity && traceHit.Entity:IsValid() then
		local ent = traceHit.Entity 
		if ent:IsPlayer() then
			for k, v in pairs(ent:GetWeapons()) do
				if IsValid(v) then
					if (v.AllowDrop == true) then
						ent:DropWeapon(v)
					end
				end
			end
		elseif ent:IsNPC() then
			local wep = ent:GetActiveWeapon()
			if wep:IsValid() then
				local fwep = ents.Create(wep:GetClass())
				if not IsValid(fwep) then return end
				-- These commands will fix game crash
				ent:ClearSchedule()
				ent:ClearGoal()
				ent:ClearEnemyMemory()
				ent:ClearExpression()
				ent:StopMoving()

				fwep:SetPos(ent:LocalToWorld(ent:OBBCenter()))
				fwep:Spawn()

				local phys = fwep:GetPhysicsObject()
				if not IsValid(phys) then return end
				phys:AddAngleVelocity(VectorRand() * phys:GetMass() * 128)
				phys:ApplyForceCenter((ent:GetAimVector() + vector_up * 0.8) * phys:GetMass() * 290)

				wep:Remove()
			end
		else
			local phys = ent:GetPhysicsObject()
			if IsValid(phys) then
				phys:AddAngleVelocity(VectorRand() * 45)
				phys:ApplyForceCenter((( - ent:GetPos()):GetNormal() + vector_up * 0.6) * phys:GetMass() * 200)
			end
		end
	end
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				self.Owner:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(5,Sfx)
end


function SWEP:swapPos()
if not SERVER then return end
	local ply = self.Owner
	local trace = {}
	local prophull = ply:GetNetworkedVector("prophull")
	local filter = {}
	
	trace.start = ply:EyePos()  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
	trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 900)  + Vector(0, 0, prophull.z - 60)
	for k,v in ipairs (ents.FindByClass("ttt_prop")) do
		table.insert(filter,v )
	end
	table.insert(filter,ply)
	trace.filter = filter  
	local traceHit = util.TraceLine(trace) 

	if traceHit.Entity && traceHit.Entity:IsValid() then
		local myPlace = ply:GetPos()
		ply:EmitSound(unhidesound, 100, 100)
		ply:SetPos(traceHit.Entity:GetPos())
		traceHit.Entity:SetPos(myPlace)
	end
	
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(10,Sfx)
end


function SWEP:speed()
	local ply = self.Owner
	ply:SetWalkSpeed(600)
	timer.Create(ply:SteamID().."_speed_boost_timer", 3, 1, function()
		ply:SetWalkSpeed(200)
	end)
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(10,Sfx)		
end


function SWEP:smoke()
local ply = self.Owner
	if SERVER then
		ply:EmitSound( "weapons/ar2/npc_ar2_altfire.wav", 72, 100 )
		ply:EmitSound( "weapons/ar2/ar2_altfire.wav", 72, 100 )

		local shake = ents.Create("env_physexplosion")
		shake:SetKeyValue("radius", 512)
		shake:SetKeyValue("magnitude", 64 )
		shake:SetKeyValue("spawnflags", "3")
		shake:SetOwner(self.Owner)
		shake:SetPos(self:GetPos())
		shake:Fire("Explode" , "", 0)
		shake:Fire("kill","", 2)

		local fear = ents.Create("ai_sound")
		fear:SetKeyValue("soundtype", 8)
		fear:SetKeyValue("volume", 312)
		fear:SetKeyValue("duration", 5)
		fear:SetOwner(self.Owner)
		fear:SetPos(self:GetPos())
		fear:Fire("EmitAISound" , "", 0.82)
		fear:Fire("kill","", 6)
		
		local sfx = EffectData()
		sfx:SetOrigin(ply:GetPos())
		util.Effect("effect_prophuntgun_smoke",sfx, true, true)
		util.ScreenShake( ply:GetPos(), 32, 210, 1, 1024 )
	end

	--This is the little tick before the explosion
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(2.4,Sfx)
end


function SWEP:flash()
	local ply = self.Owner
	local FLASH_INTENSITY = 2250; --the higher the number, the longer the flash will be whitening your screen

	local function simplifyangle(angle)
		while(angle>=180) do
			angle = angle - 360;
		end
		while(angle <= -180) do
			angle = angle + 360;
		end
		return angle;
	end

	function SimulateFlash_REALCS_NOT_ANYTHINGELSE() 
		if self.Owner:GetNetworkedFloat("RCS_flashed_time") > CurTime() then
			local ply = self.Owner;
			local e = ply:GetNetworkedFloat("RCS_flashed_time"); --when it dies away
			local s = ply:GetNetworkedFloat("RCS_flashed_time_start"); --when it started
			
			local alpha;
			if(e-CurTime()>DIETIMER)then
				alpha = 255;
			else
				local pf = 1-(CurTime() - (e-DIETIMER))/(e - (e-DIETIMER));
				alpha = pf*255;
			end
			
			surface.SetDrawColor(255,255,255,math.Round(alpha));
			surface.DrawRect(0,0,surface.ScreenWidth(),surface.ScreenHeight());
		end 
	end
	hook.Add("HUDPaint", "SimulateFlash_REALCS_NOT_ANYTHINGELSE", SimulateFlash_REALCS_NOT_ANYTHINGELSE);
	
	--motion blur and other junk
	local function SimulateBlur_REALCS_NOT_ANYTHINGELSE()
		local ply = self.Owner;
		local e = ply:GetNetworkedFloat("RCS_flashed_time") + EFFECT_DELAY; --when it dies away
		local s = ply:GetNetworkedFloat("RCS_flashed_time_start"); --when it started
		if (e > CurTime()  &&  e-EFFECT_DELAY-CurTime()<=DIETIMER ) then
			local pf = 1-(CurTime() - (e-DIETIMER))/(DIETIMER);
			DrawMotionBlur(0, pf/((DIETIMER+EFFECT_DELAY)/DIETIMER), 0);
			--DrawBloom( 3, pf*5, 6, 6, 12, 0, 255, 255, 255 );
		elseif(e > CurTime())then
			DrawMotionBlur( 0, 0.01, 0);
		else
			DrawMotionBlur( 0, 0, 0);
		end
	end
	hook.Add( "RenderScreenspaceEffects", "SimulateBlur_REALCS_NOT_ANYTHINGELSE", SimulateBlur_REALCS_NOT_ANYTHINGELSE )

	ply:EmitSound(Sound("weapons/flashbang/flashbang_explode"..math.random(1,2)..".wav"));
	for _,pl in pairs(player.GetAll()) do
		if pl != ply then 
			local ang = (self:GetPos() - pl:GetShootPos()):GetNormalized():Angle()
			local tracedata = {};
			tracedata.start = pl:GetShootPos();
			tracedata.endpos = self:GetPos();
			tracedata.filter = pl;
			local traceRes = pl:GetEyeTrace()
			local tr = util.TraceLine(tracedata);

			local pitch = simplifyangle(ang.p - pl:EyeAngles().p);
			local yaw = simplifyangle(ang.y - pl:EyeAngles().y);
			local dist = pl:GetShootPos():Distance( self:GetPos() )
			local endtime = FLASH_INTENSITY/dist;

			if traceRes.HitWorld and !tr.HitWorld then
				local endtime = FLASH_INTENSITY/dist;
				if (endtime > 6) then
					endtime = 6;
				elseif(endtime < 0.4) then
					endtime = 0.4;
				end
				simpendtime = math.floor(endtime);
				tenthendtime = math.floor((endtime-simpendtime)*10);
				if (  pitch > -45 && pitch < 45 && yaw > -45 && yaw < 45 ) || (pl:GetEyeTrace().Entity && pl:GetEyeTrace().Entity == self.Entity )then --in FOV
					--pl:PrintMessage(HUD_PRINTTALK, "In FOV");
				else
					--pl:PrintMessage(HUD_PRINTTALK, "Not in FOV");
					endtime = endtime/2;
				end
				if (pl:GetNetworkedFloat("RCS_flashed_time") > CurTime()) then --if you're already flashed
					pl:SetNetworkedFloat("RCS_flashed_time", endtime+pl:GetNetworkedFloat("RCS_flashed_time")+CurTime()-pl:GetNetworkedFloat("RCS_flashed_time_start")); --add more to it
				else --not flashed
					pl:SetNetworkedFloat("RCS_flashed_time", endtime+CurTime());
				end
				pl:SetNetworkedFloat("RCS_flashed_time_start", CurTime());
			end
		end
	end
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(10,Sfx)
end

function SWEP:throwtaunt()
if not SERVER then return end
	local ply = self.Owner
	local trace = {}
	local prophull = ply:GetNetworkedVector("prophull")
	local filter = {}
	
	trace.start = ply:EyePos()  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
	trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 9999)  + Vector(0, 0, prophull.z - 60)
	for k,v in ipairs (ents.FindByClass("ttt_prop")) do
		table.insert(filter,v )
	end
	table.insert(filter,ply)
	trace.filter = filter  
	local traceHit = util.TraceLine(trace) 

	if traceHit.Entity && traceHit.Entity:IsValid() then
		ply.last_taunt = rand_taunt
		if ply.last_throw_taunt_time + 0.25 <= CurTime() then repeat
			rand_taunt = Sound(table.Random(TAUNT_TABLE))	
		until rand_taunt != ply.last_taunt && file.Exists("sound/"..rand_taunt, "GAME" )
		ply.last_throw_taunt_time = CurTime()
		traceHit.Entity:EmitSound(rand_taunt, 100)
		ourtauntmodel = string.Right( string.Replace( traceHit.Entity:GetModel(), ".mdl", "" ), 20 )
		PHR_Msg("Threw taunt to "..ourtauntmodel, ply)
		end
	end
	
	local Sfx = function()
		if self.Owner:IsValid() && self.Owner != nil then
			if (SERVER) then
				ply:EmitSound( "weapons/grenade/tick1.wav", 62, 100 )
			end
		end
	end
	timer.Simple(10,Sfx)
end


function SWEP:drawprop()
if not SERVER then return end
	local ply = self.Owner
	local trace = {}
	local prophull = ply:GetNetworkedVector("prophull")
	local filter = {}
	
	trace.start = ply:EyePos()  + Vector(0, 0, prophull.z - 60) -- :EyeAngles()
	trace.endpos = ply:EyePos() + (ply:EyeAngles():Forward() * 9999)  + Vector(0, 0, prophull.z - 60)
	for k,v in ipairs (ents.FindByClass("ttt_prop")) do
		table.insert(filter,v )
	end
	table.insert(filter,ply)
	trace.filter = filter  
	traceHitprop = util.TraceLine(trace) 

	ply.ttt_drawprop = ents.Create("ttt_drawprop") -- create the first entity
	ply.ttt_drawprop:Spawn()
	ply.ttt_drawprop:SetOwner(ply)	
	ply.ttt_drawprop:SetName(ply:Nick().."'s External Draw Prop")
	ply.ttt_drawprop:SetModel(ply:GetModel())
	ply.ttt_drawprop:SetPos(traceHitprop.HitPos)
	ply:SetNetworkedVector("drawproploc", traceHitprop.HitPos)
	
	ply.ttt_drawprop:EmitSound(hidesound, 75, 60)
	ply.ttt_drawprop:EmitSound(unhidebeep, 80, 70)
end

function SWEP:undrawprop()
if not SERVER then return end
	local ply = self.Owner
	if ply.ttt_drawprop:IsValid() then
		local hitpos = ply:GetNetworkedVector("drawproploc")
		ply.ttt_drawprop:SetPos(hitpos)

		--sound.Play( "ambient/creatures/town_child_scream1.wav", self.Owner:GetPos())
		ply.ttt_drawprop:EmitSound(unhidesound2, 45, 40) -- beep boop sounds
		ply.ttt_drawprop:EmitSound(hidesound, 75, 60)
		ply.ttt_drawprop:EmitSound(unhidesound, 35, 65)
		ply.ttt_drawprop:EmitSound(unhidebeep, 35, 65)
		ply.ttt_drawprop:Remove()
	end
end

-------------------------------


-------------------------------

--hook adding area yarr
hook.Add("PlayerDeath", "ohnotheydied", RemoveHandler)
hook.Add( "PlayerDisconnected", "Playerleave", DisconnectHandler)
hook.Add("EntityTakeDamage","CauseGodModeIsOP", DamageHandler)
hook.Add("PlayerDeath","EntDestroyeronDeath", DeathHandler)
hook.Add("TTTEndRound","EntDestroyeronRoundEnd", RoundEndHandler)
hook.Add("TTTPrepareRound","EntDestroyeronRoundPrep", RoundEndHandler)
hook.Add("KeyPress", "PlayerPressedKey", PlayerPressedKey)
hook.Add("Think", "Thinking", ThinkSee)
hook.Add("UpdatePlayerModel", "modelswapoveride_" , UpdateModel)
hook.Add( "CalcView", "PropHunterCalcView", PropHunterCalcView)
hook.Add("PlayerSpawn", "Spawning", PlayerSpawn)


-- end of the code