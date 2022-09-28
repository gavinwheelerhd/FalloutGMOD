ATTRIBUTE.name = "Agility"
ATTRIBUTE.desc = "Character's swiftness and balance. A measure of speed and finesse."

function ATTRIBUTE:onSetup(client, value)
	client:SetRunSpeed(nut.config.get("runSpeed") + value)
end
