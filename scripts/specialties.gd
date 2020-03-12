extends MenuButton

#signal skillID

onready var sheet = get_node('/root/base')
onready var skillParent = get_parent()
onready var skillset = get_popup()
var checked = []

func set_checked(a):
	if skillset.is_item_checked(a) != true:
		skillset.set_item_checked(a, 1)
		checked.append(a)
	else:
		skillset.set_item_checked(a, 0)
		checked.remove(a)
	
	checked.sort()
	
	if !checked.empty():
		add_stylebox_override('normal', load('res://assets/styleboxes/selectedSpecialty.tres'))
	else:
		add_stylebox_override('normal', load('res://assets/styleboxes/white_dark.tres'))
	
	sheet.call('save_data')

func save():
	pass
#	Global.dict['skills'][skillParent.get_name()] = str(' specialties', checked)

func load_data():
	pass

func _ready():
	get_popup().connect('index_pressed', self, 'set_checked')
	add_stylebox_override('normal', load('res://assets/styleboxes/white_dark.tres'))
