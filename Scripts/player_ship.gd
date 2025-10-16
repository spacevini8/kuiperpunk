extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	$CPUParticles2D.emitting = false
	if Input.is_action_pressed("Ship_Move"):
		var movement_vector := Vector2(1,0)
		var direction = global_transform.basis_xform(Vector2.RIGHT)
		var SPEED = 2000
		global_position += (movement_vector.rotated(rotation) * SPEED * delta)
		$CPUParticles2D.emitting = true
