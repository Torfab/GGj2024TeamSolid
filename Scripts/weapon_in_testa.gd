extends Node2D


var weaponSprites = [
	preload("res://assets/Torta.png"),
	preload("res://assets/Fiore.png"),
	preload("res://assets/Banana.png"),
]

@onready var sprite= $Sprite

var currentWeapon="None"
# Called when the node enters the scene tree for the first time.
func _ready():
	if(currentWeapon!="None"):
		sprite.texture=weaponSprites[global.weapons.find(currentWeapon)]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
