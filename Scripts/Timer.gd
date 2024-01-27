extends Timer

var spawnweapon = preload("res://Scene/pickableWeapon.tscn")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	if(global.weaponsInPlay<global.weaponsMax):
		var obj = spawnweapon.instantiate()
		add_child(obj)
		obj.position= Vector2(randi_range(-900, 900),randi_range(-300, 300))
		global.weaponsInPlay=global.weaponsInPlay+1
	start(randi_range(1,2))
