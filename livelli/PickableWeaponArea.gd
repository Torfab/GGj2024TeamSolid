extends Node2D

@onready var animationWeapon=$AnimationWeapon

# Called when the node enters the scene tree for the first time.
func _ready():
	animationWeapon.play("idle")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_body_entered(body):
	if body.is_in_group("Giocatore"):
		destroyer()
		
func destroyer():
	global.weaponsInPlay=global.weaponsInPlay-1
	queue_free()
