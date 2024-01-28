extends Node2D

@onready var p1=$P1
@onready var treno=$AnimationPlayer

@onready var giocatori = [
	preload("res://assets/player1.png"),
	preload("res://assets/player2.png"),
	preload("res://assets/player3.png"),
	preload("res://assets/player4.png")
]

func _init():
	pass
func _ready():
	treno.play("idle")
	var winner = global.punteggio.find(global.punteggio.max())
	p1.set("texture", giocatori[winner])
