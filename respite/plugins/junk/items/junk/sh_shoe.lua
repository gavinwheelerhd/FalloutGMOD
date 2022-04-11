ITEM.name = "Old Shoe"
ITEM.uniqueID = "j_old_shoe"
ITEM.model = "models/props_junk/Shoe001a.mdl"
ITEM.desc = "An old worn shoe."
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_cloth"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}