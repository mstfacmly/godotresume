#extends 'res://scripts/sheet.gd'
extends LineEdit

onready var val = int(get_text())
onready var sheet = get_node('/root/base')

func _text_changed():
	emit_signal('focus_exited')

func _ready():
	connect('text_entered', self, '_text_changed')
	connect('focus_exited', sheet, 'updt_size')
	connect('text_entered', sheet, 'updt_size')
