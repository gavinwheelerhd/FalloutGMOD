ITEM.name = "CH-UNK"
ITEM.desc = "Makeshift meat-launcher that superheats meat before hurling it at a target. You have a strange feeling this was the result of people taking meat puns a bit too far."
ITEM.ammoString = "Meat"
ITEM.model = "models/weapons/tfa_w_pancor_jackhammer.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01a"
ITEM.class = "tfa_chunk"
ITEM.uniqueID = "tfa_chunk"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Fire"] = 10,
	["Blunt"] = 10,
}

ITEM.scaling = {
	["medical"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-200, 5.5, 3),
	ang = Angle(0, -0, 2),
	fov = 9.5,
}