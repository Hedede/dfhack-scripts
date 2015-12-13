-- List unit's attributes. Select unit in UI or pass -unit argument.
-- author: Hedede

local utils=require('utils')

validArgs = validArgs or utils.invert({
 'help',
 'unit'
})

local args = utils.processArgs({...}, validArgs)

if args.help then
    print('view-attr: list unit attributes.')
    print(' view-attr -unit [unitId]')
    print('  view the unit with the given id')
    print(' view-attr -help')
    print('  print this help message')
  return
end

if(args.unit) then
	unit = df.unit.find(args.unit)
else
	unit = dfhack.gui.getSelectedUnit()
end

if not unit then
 qerror('Error: please select a unit in UI or pass unit id with -unit.')
end

mental = {"Analytical Ability",
          "Focus",
          "Willpower",
          "Creativity",
          "Intuition",
          "Patience",
          "Memory",
          "Linguistics",
          "Spacial Sense",
          "Musicality",
          "Kinesthetic Sense",
          "Empathy",
          "Social Awareness"}

physical = {"Strength",
            "Agility",
            "Toughness",
            "Endurance",
            "Recuperation",
            "Disease Resistance"}

getPhysicalAttrValue = function(unit, id)
	if id == 1 then
		return unit.body.physical_attrs.STRENGTH.value
	elseif id == 2 then
		return unit.body.physical_attrs.AGILITY.value
	elseif id == 3 then
		return unit.body.physical_attrs.TOUGHNESS.value
	elseif id == 4 then
		return unit.body.physical_attrs.ENDURANCE.value
	elseif id == 5 then
		return unit.body.physical_attrs.RECUPERATION.value
	elseif id == 6 then
		return unit.body.physical_attrs.DISEASE_RESISTANCE.value
	end
end

getMentalAttrValue = function(unit, id)
	if id == 1 then
		return unit.status.current_soul.mental_attrs.ANALYTICAL_ABILITY.value
	elseif id == 2 then
		return unit.status.current_soul.mental_attrs.FOCUS.value
	elseif id == 3 then
		return unit.status.current_soul.mental_attrs.WILLPOWER.value
	elseif id == 4 then
		return unit.status.current_soul.mental_attrs.CREATIVITY.value
	elseif id == 5 then
		return unit.status.current_soul.mental_attrs.INTUITION.value
	elseif id == 6 then
		return unit.status.current_soul.mental_attrs.PATIENCE.value
	elseif id == 7 then
		return unit.status.current_soul.mental_attrs.MEMORY.value
	elseif id == 8 then
		return unit.status.current_soul.mental_attrs.LINGUISTIC_ABILITY.value
	elseif id == 9 then
		return unit.status.current_soul.mental_attrs.SPATIAL_SENSE.value
	elseif id == 10 then
		return unit.status.current_soul.mental_attrs.MUSICALITY.value
	elseif id == 11 then
		return unit.status.current_soul.mental_attrs.KINESTHETIC_SENSE.value
	elseif id == 12 then
		return unit.status.current_soul.mental_attrs.EMPATHY.value
	elseif id == 13 then
		return unit.status.current_soul.mental_attrs.SOCIAL_AWARENESS.value
	end
end


pad = function(str, len)
	return str .. string.rep(' ', len - #str)
end

for i, name in ipairs(mental) do
	val = getMentalAttrValue(unit, i)
	print(pad(name,20) .. ": " .. tostring(val))
end

for i, name in ipairs(physical) do
	val = getPhysicalAttrValue(unit, i)
	print(pad(name,20) .. ": " .. tostring(val))
end
