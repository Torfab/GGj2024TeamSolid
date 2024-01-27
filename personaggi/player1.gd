extends CharacterBody2D

@export var velocita:float = 400
@export var direzioneIniziale = Vector2(0, 1)
@export var nPlayer = 0;

@onready var animationTree = $AnimationTree
@onready var animationMartello = $AnimationMartello


@onready var stato = animationTree.get("parameters/playback")

func _ready():
	print("Sono stato instanziato "+str(nPlayer))
	update_animation_parameters(direzioneIniziale)
	
func _process(delta):
	if Input.is_action_pressed("P"+str(nPlayer)+"_attacco"):
		#Codice
		print("attacca")
	pass
		
		
func _physics_process(_delta):
	var direzione = Vector2(
		Input.get_action_strength("P"+str(nPlayer)+"_destra") - Input.get_action_strength("P"+str(nPlayer)+"_sinistra"),
		Input.get_action_strength("P"+str(nPlayer)+"_giù") - Input.get_action_strength("P"+str(nPlayer)+"_su")
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
