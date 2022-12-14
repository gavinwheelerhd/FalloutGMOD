ITEM.name = "Empty Paint Can"
ITEM.uniqueID = "j_empty_paint_can"
ITEM.model = "models/props_junk/metal_paintcan001a.mdl"
ITEM.desc = "An empty can that once contained paint."
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_metals"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Container"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}