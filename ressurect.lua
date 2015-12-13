-- Ressurect unit without healing, reset death date.
--Based on full-heal.lua

local utils=require('utils')

validArgs = validArgs or utils.invert({
 'help',
 'unit'
})

local args = utils.processArgs({...}, validArgs)

if args.help then
    print('full-heal: heal a unit completely from anything, optionally including death.')
    print(' full-heal -unit [unitId]')
    print('  heal the unit with the given id')
    print(' full-heal -r -unit [unitId]')
    print('  heal the unit with the given id and bring them back from death if they are dead')
    print(' full-heal')
    print('  heal the currently selected unit')
    print(' full-heal -r')
    print('  heal the currently selected unit and bring them back from death if they are dead')
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
        if unit.flags1.dead then
            --print("Resurrecting...")
            unit.flags2.slaughter = false
            unit.flags3.scuttle = false
        end
        unit.flags1.dead = false
        unit.flags2.killed = false
        unit.flags3.ghostly = false
        --unit.unk_100 = 3

    --print("Refilling blood...")
    unit.body.blood_count=unit.body.blood_max

    --print("Resetting status flags...")
    unit.flags2.has_breaks=false
    unit.flags2.gutted=false
    unit.flags2.circulatory_spray=false
    unit.flags2.vision_good=true
    unit.flags2.vision_damaged=false
    unit.flags2.vision_missing=false
    unit.flags2.breathing_good=true
    unit.flags2.breathing_problem=false

    unit.flags2.calculated_nerves=false
    unit.flags2.calculated_bodyparts=false
    unit.flags2.calculated_insulation=false
    unit.flags3.compute_health=true

    --print("Resetting counters...")
    unit.counters.winded=0
    unit.counters.stunned=0
    unit.counters.unconscious=0
    unit.counters.webbed=0
    unit.counters.pain=0
    unit.counters.nausea=0
    unit.counters.dizziness=0

    unit.counters2.paralysis=0
    unit.counters2.fever=0
    unit.counters2.exhaustion=0
    unit.counters2.hunger_timer=0
    unit.counters2.thirst_timer=0
    unit.counters2.sleepiness_timer=0
    unit.counters2.vomit_timeout=0

    local hist_fig=df.historical_figure.find(unit.hist_figure_id)
    unit.counters.death_id = -1
    hist_fig.died_year = -1
    hist_fig.died_seconds = -1
end

