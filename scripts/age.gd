extends HBoxContainer

var bday = {"year":1984,"month":04,"day":11}

func calc_age():
	var today = OS.get_unix_time()
	var bday_unix = OS.get_unix_time_from_datetime(bday)
	var age = floor((today - bday_unix) / 31557600 )# 364.2422)
	
#	print('today: ',today)
#	print('bday_unix: ',bday_unix)
	
	$input.set_text(str(age))

func _ready():
	$label.set_text("Age : ")
	calc_age()
