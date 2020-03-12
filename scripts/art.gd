extends 'res://scripts/skillset.gd'

var skill = [ 'GAME DESIGN',
'3D MODELING',
'3D ANIMATION',
'RIGGING',
'RASTER GRAPHICS',
'VECTOR GRAPHICS',
'VIDEO EDITING' ]

var raster = ['Krita' , 'Adobe Photoshop', 'GIMP']
var vector = ['Inkscape', 'Adobe Illustrator']
var modeling =  ['Blender', '3DS Max']
var animation =  ['Blender', '3DS Max']

func set_skills():
	for i in skill:
		var s = skill_node.instance()
		s.set_name(i)
		$list.add_child(s)
#		$list.get_child(skill.find(i)).get_node('label').set_text(str(i))

func set_specialties():
	for i in skill:
		var skillName = find_node(i).get_child(2)
		for s in get(i):
			skillName.get_popup().add_check_item(s.capitalize())
			skillName.get_popup().set_item_as_checkable(int(s), 1)
			skillName.add_to_group('saveData')

func ready():
	set_specialties()
	$skill/SPECIALTIES.set_text(str('specialties').capitalize())
