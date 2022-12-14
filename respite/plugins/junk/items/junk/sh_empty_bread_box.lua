ITEM.name = "Empty Bread Box"
ITEM.uniqueID = "j_empty_bread_box"
ITEM.model = "models/props/cs_office/cardboard_box03.mdl"
ITEM.desc = "An empty cardboard box."
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "j"

ITEM.salvItem = {
	["misc_paper"] = 1,
	["j_scrap_cloth"] = 4,
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Garbage"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 6.5),
	ang = Angle(0, -0, 0),
	fov = 10,
}