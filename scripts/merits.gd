extends Node

onready var children = $list.get_children().size()
var meritset
onready var merit_node = preload("res://subElements/merit.tscn")

func set_merits():
	for i in children:
		$list.get_child(i).add_to_group('saveData')

func get_merits_id(i):
	meritset = $list.get_child(i).get_node('SPECIALTIES').get_popup()

func _ready():
	$label.set_text(get_name().capitalize())
	set_merits()
	$label.add_font_override('font', load('res://assets/Bold.tres'))
