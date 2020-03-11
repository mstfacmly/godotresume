#extends 'res://scripts/sheet.gd'
extends Node

onready var val = int(get_text())
onready var sheet = get_node('/root/base')

#func _text_changed():
#	emit_signal('text_changed')

func _ready():
	connect('text_entered', sheet, 'updt_size')
	connect('focus_exited', sheet, 'updt_size')