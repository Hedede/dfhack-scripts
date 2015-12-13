-- Change unit's attributes.
-- author: Hedede
--
local utils=require('utils')

local args={...}

local str = args[1]

if not str then
 qerror('Supply attribute name.')
end

local value = tonumber(args[2])
if not value or value < 1 then
 qerror('Supply a new value.')
end

unit = dfhack.gui.getSelectedUnit()

if not unit then
 qerror('Select a unit.')
end

mental = {"analytical_ability",
          "focus",
          "willpower",
          "creativity",
          "intuition",
          "patience",
          "memory",
          "linguistics",
          "spacial_sense",
          "musicality",
          "kinesthetic_sense",
          "empathy",
          "social_awareness"}

physical = {"strength",
            "agility",
            "toughness",
            "endurance",
            "recuperation",
            "disease_resistance"}

setPhysicalAttrValue = function(unit, id, value)
	if id == 1 then
		unit.body.physical_attrs.STRENGTH.value = value
	elseif id == 2 then
		unit.body.physical_attrs.AGILITY.value = value
	elseif id == 3 then
		unit.body.physical_attrs.TOUGHNESS.value = value
	elseif id == 4 then
		unit.body.physical_attrs.ENDURANCE.value = value
	elseif id == 5 then
		unit.body.physical_attrs.RECUPERATION.value = value
	elseif id == 6 then
		unit.body.physical_attrs.DISEASE_RESISTANCE.value = value
	end
end

setMentalAttrValue = function(unit, id, value)
	if id == 1 then
		unit.status.current_soul.mental_attrs.ANALYTICAL_ABILITY.value = value
	elseif id == 2 then
		unit.status.current_soul.mental_attrs.FOCUS.value = value
	elseif id == 3 then
		unit.status.current_soul.mental_attrs.WILLPOWER.value = value
	elseif id == 4 then
		unit.status.current_soul.mental_attrs.CREATIVITY.value = value
	elseif id == 5 then
		unit.status.current_soul.mental_attrs.INTUITION.value = value
	elseif id == 6 then
		unit.status.current_soul.mental_attrs.PATIENCE.value = value
	elseif id == 7 then
		unit.status.current_soul.mental_attrs.MEMORY.value = value
	elseif id == 8 then
		unit.status.current_soul.mental_attrs.LINGUISTIC_ABILITY.value = value
	elseif id == 9 then
		unit.status.current_soul.mental_attrs.SPATIAL_SENSE.value = value
	elseif id == 10 then
		unit.status.current_soul.mental_attrs.MUSICALITY.value = value
	elseif id == 11 then
		unit.status.current_soul.mental_attrs.KINESTHETIC_SENSE.value = value
	elseif id == 12 then
		unit.status.current_soul.mental_attrs.EMPATHY.value = value
	elseif id == 13 then
		unit.status.current_soul.mental_attrs.SOCIAL_AWARENESS.value = value
	end
end

if (string.lower(str) == "all") then
	for i, name in ipairs(mental) do
		setMentalAttrValue(unit, i, value)
	end

	for i, name in ipairs(physical) do
		setPhysicalAttrValue(unit, i, value)
	end
end

for i, name in ipairs(mental) do
	if string.lower(str) == name then
		setMentalAttrValue(unit, i, value)
		return
	end
end

for i, name in ipairs(physical) do
	if string.lower(str) == name then
		setPhysicalAttrValue(unit, i, value)
		return
	end
end
