ITEM.name = "Traffic Light"
ITEM.uniqueID = "j_traffic_light"
ITEM.model = "models/props_c17/traffic_light001a.mdl"
ITEM.desc = "A traffic light."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 3

ITEM.salvItem = {
	["j_scrap_metals"] = 4,
	["j_scrap_elecs"] = 2
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Tech"] = true,
		["Road"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 14,
}