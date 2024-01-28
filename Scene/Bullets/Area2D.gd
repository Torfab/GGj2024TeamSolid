extends Area2D

@onready var collider = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	# Create and start a timer to enable the collider after one second
	pass
	

func enableHitBox():
	collider.disabled=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
