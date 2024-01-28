extends ProgressBar

@onready var timer:Timer = $Timer2

var sb
var r
var g

# Called when the node enters the scene tree for the first time.
func _ready():
	sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.corner_radius_bottom_left=10
	sb.corner_radius_bottom_right=10
	sb.corner_radius_top_left=10
	sb.corner_radius_top_right=10
	sb.border_width_bottom=2
	sb.border_width_top=2
	sb.border_width_left=2
	sb.border_color=Color(0,0,0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value=timer.get_time_left()
	r = remap(value, 0, 90, 1, 0)
	g = remap(value, 0, 90, 0, 1)
	sb.bg_color = Color(r,g,0)
	pass
