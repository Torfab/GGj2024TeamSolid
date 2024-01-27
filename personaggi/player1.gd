extends CharacterBody2D

@export var velocita:float = 400
@export var direzioneIniziale = Vector2(0, 1)

@onready var animationTree = $AnimationTree
@onready var animationMartello = $AnimationMartello


@onready var stato = animationTree.get("parameters/playback")



func _ready():
	update_animation_parameters(direzioneIniziale)
	
func _process(delta):
	if Input.is_action_pressed("P1_attacco"):
		animationMartello.play("attacco_sinistra")
		
		
func _physics_process(_delta):
	var direzione = Vector2(
		Input.get_action_strength("P1_destra") - Input.get_action_strength("P1_sinistra"),
		Input.get_action_strength("P1_giù") - Input.get_action_strength("P1_su")
	)
	update_animation_parameters(direzione)
	velocity = direzione*velocita #Si deve chiamare velocity
	
	move_and_slide()

func update_animation_parameters(move_input :Vector2):
	if(move_input != Vector2.ZERO):
		animationTree.set("parameters/cammina/blend_position", move_input)
		animationTree.set("parameters/fermo/blend_position", move_input)
	setta_stato(move_input)
		
func setta_stato(move_input :Vector2):
	if(move_input != Vector2.ZERO):
		stato.travel("cammina")
	else:
		stato.travel("fermo")
