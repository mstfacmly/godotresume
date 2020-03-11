extends 'res://scripts/skillset.gd'
var skill = ['POLYGLOT','COSPLAYER','BIKE MECHANIC', 'COMPUTER TECH']

var polyglot = [ 'arabic','english','french','italian','spanish' ]

func set_skills():
	for i in skill:
		var s = skill_node.instance()
		s.set_name(str(i))
		$list.add_child(s)
#		$list.get_child(skill.find(i)).get_node('label').set_text(str(i).capitalize())

func set_specialties():
	for i in skill:
		var skillName = find_node(i).get_child(2)
		for s in get(i):
			skillName.get_popup().add_check_item(s.capitalize())
#			skillName.get_popup().set_item_as_checkable(int(s), 1)
#			skillName.add_to_group('saveData')

func ready():
	set_specialties()
	$skill/SPECIALTIES.set_text(str('specialties').capitalize())
