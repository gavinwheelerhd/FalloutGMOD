ITEM.name = "Framed Picture"
ITEM.uniqueID = "j_picture_3"
ITEM.model = "models/props_c17/Frame002a.mdl"
ITEM.desc = "A wooden picture frame."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2
ITEM.skin = 3

ITEM.salvItem = {
	["j_scrap_wood"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Decor"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 12,
}