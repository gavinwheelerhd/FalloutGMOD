ITEM.name = "Cereal Box"
ITEM.uniqueID = "j_cereal_box"
ITEM.model = "models/props_lab/harddrive02.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.desc = "An empty cardboard box that once contained cereal."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_cloth"] = 3
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
	fov = 7,
}