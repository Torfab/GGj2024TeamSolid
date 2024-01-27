extends CharacterBody2D
var playerSprites = [
	preload("res://assets/player1.png"),
	preload("res://assets/player2.png"),
	preload("res://assets/player3.png"),
	preload("res://assets/player4.png")
]
@export var velocita:float = 400
@export var direzioneIniziale = Vector2(0, 1)

var nPlayer;
var last_direzione;

@export var action_muovi_destra = ""
@export var action_muovi_sinistra = ""
@export var action_muovi_su = ""
@export var action_muovi_giu = ""
@export var action_attacca = ""
	
@onready var animationTree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var martelloHitNorth = $AreaCollisionMartello/CollisionNorth
@onready var martelloHitSouth = $AreaCollisionMartello/CollisionSouth
@onready var martelloHitWest = $AreaCollisionMartello/CollisionWest
@onready var martelloHitEast = $AreaCollisionMartello/CollisionEast


@onready var stato = animationTree.get("parameters/playback")



func _ready():
	action_muovi_destra = "P"+str(nPlayer)+"_destra"
	action_muovi_sinistra = "P"+str(nPlayer)+"_sinistra"
	action_muovi_su = "P"+str(nPlayer)+"_su"
	action_muovi_giu = "P"+str(nPlayer)+"_giù"
	action_attacca = "P"+str(nPlayer)+"_attacco"
	sprite.texture = playerSprites[nPlayer-1]
	
	update_animation_parameters(direzioneIniziale)
	
func _process(delta):
	if Input.is_action_pressed(action_attacca):
		if(last_direzione == Vector2(1,0)):
			martelloHitEast.disabled = false
		else:
			if(last_direzione == Vector2(-1,0)):
				martelloHitWest.disabled = false
			else:
				if(last_direzione == Vector2(0,1)):
					martelloHitSouth.disabled = false
				else:
					if(last_direzione == Vector2(0,-1)):
						martelloHitNorth.disabled = false
	else:
		martelloHitNorth.disabled = true
		martelloHitSouth.disabled = true
		martelloHitWest.disabled = true
		martelloHitEast.disabled = true
		
		
func _physics_process(_delta):
	var direzione = Vector2(
		Input.get_action_strength(action_muovi_destra) - Input.get_action_strength(action_muovi_sinistra),
		Input.get_action_strength(action_muovi_giu) - Input.get_action_strength(action_muovi_su)
	)
	if(direzione != Vector2.ZERO):
		last_direzione = direzione
	update_animation_parameters(direzione)
	velocity = direzione*velocita #Si deve chiamare velocity
	
	move_and_slide()

func update_animation_parameters(direzione :Vector2):
	if(direzione != Vector2.ZERO):
		animationTree.set("parameters/cammina/blend_position", direzione)
		animationTree.set("parameters/fermo/blend_position", direzione)
	setta_stato(direzione)
		
func setta_stato(direzione :Vector2):
	if(direzione != Vector2.ZERO):
		stato.travel("cammina")
	else:
		stato.travel("fermo")
		
func setWeapon(weapon):
	print("ho una " + weapon)


func _on_area_collision_martello_body_entered(body):
	if(body.is_in_group("Giocatore")):
		global.punteggio[nPlayer-1]+= global.sistemaPunti["martello"] + randi_range(0,5)
		print(global.punteggio)
		print("Colpito!")
