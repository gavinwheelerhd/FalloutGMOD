ITEM.name = "Empty Vegetable Oil Container"
ITEM.uniqueID = "j_empty_vegetable_oil"
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl"
ITEM.desc = "An empty plastic container that smells like vegetable oil.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.fillable = true

ITEM.salvItem = {
	["j_scrap_plastics"] = 2
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