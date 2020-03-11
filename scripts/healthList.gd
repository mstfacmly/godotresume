extends MenuButton

var Damage = [ ' ', '/', '✶X' , '✶✶✶✶✶*' ]
var val = ' '

onready var sheet = get_node('/root/base')

func populate():
	if !get_popup().items :
		for i in Damage:
			get_popup().add_item(i)

func set_text(i):
	val = i
	text = Damage[i]
	save()
	sheet.call('save_data')

func save():
#	SaveDict.dict[sheet.find_node('HEALTH').get_name()] = str(text)
#	var data = text
#	return data
#	print(get_text())
	for i in Damage:
		if !get_text().empty():
			Global.dict['data'][sheet.find_node('HEALTH').get_name() + get_parent().get_name()] = get_text()
		else:
			return

func load_data():
	pass

func _ready():
	populate()
	get_popup().connect('id_pressed', self, 'set_text')
	add_to_group('saveData')
