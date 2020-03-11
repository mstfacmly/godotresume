extends "res://scripts/sheet.gd"

onready var health_dot = get_node('values')
onready var health_ch = get_node('values').get_children().size()
onready var a = funcref(self, 'calc_health')

func calc_health():
	HEALTH = stam.value + size
	updt_health()

func updt_health():
	for i in range(health_ch):
		health_dot.get_child(i).get_node('dot').set_pressed(0)
		
	for i in range(HEALTH):
		health_dot.get_child(i).get_node('dot').set_pressed(1)

func _ready():
	calc_health()