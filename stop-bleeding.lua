-- Stop unit from bleeding and refill blood.
-- Based on full-heal.lua

local utils=require('utils')

validArgs = validArgs or utils.invert({
 'help',
 'unit'
})

local args = utils.processArgs({...}, validArgs)

if args.help then
    print('full-heal: heal a unit completely from anything, optionally including death.')
    print(' full-heal')
    print('  heal the currently selected unit')
    print(' full-heal -unit [unitId]')
    print('  heal the unit with the given id')
    print(' full-heal -help')
    print('  print this help message')
  return
end

if(args.unit) then
	unit = df.unit.find(args.unit)
else
	unit = dfhack.gui.getSelectedUnit()
end

if not unit then
 qerror('Error: please select a unit or pass its id as an argument.')
end

if unit then
    for i,w in ipairs(unit.body.wounds) do
	    for j,p in ipairs(w.parts) do
		    p.bleeding = 0
	    end
    end
    unit.body.blood_count=unit.body.blood_max
end
