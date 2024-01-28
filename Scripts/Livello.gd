extends Node2D
var giocatore = preload("res://Scene/player1.tscn")
var armi = {
	"Torta": preload("res://Scene/Bullets/Torta.tscn"),
	"Banana": preload("res://Scene/Bullets/Banana.tscn"),
	"Fiore": preload("res://Scene/Bullets/Torta.tscn")
}
var positioni = [[150, 150], [150, 900], [1700, 150], [1700, 900]]


func _ready():
	if(global.giocatori<3):
		$LabelP3.hide()
	if(global.giocatori<4):	
		$LabelP4.hide()
	
	SignalBus.connect("shoot_special", _shoot_special)
	#global.giocatori = 1
	for i in global.giocatori:
		var player = giocatore.instantiate()
		player.set("nPlayer", i+1)
		player.set("position", Vector2(positioni[i][0], positioni[i][1]))
		add_child(player)

func _shoot_special(player, posizione, direzione, weapon):
	var arma = armi[weapon]
	var istanza = arma.instantiate()
	istanza.position = posizione
	istanza.direzione = direzione
	istanza.shooter = player
	add_child(istanza) 

func _process(delta):
	$LabelP1.text = str(global.punteggio[0])
	$LabelP2.text = str(global.punteggio[1])
	$LabelP3.text = str(global.punteggio[2])
	$LabelP4.text = str(global.punteggio[3])
	var minuti = "0"+str(floori($Timer2.get_time_left() / 60))
	var secondi = "0"+str(roundi($Timer2.get_time_left()) % 60)
	$LabelTimer.text = minuti.right(2)+":"+secondi.right(2)
	


func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://Scene/Fine.tscn")
	pass # Replace with function body.
