
local workshopIDs = { 
132470017, --lantern
121438260, --glowsticks
415143062, --tfa base
296202013, --prosp content 1
575907820, --prosp content decals
795055947, --blood and gore 4
479464165, --pac gear
160250458, --wire
380225333, --nextbot zombies 2.0
296806391, --nextbot zombies 2.0 (zombie survival)
246756300, --3d stream radio
609281761, --prone mod models
106867422, --classic light stool
727161410, --witcher gates
685130934, --serverguard content
774729099, --respite npc content
1450252748, --respite extra content
771487490, --simfphys vehicles
831680603, --simfphys armed vehicles
207739713, --nutscript content
880425071, --respite content 1
880423690, --respite content 2
880417421, --respite content 3
899354382, --respite effects
1076723138, --tfa content 1
1076732010, --tfa content 2
1076706011, --tfa content 3
756545326, --gunsmoke community models

--[[
player models
--]]

760262099, --tnb 1
760268522, --tnb 3
760265535, --tnb 2
873882787, --tnb 4
760255843, --tnb items
760256673, --tnb combine

--[[
Temporary Things (Like Maps)
--]]

215338015, --rp_v_torrington content
1105819667 --rp_stateline

}

for k, v in pairs(workshopIDs) do
	resource.AddWorkshop(v)
end

function SCHEMA:OnCharCreated(client, character)
	local inventory = character:getInv()

	if (inventory) then		
		local items = {}
	
		if (character:getFaction() == FACTION_DRIFTER) then
			items = {
				"book_newchar",
				"book_combat"
			}		
		elseif (character:getFaction() == FACTION_SURVIVOR) then
			items = {
				"book_combat"
			}
		elseif (character:getFaction() == FACTION_PLASTIC) then
			items = {
				"book_newchar_plastic",
				"book_combat"
			}

			local traitData = character:getData("traits", {})
			traitData["pla"] = 1
			character:setData("traits", traitData, false, player.GetAll())
		elseif (character:getFaction() == FACTION_ABER) then
			items = {
				"book_combat",
				"food_banana"
			}
		end
		
		local i = 7
		for k, v in pairs(items) do
			timer.Simple(i + k, function()
				inventory:add(v)
			end)
		end
	end
end 

function SCHEMA:PrePlayerLoadedChar(client, character, currentChar)
	if (character:getFaction() == FACTION_PLASTIC) then --material for plastic faction
		client:SetMaterial("phoenix_storms/mrref2")
	else
		client:SetMaterial("") --necessary for char swapping from plastic to anything else
	end
end

--if players can spawn effect props or not
function SCHEMA:PlayerSpawnEffect(client, weapon, info)
	return client:IsAdmin() or client:getChar():hasFlags("E")
end

--turns off sprays
function SCHEMA:PlayerSpray(client)
    return true
end

function SCHEMA:Initialize()
	game.ConsoleCommand("net_maxfilesize 64\n");
	game.ConsoleCommand("sv_kickerrornum 0\n");

	game.ConsoleCommand("sv_allowupload 0\n");
	game.ConsoleCommand("sv_allowdownload 1\n");
	game.ConsoleCommand("sv_allowcslua 0\n");
end

function SCHEMA:ScalePlayerDamage(client, hitGroup, dmgInfo)
	local attacker = dmgInfo:GetAttacker()
	if(attacker and attacker:IsPlayer()) then
		if(dmgInfo:GetDamageType() == DMG_SLASH) then
			dmgInfo:ScaleDamage(.1)
		else
			dmgInfo:ScaleDamage(.5)
		end
	else
		dmgInfo:ScaleDamage(1.5)

		if (hitGroup == HITGROUP_HEAD) then
			dmgInfo:ScaleDamage(7)
		elseif (LIMB_GROUPS[hitGroup]) then
			dmgInfo:ScaleDamage(0.5)
		end
	end
end

--someone gave me this but I don't think it does anything the way it is now
--[[
function SCHEMA:Think()
	local function onSuccess( ret )	
		wzsql.Query( "SHOW STATUS LIKE 'Uptime'", onSuccess );
		
		self.NextCheck = RealTime() + 10
	end
end
--]]