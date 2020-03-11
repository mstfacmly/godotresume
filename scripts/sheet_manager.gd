extends Node2D

var _default_user_data = {
	}.clear()

func _ready():
	data_manager.connect(data_manager.LOADED, self, 'init')
	data_manager.load_data(_default_user_data)
	
func _user_data_version_mismatch(loaded_version, loaded_data):
	init()
	
func init():
	print('INIT')