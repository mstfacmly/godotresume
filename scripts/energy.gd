extends Node

onready var sheet = get_node('/root/base')
onready var chks = get_node('values/0').get_child_count()

func set_energy():
	for i in sheet.ENERGY:
		for c in chks:
			get_node('values').get_child(i).get_child(c).disabled = 0

func _ready():
	set_energy()
	$label.set_text(sheet.ENERGYNAME.capitalize())