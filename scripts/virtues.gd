extends "res://scripts/VirtsNVices.gd"

var values = [ 'Charity', 'Faith', 'Fortitude', 'Hope', 'Justice', 'Prudence', 'Temperance' ]

func set_values():
	if !get_popup().items :
		for i in values:
			get_popup().add_item(i)

func _ready():
	set_values()
