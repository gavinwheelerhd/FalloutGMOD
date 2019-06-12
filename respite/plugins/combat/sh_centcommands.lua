local PLUGIN = PLUGIN

--these are used for the npcs, so they might be slightly different.
local CHATCOLOR_MELEE = Color(155, 130, 130)
local CHATCOLOR_RANGED = Color(130, 130, 150)
local CHATCOLOR_REACT = Color(140, 150, 140)
local CHATCOLOR_GRAZE = Color(140, 100, 50)
local CHATCOLOR_RESIST = Color(160, 150, 130)
local CHATCOLOR_SPECIAL = Color(150, 120, 100)

local CHATCOLOR_RED = Color(160, 60, 60)
local CHATCOLOR_GREEN = Color(60, 160, 60)

nut.command.add("cent", {
	--adminOnly = true,
	syntax = "<string command>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a command for the entity to run.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			if(!entity:runCMD(client, arguments[1], arguments[2])) then
				client:notify("Invalid command.")
			end
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centfa", {
	--adminOnly = true,
	syntax = "<string command>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a command for the entity to run.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:fortAttack(arguments[1])
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centname", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a name for the entity.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("name", arguments[1])
			client:notify("Entity's name has been changed to " ..arguments[1].. ".")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centsay", {
	adminOnly = true,
	syntax = "<string sentence>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to say.")
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(client, "say_npc", entity:getNetVar("name", (entity.name or entity.PrintName)) .. " says \"" ..msg.."\"")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centme", {
	adminOnly = true,
	syntax = "<string action>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to do.")
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(client, "say_npc", "**" ..entity:getNetVar("name", (entity.name or entity.PrintName)).. " " ..msg)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centdesc", {
	adminOnly = true,
	syntax = "<string description>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a desc for the entity.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("desc", arguments[1])
			client:notify("Entity's description has been changed.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centmodel", {
	adminOnly = true,
	syntax = "<string model>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a model for the entity.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:SetModel(arguments[1])
			client:notify("Entity's model has been changed.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centkill", {
	adminOnly = true,
	onRun = function(client, arguments)		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:die()
			client:notify(entity:getNetVar("name").. " has been slain.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centinvadd", {
	adminOnly = true,
	syntax = "<string item>",
	onRun = function(client, arguments)		
		if(!arguments[1]) then
			client:notify("Specify an item.")
			return
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local uniqueID = arguments[1]
		
			if(!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end
			
			if(!nut.item.list[uniqueID]) then
				client:notify("Invalid item.")
				return
			end
			
			table.insert(entity.inv, uniqueID)
			client:notify(nut.item.list[uniqueID].name.. " added to entity's inventory.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centinvremove", {
	adminOnly = true,
	syntax = "<string item>",
	onRun = function(client, arguments)		
		if(!arguments[1]) then
			client:notify("Specify an item.")
			return
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local uniqueID = arguments[1]
		
			if(!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end
			
			if(!nut.item.list[uniqueID]) then
				client:notify("Invalid item.")
				return
			end
			
			if(table.RemoveByValue(entity.inv, uniqueID)) then
				client:notify(nut.item.list[uniqueID].name.. " removed from entity's inventory.")
			else
				client:notify(nut.item.list[uniqueID].name.. " not found.")
			end
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centattrib", {
	adminOnly = true,
	syntax = "<string attribute> <number value>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify an attribute.")
			return
		end
		
		if(!arguments[2]) then
			client:notify("Specify a number value.")
			return
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local attrib = string.lower(arguments[1])

			if(string.find("agility", attrib)) then
				entity.agil = arguments[2]
			elseif(string.find("strength", attrib)) then
				entity.stre = arguments[2]
			elseif(string.find("accuracy", attrib)) then
				entity.accu = arguments[2]
			elseif(string.find("craftiness", attrib)) then
				entity.craf = arguments[2]
			elseif(string.find("endurance", attrib)) then
				entity.endu = arguments[2]
			elseif(string.find("luck", attrib)) then
				entity.luck = arguments[2]
			elseif(string.find("perception", attrib)) then
				entity.perc = arguments[2]
			elseif(string.find("fortitude", attrib)) then
				entity.fort = arguments[2]
			else
				client:notify("Invalid attribute.")
			end	
			
			client:notify(arguments[1].. " set to " ..arguments[2].. ".")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centattribcheck", {
	adminOnly = true,
	syntax = "<string attribute>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify an attribute.")
			return
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local attrib = string.lower(arguments[1])

			local num = 0
			if(string.find("agility", attrib)) then
				num = entity.agil
				client:notify("Agility: " ..num.. ".")
			elseif(string.find("strength", attrib)) then
				num = entity.stre
				client:notify("Strength: " ..num.. ".")
			elseif(string.find("accuracy", attrib)) then
				num = entity.accu
				client:notify("Accuracy: " ..num.. ".")
			elseif(string.find("craftiness", attrib)) then
				num = entity.craf
				client:notify("Craftiness: " ..num.. ".")
			elseif(string.find("endurance", attrib)) then
				num = entity.endu
				client:notify("Endurance: " ..num.. ".")
			elseif(string.find("luck", attrib)) then
				num = entity.luck
				client:notify("Luck: " ..num.. ".")
			elseif(string.find("perception", attrib)) then
				num = entity.perc
				client:notify("Perception: " ..num.. ".")
			elseif(string.find("fortitude", attrib)) then
				num = entity.fort
				client:notify("Fortitude: " ..num.. ".")
			else
				client:notify("Invalid attribute.")
			end
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centattribs", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local attribs = {}

			attribs["stm"] = entity.agil
			attribs["str"] = entity.stre
			attribs["accuracy"] = entity.accu
			attribs["medical"] = entity.craf
			attribs["end"] = entity.endu
			attribs["luck"] = entity.luck
			attribs["perception"] = entity.perc
			attribs["fortitude"] = entity.fort
			
			netstream.Start(client, "ShowAttribs", client, attribs)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

--clones a target Cent
nut.command.add("centclone", {
	adminOnly = true,
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			local clone = ents.Create(entity:GetClass()) --the new clone entity
			clone:SetPos(entity:GetPos()) --set its position
			clone:SetAngles(entity:GetAngles()) --set its angles
			
			clone:Spawn() --spawn it
			
			clone:SetModel(entity:GetModel()) --set its model
			clone:SetMaterial(entity:GetMaterial() or "") --set its material
			clone:SetColor(entity:GetColor() or Color(255,255,255))
			
			--sets its animation
			timer.Simple(1, function()
				if(IsValid(clone)) then
					clone:ResetSequence(entity:GetSequence())
				end
			end)
			
			clone:setNetVar("name", entity:getNetVar("name", entity.PrintName)) --set its custom name
			clone:setNetVar("desc", entity:getNetVar("desc", "")) --set its description			
			
			--set its attributes
			clone.agil = entity.agil
			clone.stre = entity.stre
			clone.accu = entity.accu
			clone.craf = entity.craf
			clone.endu = entity.endu
			clone.luck = entity.luck
			clone.perc = entity.perc
			clone.fort = entity.fort
			
			clone:SetCreator(client) --prop protection

			local name = entity:getNetVar("name", entity.PrintName)
			client:notify(name.. " has been cloned.") --notify the player
		else --called if they aren't looking at the right thing
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.chat.register("react_fail", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RED, text)
	end,
	color = CHATCOLOR_RED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("react_success", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_GREEN, text)
	end,
	color = CHATCOLOR_GREEN,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})


nut.chat.register("melee_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_MELEE, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("fort_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(200,200,200), text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("react_npc", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_REACT, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("graze_npc", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_GRAZE, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("resist_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RESIST, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("firearms_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RANGED, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("special_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_SPECIAL, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("whisper_npc", {
	onChatAdd = function(speaker, text)
		local color = nut.config.get("chatColor")
		
		chat.AddText(Color(color.r - 35, color.g - 35, color.b - 35), text)
	end,
	filter = "actions",
	font = "nutChatFont",
	onCanHear = nut.config.get("chatRange", 280) * 0.25,
	deadCanChat = true
})

nut.chat.register("say_npc", {
	onChatAdd = function(speaker, text)
		local color = nut.config.get("chatColor")
		
		chat.AddText(Color(color.r, color.g, color.b), text)
	end,
	filter = "actions",
	font = "nutChatFont",
	onCanHear = nut.config.get("chatRange", 280),
	deadCanChat = true
})

nut.chat.register("yell_npc", {
	onChatAdd = function(speaker, text)
		local color = nut.config.get("chatColor")
		
		chat.AddText(Color(color.r + 35, color.g + 35, color.b + 35), text)
	end,
	filter = "actions",
	font = "nutChatFont",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})