extends Node2D
var giocatore = preload("res://personaggi/player1.tscn")

func _ready():
	var giocatori = []
	for i in global.giocatori:
		print("Instanzio " + str(i+1) + " giocatori")
		giocatori.append(giocatore.instantiate())
		giocatori[i].set("nPlayer", i+1)
		add_child(giocatori[i])
		print(giocatori)
