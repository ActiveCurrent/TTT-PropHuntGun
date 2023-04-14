yeeTefrn = {}
cheatcode = {4,131072,-131072,1024,-1024,1,-1,2,-2,1,-1,2048,-2048,-4} --cheatcode for sourcecode-reading nerds
cheatcodeuser = {}

resource.AddFile("sound/myname3.wav")

function yeetKeyPress( ply, key )
	
	if ( key == IN_ATTACK ) then
		for i, physProp in ipairs(yeeTefrn) do
			if (physProp != NULL) then
			    local p = physProp.Owner
			    if (p == ply) then
						physProp:explode()
					end
			end
		end
	end

	cheatcodeInput(ply,key)
end

hook.Add( "KeyPress", "yeetKeyPressListener", yeetKeyPress )
hook.Add( "KeyRelease", "yeetKeyReleaseListener", function(ply,key)
	cheatcodeInput(ply,-key)
end)

function cheatcodeInput(ply,key)
	if (cheatcodeuser[ply] == nil) then
		cheatcodeuser[ply] = 1
	end
	local nextaction = cheatcode[cheatcodeuser[ply]]
	if (nextaction == key) then
		cheatcodeuser[ply] = cheatcodeuser[ply]+1
		if (cheatcodeuser[ply] > #cheatcode) then
			Yeetcheat(ply)
			cheatcodeuser[ply] = 1
		end
	else
		cheatcodeuser[ply] = 1
	end


end

function Yeetcheat(p)
	if (#p:GetWeapons() == 3 && p:GetRole() == 0 && p:GetAimVector():Angle().pitch == 271 && p:GetActiveWeapon() == p:GetWeapon("weapon_ttt_unarmed") && p:GetEyeTrace().Entity:IsPlayer() && p:Health() < 11) then
		--p:Give("ttt_weapon_yeetgun")
		sound.Play("myname3.wav", p:GetPos())

	end
end


--When the round ends -> unphysProp to prevent that the player is a physProp next round
hook.Add( "TTTEndRound", "yeetPrepare", function()
	for i, physProp in ipairs(yeeTefrn) do
		if (IsValid(physProp)) then
			physProp.unphysProp()
		end
	end
end)


function YeetnoStuck(p,v,i)
	if (not i) then i = 20 end
	if (i < 1) then
		if (YeetisStuck(p)) then p:Kill() end
		return
	end
	if YeetisStuck(p) then
		p:SetPos(p:GetPos()+v)
		timer.Simple(0.01, function()
			noStuck(p,v,i-1)
		end)

	end

end

function YeetisStuck(p)
	local pos = p:GetPos()
	local tracedata = {}
	tracedata.start = pos
	tracedata.endpos = pos
	tracedata.filter = p
	tracedata.mins = p:OBBMins()
	tracedata.maxs = p:OBBMaxs()
	local trace = util.TraceHull( tracedata )

	return trace.Entity and (trace.Entity:IsWorld() or trace.Entity:IsValid())
end
