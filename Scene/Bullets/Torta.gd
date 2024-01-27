extends CharacterBody2D

var direzione
var velocita = 800
var maxDistance = 30

func _process(delta):
	pass

func _physics_process(_delta):
	velocity = direzione*velocita
	move_and_slide()
	maxDistance -=  1
	if(maxDistance<0):
		queue_free()
