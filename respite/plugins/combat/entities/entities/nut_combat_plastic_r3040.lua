ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (Random) (30-40)"
ENT.Category = "NutScript - Combat (Plastic)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"

ENT.model = "models/player/group01/male_04.mdl"
ENT.material = "phoenix_storms/mrref2"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pistol"] = 20,
}

ENT.hp = 200
ENT.armor = 50

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()

	self.attribs.stm = math.random(30,40)
	self.attribs.str = math.random(30,40)
	self.attribs.accuracy = math.random(30,40)
	self.attribs["end"] = math.random(30,40)
	self.attribs.luck = math.random(30,40)
	self.attribs.perception = math.random(30,40)
	self.attribs.fortitude = math.random(30,40)
	
	--[[
	self:SetModel(table.Random(nut.faction.indices[FACTION_PLASTIC].models))
	
	for k, v in pairs(self:GetBodyGroups()) do
		self:SetBodygroup(v.id, math.random(0, v.num))
	end
	--]]
end