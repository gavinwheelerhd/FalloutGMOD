ITEM.name = "Mounted Fish"
ITEM.uniqueID = "j_mounted_fish"
ITEM.model = "models/props/cs_militia/mountedfish01.mdl"
ITEM.desc = "An old dead fish mounted on some wood."
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_wood"] = 2,
	["j_scrap_organic"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Decor"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(200, -0.75, 0),
	ang = Angle(180, -0, 180),
	fov = 3.64,
}