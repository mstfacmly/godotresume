extends MenuButton

signal skillID

onready var sheet = get_node('root/base')
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
	
	save()

func save():
	var specialty = { skillParent.get_name() + ' specialties' : checked }
	print(specialty)
	sheet.call('save_data')

func _ready():
	get_popup().connect('index_pressed', self, 'set_checked')
	add_stylebox_override('normal', load('res://assets/styleboxes/white_dark.tres'))
	PhysicsServer.set_active(false)
	Physics2DServer.set_active(false)
