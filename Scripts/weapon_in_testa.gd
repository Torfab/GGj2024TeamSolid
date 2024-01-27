extends Node2D


var weaponSprites = [
	preload("res://assets/Torta.png"),
	preload("res://assets/Fiore.png"),
	preload("res://assets/Banana.png"),
]

@onready var sprite= $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture=weaponSprites[0]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
