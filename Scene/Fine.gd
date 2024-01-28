extends Node2D

@onready var p1=$P1

@onready var giocatori = [
	preload("res://assets/P1_faccia.png"),
	preload("res://assets/P2_faccia.png"),
	preload("res://assets/P3_faccia.png"),
	preload("res://assets/P4_faccia.png")
]

func _init():
	pass
func _ready():
	var winner = global.punteggio.find(global.punteggio.max())
	print()
	p1.set("texture", giocatori[winner])
