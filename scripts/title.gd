extends Label

#var title = get_parent().get_node("info/player/name/input").text
var title = 'Moustafa Chamli'

func _ready():
	add_font_override('bold', load('res://assets/Bold.tres'))
	set_text(title)
