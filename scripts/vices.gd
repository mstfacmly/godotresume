extends "res://scripts/VirtsNVices.gd"

var values = [ 'Envy', 'Gluttony', 'Greed', 'Lust', 'Pride', 'Sloth', 'Wrath' ]

func set_values():
	if !get_popup().items :
		for i in values:
			get_popup().add_item(i)

func _ready():
	set_values()
