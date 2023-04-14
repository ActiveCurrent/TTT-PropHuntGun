CreateConVar("ttt_prop_hunt_gun_time", 500, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_prop_hunt_gun_cooldown", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_prop_hunt_gun_min_prop_size", 5, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_prop_hunt_gun_max_prop_size", 100, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_autotaunt_interval", 30, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_prop_hunt_gun_entityfinder", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_prophuntgun_enable_randomprop", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_enable_chooseWeapons", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_enable_chooseProp", 0, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_default_prop", "models/player/kleiner.mdl", FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_prop_rotation_on_by_default", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_display_press_e_message", 0, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_taunt_cooldown", 5, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_show_not_valid_prop_message", 1, FCVAR_NOTIFY)


CreateConVar("ttt_prophuntgun_enable_specials", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_debug_specials_forceuse", 0, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_smoke", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_flash", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_throwtaunt", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_fakeprop", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_speed", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_swappos", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_dropinv", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_yeet", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_newtonshoot", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_grapple", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_teleport", 0, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_propel", 1, FCVAR_NOTIFY)
CreateConVar("ttt_prophuntgun_special_lock", 1, FCVAR_NOTIFY)


hook.Add('TTTUlxInitCustomCVar', 'TTTdisguiserInitRWCVar', function(name)
	ULib.replicatedWritableCvar('ttt_prop_hunt_gun_time', 'rep_ttt_prop_hunt_gun_time', GetConVar('ttt_prop_hunt_gun_time'):GetInt(), true, false, name)
	ULib.replicatedWritableCvar('ttt_autotaunt_interval', 'rep_ttt_autotaunt_interval', GetConVar('ttt_autotaunt_interval'):GetInt(), true, false, name)
	ULib.replicatedWritableCvar('ttt_prop_hunt_gun_cooldown', 'rep_ttt_prop_hunt_gun_cooldown', GetConVar('ttt_prop_hunt_gun_cooldown'):GetInt(), true, false, name)
	ULib.replicatedWritableCvar('ttt_prop_hunt_gun_min_prop_size', 'rep_ttt_prop_hunt_gun_min_prop_size', GetConVar('ttt_prop_hunt_gun_min_prop_size'):GetInt(), true, false, name)
	ULib.replicatedWritableCvar('ttt_prop_hunt_gun_max_prop_size', 'rep_ttt_prop_hunt_gun_max_prop_size', GetConVar('ttt_prop_hunt_gun_max_prop_size'):GetInt(), true, false, name)
	ULib.replicatedWritableCvar('ttt_prop_hunt_gun_entityfinder', 'rep_ttt_prop_hunt_gun_entityfinder', GetConVar('ttt_prop_hunt_gun_entityfinder'):GetInt(), true, false, name)
end)

if SERVER then
	AddCSLuaFile()

	-- ConVar replication is broken in GMod, so we do this.
	-- I don't like it any more than you do, dear reader. Copycat!
	hook.Add("TTTPrepareRound", "ttt_prop_hunt_gun_sync_convars", function ()
		SetGlobalInt("ttt_prop_hunt_gun_time", GetConVar("ttt_prop_hunt_gun_time"):GetInt())
		SetGlobalInt("ttt_autotaunt_interval", GetConVar("ttt_autotaunt_interval"):GetInt())
		SetGlobalInt("ttt_prop_hunt_gun_cooldown", GetConVar("ttt_prop_hunt_gun_cooldown"):GetInt())
		SetGlobalInt("ttt_prop_hunt_gun_min_prop_size", GetConVar("ttt_prop_hunt_gun_min_prop_size"):GetInt())
		SetGlobalInt("ttt_prop_hunt_gun_max_prop_size", GetConVar("ttt_prop_hunt_gun_max_prop_size"):GetInt())
		SetGlobalInt("ttt_prop_hunt_gun_entityfinder", GetConVar("ttt_prop_hunt_gun_entityfinder"):GetInt())
		SetGlobalString("ttt_prop_hunt_gun_default_prop", GetConVar("ttt_prophuntgun_default_prop"):GetString())
		SetGlobalBool("ttt_prophuntgun_show_not_valid_prop_message", GetConVar("ttt_prophuntgun_show_not_valid_prop_message"):GetBool())
		SetGlobalBool("ttt_prophuntgun_enable_chooseWeapons", GetConVar("ttt_prophuntgun_enable_chooseWeapons"):GetBool())
	end)

    cvars.AddChangeCallback("ttt_prop_hunt_gun_time", function(cv, old, new)
		SetGlobalInt("ttt_prop_hunt_gun_time", tonumber(new))
	end)
	cvars.AddChangeCallback("ttt_autotaunt_interval", function(cv, old, new)
		SetGlobalInt("ttt_autotaunt_interval", tonumber(new))
	end)
    cvars.AddChangeCallback("ttt_prop_hunt_gun_cooldown", function(cv, old, new)
		SetGlobalInt("ttt_prop_hunt_gun_cooldown", tonumber(new))
	end)
    cvars.AddChangeCallback("ttt_prop_hunt_gun_min_prop_size", function(cv, old, new)
		SetGlobalInt("ttt_prop_hunt_gun_min_prop_size", tonumber(new))
	end)
    cvars.AddChangeCallback("ttt_prop_hunt_gun_max_prop_size", function(cv, old, new)
		SetGlobalInt("ttt_prop_hunt_gun_max_prop_size", tonumber(new))
	end)
	cvars.AddChangeCallback("ttt_prop_hunt_gun_entityfinder", function(cv, old, new)
		SetGlobalInt("ttt_prop_hunt_gun_entityfinder", tonumber(new))
	end)
    
end

if CLIENT then
	hook.Add('TTTUlxModifyAddonSettings', 'TTT2DisguiserModifySettings', function(name)
		local tttrspnl = xlib.makelistlayout{w = 415, h = 318, parent = xgui.null}

		local tttrsclp = vgui.Create('DCollapsibleCategory', tttrspnl)
		tttrsclp:SetSize(390, 60)
		tttrsclp:SetExpanded(1)
		tttrsclp:SetLabel('Basic Settings')

		local tttrslst = vgui.Create('DPanelList', tttrsclp)
		tttrslst:SetPos(5, 25)
		tttrslst:SetSize(390, 150)
		tttrslst:SetSpacing(5)

		tttrslst:AddItem(xlib.makeslider{
			label = "ttt_prop_hunt_gun_time (Def. 10)",
			repconvar = "rep_ttt_prop_hunt_gun_time",
			min = 1, max = 100,
			parent = tttrslst
		})

		tttrslst:AddItem(xlib.makeslider{
			label = "ttt_prop_hunt_gun_cooldown (Def. 30)",
			repconvar = "rep_ttt_prop_hunt_gun_cooldown",
			min = 1, max = 100,
			parent = tttrslst
        })
        	
		tttrslst:AddItem(xlib.makeslider{
			label = "ttt_prop_hunt_gun_entityfinder (Def. 0)",
			repconvar = "ttt_prop_hunt_gun_entityfinder",
			min = 0, max = 1,
			parent = tttrslst
		})

		tttrslst:AddItem(xlib.makeslider{
			label = "ttt_autotaunt_interval (Def. 45)",
			repconvar = "ttt_autotaunt_interval",
			min = 1, max = 800,
			parent = tttrslst
		})

		xgui.hookEvent('onProcessModules', nil, tttrspnl.processModules)
		xgui.addSubModule('Prop Disguiser', tttrspnl, nil, name)
	end)
end