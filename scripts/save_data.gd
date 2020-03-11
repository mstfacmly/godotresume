extends 'res://scripts/sheet.gd'

func save_data():
	var save_data = File.new()
	save_data.open('res://savegame.save', File.WRITE)
	
	var SaveNodes = get_tree().get_nodes_in_group('saveData')
	for i in SaveNodes:
		i.call('save')
	
	save_data.store_line(to_json(Global.dict))
	save_data.close()
