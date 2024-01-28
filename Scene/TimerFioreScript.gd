extends Timer

var theStart = false
var current = 0 
var weapon



func _process(_delta):
	pass


func _on_timeout():
	current +=1
	
	if(current == 20):
		current = 0
		theStart = false
		stop()
	else:
		get_parent().spawnAcqua()
		start(0.05)
	print(current)
	pass # Replace with function body.
