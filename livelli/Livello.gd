extends Node2D
var giocatore = preload("res://personaggi/player1.tscn")
var positioni = [[150, 150], [150, 900], [1700, 150], [1700, 900]]

func _ready():
	#global.giocatori = 1
	for i in global.giocatori:
		var player = giocatore.instantiate()
		player.set("nPlayer", i+1)
		player.set("position", Vector2(positioni[i][0], positioni[i][1]))
		add_child(player)

func _process(delta):
	$LabelP1.set("Text", global.punteggio[0])
	$LabelP2.set("Text", global.punteggio[1])
	$LabelP3.set("Text", global.punteggio[2])
	$LabelP4.set("Text", global.punteggio[3])
