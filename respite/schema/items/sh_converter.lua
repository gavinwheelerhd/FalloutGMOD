ITEM.name = "Device - Converter"
ITEM.uniqueID = "converter"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.desc = "A strange box, it appears to be made out of some kind of very hard plastic. The box has a large slot at the top, and some sort of output slot on the left side. The top says 'PLASTIC FOOD'."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.data = { producing2 = 0 }
ITEM.color = Color(50, 150, 50)

ITEM.foods = {
	"food_apple_plastic",
	"food_banana_plastic",
	"food_lemon_plastic",
	"food_melon_plastic",
	"food_orange_plastic",
	"food_potato_plastic",
	"food_pumpkin_plastic",
	"food_fish_plastic",
	"food_fish2_plastic"
}

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.Activate = {
	icon = "icon16/arrow_refresh.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()

			local done = false
			local plastics
			for k, v in pairs (item.foods) do
				plastics = inventory:hasItem(v)
				if (plastics and !done) then
					done = true
					break
				end
			end	
			
			if(!done) then
				client:notifyLocalized("You don't have a suitable plastic food!") return false
			end
			
			client:notifyLocalized("Converting has started.")
			item:setData("producing2", CurTime())
			plastics:remove()
			timer.Simple(30, 
				function()
					if (item != nil) then
						item:setData("producing2", 0)
						local regular = string.sub(plastics.uniqueID, 1, (string.len(plastics.uniqueID) - 8))
						client:notifyLocalized("Converting has finished.")
						nut.item.spawn(regular, position)
					end
				end
			)
			return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local endTime = item:getData("producing2") + 30
		if (item:getOwner() != nil and (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0)) then
			return true 
		else
			return false
		end
	end
}