extends Resource

export var value = 0

func _on_dot_toggled(button_pressed):
	count(button_pressed)

func count(b):
	if b != false:
		value += 1
	else:
		value -= 1

	hint_tooltip = str(value)

func _ready():
	$label.set_text(self.get_name().capitalize())
