extends 'res://scripts/skillset.gd'

var skill = [ 'HTML & CSS', 'MARKDOWN', 'PYTHON', 'GDSCRIPT', 'GIT VCS', 'SOFTWARE TESTING']

func set_skills():
	for i in skill:
		var s = skill_node.instance()
		s.set_name(str(i))
		$list.add_child(s)
#		$list.get_child(skill.find(i)).get_node('label').set_text(str(i))

func set_specialties():
	for i in skill:
		var skillName = find_node(i).get_child(2)
		for s in get(i):
			skillName.get_popup().add_check_item(s.capitalize())
#			skillName.get_popup().set_item_as_checkable(int(s), 1)
#			skillName.add_to_group('saveData')

func ready():
	$skill/SPECIALTIES.set_text(str('specialties').capitalize())
#	print(get_name())
#	set_specialties()
