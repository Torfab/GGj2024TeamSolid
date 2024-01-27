extends Node2D
var giocatore = preload("res://personaggi/player1.tscn")
var positioni = [[200, 200], [200, 600], [600, 200], [600, 600]]

func _ready():
	#global.giocatori = 1
	for i in global.giocatori:
		var player = giocatore.instantiate()
		player.set("nPlayer", i+1)
		player.set("position", Vector2(positioni[i][0], positioni[i][1]))
		add_child(player)
