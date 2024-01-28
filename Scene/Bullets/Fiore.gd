extends CharacterBody2D

var direzione
var velocita = 800
var maxDistance = 10
var shooter

func _process(delta):
	pass

func _physics_process(_delta):
	velocity = direzione*velocita
	move_and_slide()
	maxDistance -=  1
	if(maxDistance<0):
		queue_free()


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Giocatore") && !body.is_in_group("P"+str(shooter))):
		global.punteggio[shooter-1] += global.sistemaPunti["Torta"] + randi_range(0,10)
		queue_free()
	pass # Replace with function body.
