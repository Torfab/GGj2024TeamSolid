extends Node2D

@onready var timerRisate= $Timer2

@onready var animation=$AnimationPlayer
@onready var audio=$AudioStreamPlayer2D

var i=1

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("idle")
	animation.speed_scale=1
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_2_timeout():
	var sum=0
	for element in global.punteggio:
		sum=sum+element
	if (sum>i*750):
		i=i+1
		animation.speed_scale=animation.speed_scale*1.5
		audio.play()
	pass # Replace with function body.
