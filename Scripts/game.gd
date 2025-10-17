extends Node2D

var distance_scale = Global.distance_scale

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw():
	draw_arc(Vector2(0,0), 4200.0 * distance_scale, 0, 360, 100, Color.WHITE, 30)
	
	draw_arc(Vector2(0,0), 7100.0 * distance_scale, 0, 360, 100, Color.WHITE, 30)
	
	draw_arc(Vector2(0,0), 10000.0 * distance_scale, 0, 360, 100, Color.WHITE, 30)
	
	draw_arc(Vector2(0,0), 15237.0 * distance_scale, 0, 360, 100, Color.WHITE, 30)
