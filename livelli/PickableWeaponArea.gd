extends Node2D

@onready var animationWeapon=$AnimationWeapon
@onready var sprite2D=$SpriteTorta2D

var direction=1
var quantity=1

var weaponPosition=-1

var weaponSprites = [
	preload("res://assets/Torta.png"),
	preload("res://assets/Fiore.png"),
	preload("res://assets/Banana.png"),
]

var weapons=["Torta", "Fiore", "Banana"]
var currentWeapon
# Called when the node enters the scene tree for the first time.
func _ready():
	if(weaponPosition==-1):
		weaponPosition=randi_range(0,2)
	currentWeapon=weapons[weaponPosition]
	sprite2D.texture=weaponSprites[weaponPosition]
	animationWeapon.play("idle")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(quantity%10==0):
		position.y += direction
	if(quantity==30):
		quantity=1
		direction=direction*-1
	quantity=quantity+1
	pass
	


func _on_body_entered(body):
	if (body.has_method("setWeapon")):
		body.setWeapon(weaponPosition)
	if body.is_in_group("Giocatore"):
		destroyer()
		
func destroyer():
	global.weaponsInPlay=global.weaponsInPlay-1
	queue_free()
