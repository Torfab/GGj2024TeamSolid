extends Node2D
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
	$P1.set("Texture", giocatori[winner])
	print(winner)
