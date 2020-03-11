extends LineEdit

onready var sheet = get_node('/root/base')

func update_text(i):
	text = i
	sheet.call('save_data')

func save():
	Global.dict['backgrounds'][get_name()] = text

func load_data():
	pass

func _ready():
	add_to_group('saveData')
	connect('text_entered', self, 'update_text')
	connect('focus_exited', self, 'save')