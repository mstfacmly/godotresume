extends Node

# Name Variables
#const GAMENAME = 'chronicles of darkness'
onready var GAMENAME = $scroll/margin/org/info/player/name/input.text
const MORALNAME = 'integrity'
const ENERGYNAME = 'energy'

# Set variables
var SPEED = 0
var HEALTH = 0
var WP = 0
export var SIZE = 5
export var MORAL = 7
export var ENERGY = 1
var INIT = 0
var DEF = 0
var size = SIZE
var moralArr = []
var newXP
var total_spent

# Get values for calculations
onready var attr = find_node('ATTRIBUTES')
onready var skills = find_node('SKILLS')
onready var stre = find_node('STRENGTH')
onready var dex = find_node('DEXTERITY')
onready var stam = find_node('STAMINA')
onready var resolve = find_node('RESOLVE')
onready var wits = find_node('WITS')
onready var comp = find_node('COMPOSURE')
onready var health = find_node('HEALTH')
onready var wp = find_node('WILLPOWER')
onready var size_node = find_node('SIZE')
onready var moral = find_node('MORAL')
onready var speed = find_node('SPEED')
onready var def = find_node('DEFENSE')
onready var init = find_node('INIT')
onready var armor = find_node('ARMOR')
onready var athl = find_node('ATHLETICS')
onready var xp = find_node('EXPERIENCE')
onready var gameXP# = xp.get_node('game/input')
onready var totalXP# = xp.get_node('game/total')
onready var spentXP# = xp.get_node('info/spent')
onready var availXP = xp.get_node('info/avail')

func calcs():
	calc_speed()
	calc_health()
	calc_wp()
	calc_def()
	calc_init()

func spend_xp(n):
	var xp_cost
	
	## New World of Darkness costs
	var attrCost = n.value * 5
	var skillCost = n.value * 3
	var skillSpecCost = 3
	var meritCost = n.value * 2
	var moralCost = n.value * 3
	var wpCost = 0
	"""
	## Chronicles of Darkness/GodMachine costs
	var attrCost = 4
	var skillCost = 2
	var skillSpecCost = 1
	var meritCost = 1
	var moralCost = 3
	var wpCost = 1
	"""
	if n.get_parent().get_parent().get_name() == 'ATTRIBUTES':
		xp_cost = attrCost
		if xp_cost <= int(availXP.text):
			calc_spend(xp_cost)
		else:
			pass
	elif n.get_node('../../..').get_name() == 'SKILLS':
		xp_cost = skillCost
		if xp_cost <= int(availXP.text):
			calc_spend(xp_cost)
		else:
			pass
	elif n.get_node('../..').get_name() == 'MERITS':
		#print('value from sheet : ', n.value)
		xp_cost = meritCost
		if xp_cost <= int(availXP.text):
			calc_spend(xp_cost)
		else:
			pass
	elif n.get_node('../../..').get_name() == 'MORAL':
		xp_cost = moralCost
		if xp_cost <= int(availXP.text):
			calc_spend(xp_cost) 
		else:
			pass
	elif n.get_child(1):
		xp_cost = skillSpecCost
		if xp_cost <= int(availXP.text):
			calc_spend(xp_cost)
		else:
			pass
	else:
		print(n.get_name())

func calc_xp(xp):
#	print(xp)
	newXP = int(totalXP.text) + int(xp)
	totalXP.text = str(newXP)
	availXP.text = str(int(availXP.text) + int(xp))
	gameXP.clear()
	gameXP.set_text('0')
	
func calc_spend(xp):
	availXP.text = str(int(availXP.text) - xp)
	spentXP.text = str(int(xp) + int(spentXP.text))

func calc_speed():
	SPEED = stre.value + dex.value + size
	speed.get_node('input').set_text(str(SPEED))

func calc_health():
	HEALTH = stam.value + size
	updt_health()

func calc_wp():
	WP = resolve.value + comp.value
	updt_wp()

func calc_def():
	DEF = min(wits.value , resolve.value)# + athl.value
	def.get_node('input').set_text(str(DEF))
	
func calc_init():
	INIT = dex.value + comp.value
	init.get_node('input').set_text(str(INIT))

func _text_changed(new_text):
	updt_size()
	calcs()

func updt_size():
	var size_text = size_node.get_node('input').get_text() 
	
	if !size_text.empty():
		size = int(size_text)
	else:
		size = SIZE
	
	calc_health()

func updt_health():
	var health_dot = health.get_node('values')
	var health_ch = health_dot.get_children().size()
	
	for i in range(health_ch):
		health_dot.get_child(i).get_node('dot').pressed = true
		health_dot.get_child(i).get_node('dot').disabled = true
		health_dot.get_child(i).get_node('box').disabled = true
	
	for i in range(HEALTH):
		health_dot.get_child(i).get_node('dot').disabled = false
		health_dot.get_child(i).get_node('box').disabled = false

func updt_wp():
	var wp_dot = wp.get_node('values')
	var wp_ch = wp_dot.get_children().size()
	
	for i in range(wp_ch):
		wp_dot.get_child(i).get_node('dot').pressed = true
		wp_dot.get_child(i).get_node('dot').disabled = false
		wp_dot.get_child(i).get_node('check').disabled = true

	for i in range(WP):
		wp_dot.get_child(i).get_node('dot').disabled = false
		wp_dot.get_child(i).get_node('dot').pressed = false
		wp_dot.get_child(i).get_node('check').disabled = false

func set_moral():
	var moral_dot = moral.get_node('values')
	var moral_dotV = moral.get_node('valuesVert')
	var moral_ch = moral_dot.get_children().size()
	var moralArrInv = []
	
	for i in range(moral_ch):
		moral_dot.get_child(i).set_pressed(1)
		moral_dotV.get_child(i).get_node('dot').set_pressed(1)
		moralArr.append(i)
		moralArrInv.append(i)
	
	moralArrInv.invert()
	
	for i in range(moral_ch):
		moral_dotV.get_child(i).get_node('label').set_text(str(moralArrInv[i]+1))
	
	for i in range(MORAL):
		moral_dot.get_child(moralArr[i]).set_pressed(0)
		moral_dotV.get_child(moralArrInv[i]).get_node('dot').set_pressed(0)
"""
func save():
	var List = [ 'mental', 'physical', 'social']
	var Global = []
	for l in List.size():
		for i in $scroll/margin/org/advantages/SKILLS.get_node(List[l]).get(List[l]):
			Global.append(i)
	Global.sort()
	return Global
"""
"""
func save_data():
	var save_data = File.new()
	save_data.open('res://savegame.save', File.WRITE)
	
	var SaveNodes = get_tree().get_nodes_in_group('saveData')
	for i in SaveNodes:
		i.call('save')
	
	save_data.store_line(to_json(Global.dict))
	save_data.close()
"""
func load_data():
	var saved_data = File.new()
	if !saved_data.file_exists('res://savegame.save'):
		print('no sheet data to load! skipping...')
		return # No save file to load!
	saved_data.open('res://savegame.save', File.READ )
	var SaveNodes = get_tree().get_nodes_in_group('saveData')
	for i in SaveNodes:
		i.call('load_data')

	saved_data.close()

func _ready():	
	if OS.get_name()=="HTML5":
		OS.set_window_maximized(1)
		
	load_data()
#	calcs()
	set_moral()

	$scroll/margin/org/title.set_text(GAMENAME.capitalize())
#	gameXP.connect('text_entered', self, 'calc_xp')
