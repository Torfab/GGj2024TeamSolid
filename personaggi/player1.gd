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
@export var action_muovi_destra = ""
@export var action_muovi_sinistra = ""
@export var action_muovi_su = ""
@export var action_muovi_giu = ""
@export var action_attacca = ""
	
@onready var animationTree = $AnimationTree
@onready var animationMartello = $AnimationMartello
@onready var sprite = $Sprite2D


@onready var stato = animationTree.get("parameters/playback")



func _ready():
	action_muovi_destra = "P"+str(nPlayer)+"_destra"
	action_muovi_sinistra = "P"+str(nPlayer)+"_sinistra"
	action_muovi_su = "P"+str(nPlayer)+"_su"
	action_muovi_giu = "P"+str(nPlayer)+"_giù"
	action_attacca = "P"+str(nPlayer)+"_attacca"
	sprite.texture = playerSprites[nPlayer-1]
	
	update_animation_parameters(direzioneIniziale)
	
func _process(delta):
	if Input.is_action_pressed(action_attacca):
		#Codice
		print("attacca")
	pass
		
		
func _physics_process(_delta):
	var direzione = Vector2(
		Input.get_action_strength(action_muovi_destra) - Input.get_action_strength(action_muovi_sinistra),
		Input.get_action_strength(action_muovi_giu) - Input.get_action_strength(action_muovi_su)
	)
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
