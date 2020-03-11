extends "res://scripts/base.gd"


func _ready():
	$label.set_text(get_name().capitalize())
