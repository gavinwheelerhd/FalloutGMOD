ITEM.name = "Telephone"
ITEM.uniqueID = "j_telephone"
ITEM.model = "models/props_trainstation/payphone_reciever001a.mdl"
ITEM.desc = "An old telephone."
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_elecs"] = 1,
	["j_scrap_plastics"] = 1
}

if(SERVER) then
	ITEM.loot = {
		["Junk"] = true,
		["Tech"] = true,
	}
end

ITEM.iconCam = {
	pos = Vector(7, 200, 18),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}