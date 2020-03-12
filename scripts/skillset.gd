extends Node

onready var children = $list.get_children().size()
var checked = []
var skillset
onready var skill_node = preload("res://subElements/skill.tscn")
#var skill = {}

func set_skills():
	for i in children:
		$list.get_child(i).add_to_group('saveData')

func get_skill_id(i):
	skillset = $list.get_child(i).get_node('SPECIALTIES').get_popup()

func _ready():
	$label.set_text(get_name().capitalize())
	set_skills()
	$label.add_font_override('font', load('res://assets/Bold.tres'))
