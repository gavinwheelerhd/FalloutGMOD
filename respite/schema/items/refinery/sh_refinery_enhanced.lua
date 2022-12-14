ITEM.name = "Refinery - Distorted Chips"
ITEM.uniqueID = "refinery_enhanced"
ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'MEMORIES', another slot labelled 'SHARD DUST', and a small output slot labelled 'ENHANCED CHIP'."

ITEM.funcTable = {
	{
		id = "chip",
		name = "Distorted Chip",
		icon = "icon16/cog.png",
		sound = "ambient/machines/spindown.wav",	
		--startString = "The machine accepts the materials and outputs adhesive."
		--endString = "The machine accepts the materials and outputs adhesive."
		required = {
			["distortion"] = 3,
			["cube_chip"] = 1,
		},	
		
		results = {
			["cube_chip_enhanced"] = 1,
		},
	}
}

local function requiredItems(inventory, item, required)
	local found = {}
	
	for k, v in pairs(required) do
		local items = inventory:getItemsOfType(k)
		
		if(table.IsEmpty(items)) then
			return false
		end
		
		local count = 0
		for k, item in pairs(items) do
			local amt = item:getData("Amount", 1)
			
			count = count + amt
		
			if(count >= v) then
				local leftover = count - v
				table.insert(found, {item, leftover})
				
				break
			end

			table.insert(found, {item, 0})
		end
		
		if(count < v) then
			return false
		end
	end

	for k, v in pairs(found) do
		local item = found[k][1]
		local leftover = found[k][2]
		
		local amt = item:getData("Amount", 1)
		
		if(leftover != 0) then
			item:setData("Amount", leftover)
		else
			item:remove()
		end
	end
	
	return true
end

for k, v in pairs(ITEM.funcTable) do
	ITEM.functions[v.id] = {
		name = v.name,
		icon = v.icon,
		onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()
			
			if(v.required) then
				local required = requiredItems(inventory, item, v.required)
				if (!required) then
					client:notify("You do not have the required materials.") 
					return false
				end
			end
		
			if(v.results) then
				for newItem, amt in pairs(v.results) do
					inventory:addSmart(newItem, amt, position, v.data)
				end
			end
			
			if(v.sound) then
				client:EmitSound(v.sound)
			end
			
			if(v.endString) then
				nut.chat.send(client, "itclose", v.endString)
			end

			return false
		end
	}
end