extends Node2D

signal loaded

const LOADED = 'loaded'

var _path = 'res://savegame.dat'
var _user_data = {}

func load_data(data):
	_user_data['data'] = data
	
	var f = File.new()
	if(not f.file_exists(_path)):
		save_data()
	f.open(_path, File.READ)
	var loaded_data = {}
	loaded_data = parse_json(f.get_as_text())
	_parse_loaded_data(loaded_data)
	f.close

func _parse_loaded_data(loaded_data):
	for key in loaded_data.keys():
		_user_data['data'][key] = loaded_data['data'][key]
	
	emit_signal(LOADED)

func save_corrected_data(corrected_user_data):
	_user_data['data'] = corrected_user_data
	save_data()

func save_data():
	var f = File.new()
	f.open(_path, File.WRITE)
	f.store_string(to_json(_user_data))
	f.close()

func set_data(key,value):
	_user_data['data'][key] = value

func _get_data(key):
	return _user_data['data'][key]