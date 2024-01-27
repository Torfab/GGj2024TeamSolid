extends Node2D

func _on_players_selected(args):
	global.giocatori = args
	get_tree().change_scene_to_file("res://livelli/Livello.tscn")
