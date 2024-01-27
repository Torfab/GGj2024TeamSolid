extends Node2D

@onready var animationWeapon=$AnimationWeapon

# Called when the node enters the scene tree for the first time.
func _ready():
	animationWeapon.play("idle")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
