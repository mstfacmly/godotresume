extends Node

#export var MORALITY = 7
onready var sheet = get_node('/root/base')

func save():
	var data = { get_node('label').get_text() : sheet.MORAL }

func _ready():
	add_to_group('saveData')
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
