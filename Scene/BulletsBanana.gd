extends Node2D

var direzione
var shooter
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	# Create and start a timer to enable the collider after one second
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Giocatore"):
		if (!body.is_in_group("P"+str(shooter))):
			global.punteggio[shooter-1] += global.sistemaPunti["Torta"] + randi_range(0,10)
		queue_free()
	pass # Replace with function body.
