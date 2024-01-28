extends Node2D

@onready var timer =$Timer
@onready var timer2 =$Timer2

@onready var sprite=$AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var default_animation_speed = randi_range(1,5)
	sprite.speed_scale = default_animation_speed
	sprite.modulate = Color(randf(),randf(),randf(),1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.play()



func _on_timer_timeout():
	print("inizio funzione")
	sprite.stop()
	sprite.play('laugh')
	print("Guarda quanto faccio ridere")



func _on_timer_2_timeout():
	print("inizio funzione dos")
	sprite.stop()
