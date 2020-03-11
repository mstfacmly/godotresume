extends 'res://scripts/DotCount.gd'

var values = { 
	'INTELLIGENCE' : 3,
	'WITS' : 4,
	'RESOLVE' : 3,
	'STRENGTH' : 3,
	'DEXTERITY' : 3,
	'STAMINA' : 2,
	'PRESENCE' : 2,
	'CHARISMA' : 3,
	'COMPOSURE' : 3
	}

func save():
#	if !Global.dict['attributes'].has(get_name()):
	Global.dict['attributes'][get_name()] = {'value' : value}
	"""
	elif Global.dict['attributes'].has(get_name()): 
		if Global.dict['attributes'][get_name()]['value'] == value:
			Global.dict['attributes'][get_name()]['value'] = value
		else:
			Global.dict['attributes'][get_name()]['value'] += value
#	sheet.call('save_data')"""

func load_data():
	var saved_data = File.new()
	if !saved_data.file_exists('res://savegame.save'):
		value = 1
		return # No save file to load!
	else:
		pass
	saved_data.open('res://savegame.save', File.READ )
	var load_data = parse_json(saved_data.get_line())
	for i in load_data['attributes']:
		if saved_data.eof_reached():
			break
		for v in load_data['attributes'][i]:
#			load_data['attributes'][i][v] = value = set(v,load_data['attributes'][i][v])
			value = load_data['attributes'][i][v]
			set_pressed(value)
#			load_pressed(i, value)

func _ready():
#	load_data()
	set_pressed(values.get(name))
	$label.set_text(self.name.capitalize())
