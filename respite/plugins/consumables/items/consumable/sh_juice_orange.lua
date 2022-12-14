ITEM.name = "Orange Juice"
ITEM.desc = "A bottle filled with orange juice."
ITEM.uniqueID = "food_orange_juice"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.material = "models/props_c17/furniturefabric002a"
ITEM.quantity2 = 3
ITEM.price = 6
ITEM.container = "j_empty_juice_bottle"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["accuracy"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 5,
	["Juice"] = 10,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["accuracy"] = 4
		},
		
		res = {
			["Bleed"] = 5,
			["Poison"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}