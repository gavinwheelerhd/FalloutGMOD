ITEM.name = "Home Run-Away"
ITEM.desc = "A makeshift melee weapon made out of a baseball bat and a sawblade."
ITEM.model = "models/warz/melee/baseballbat.mdl"
ITEM.class = "hl2_m_homerunaway"
ITEM.uniqueID = "hl2_m_homerunaway"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["sharp"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 10,
	["Slash"] = 10,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3,
	["j_scrap_wood"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 5),
	ang = Angle(0, -0, 90),
	fov = 8.5,
}
