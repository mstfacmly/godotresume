extends Node

# Variable stats
var SPEED = 0
var HEALTH = 0
var WP = 0
export var SIZE = 5
var INIT = 0
var DEF = 0

# Get values for calculations
onready var attr = $'/root/base/margin/org/attributes'
onready var stre = attr.get_node('physical/STRENGTH')
onready var dex = attr.get_node('physical/DEXTERITY')
onready var stam = attr.get_node('physical/STAMINA')
onready var resolve = attr.get_node('mental/RESOLVE')
onready var wits = $margin/org/attributes/mental/WITS
onready var comp = $margin/org/attributes/social/COMPOSURE
onready var size_node = $margin/org/advantages/traits/traits/backgrounds/other/size
onready var size = SIZE
onready var health = $margin/org/advantages/traits/traits/life/health
onready var wp = $margin/org/advantages/traits/traits/life/willpower
onready var speed = $margin/org/advantages/traits/traits/backgrounds/other/spd
onready var def = $margin/org/advantages/traits/traits/backgrounds/other/def
onready var init = $margin/org/advantages/traits/traits/backgrounds/other/init
onready var athl = $margin/org/advantages/skills/physical/list/ATHLETICS
