extends 'res://scripts/DotCount.gd'

var values = { 
	'GAME DESIGN' : 4,
	'3D MODELING': 4,
	'3D ANIMATION': 3,
	'RIGGING': 4,
	'RASTER GRAPHICS': 4,
	'VECTOR GRAPHICS': 3,
	'VIDEO EDITING' : 3,
	'HTML & CSS': 4,
	'MARKDOWN': 5, 
	'PYTHON': 3, 
	'GDSCRIPT': 4, 
	'GIT VCS': 3,
	'SOFTWARE TESTING': 3,
	'POLYGLOT':3,
	'COSPLAYER': 2,
	'BIKE MECHANIC': 3,
	'COMPUTER TECH': 4
	}

func save():
#	if !Global.dict['skills'].has(get_name()):
	Global.dict['skills'][get_name()] = { 'value' : value, 'specialties' : $SPECIALTIES.checked }
	"""
	elif Global.dict['skills'].has(get_name()):
		Global.dict['skills'][get_name()]['value'] += value
		Global.dict['skills'][get_name()]['specialties'] += $SPECIALTIES.checked"""
	
func load_data():
	var saved_data = File.new()
	if !saved_data.file_exists('res://savegame.save'):
		value = 0
		return # No save file to load!
	else:
		pass
	saved_data.open('res://savegame.save', File.READ )
	var load_data = parse_json(saved_data.get_line())
	for i in load_data['skills']:
		if saved_data.eof_reached():
			break
		for v in load_data['skills'][i]:
#			print(load_data['skills'][i]['value'])
			value = load_data['skills'][i]['value']
			set_pressed(value)

func _ready():
	$label.set_text(self.name.capitalize())
	set_pressed(values.get(name))
