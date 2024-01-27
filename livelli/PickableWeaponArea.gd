extends Node2D

@onready var animationWeapon=$AnimationWeapon

var direction=1
var quantity=1

var weapons=["torta", "fiore", "banana"]
var currentWeapon
# Called when the node enters the scene tree for the first time.
func _ready():
	currentWeapon=weapons[randi_range(0,2)]
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
		body.setWeapon(currentWeapon)
	if body.is_in_group("Giocatore"):
		destroyer()
		
func destroyer():
	global.weaponsInPlay=global.weaponsInPlay-1
	queue_free()
