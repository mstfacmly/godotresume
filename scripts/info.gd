extends BoxContainer

onready var sheet = get_node('/root/base')

var text_input

func new_text(x):
#	text_input = x
	sheet.call('save_data')

func save():
	Global.dict['info'][get_name()] = $input.text

func load_data():
	pass

func _ready():
	$input.connect('text_entered', self , 'new_text')
	$input.connect('focus_exited', sheet, 'save_data')
	add_to_group('saveData')
