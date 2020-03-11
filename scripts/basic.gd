extends Node


func _ready():
	$label.set_text(get_name().capitalize())
