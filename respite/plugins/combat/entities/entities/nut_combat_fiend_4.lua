ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (20)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 20
ENT.accu = 20
ENT.craf = 20
ENT.endu = 20
ENT.luck = 20
ENT.perc = 20
ENT.fort = 20

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end