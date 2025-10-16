extends Node

#var speed = 0.0227  # rotation speed (in radians)
#var angle = 0.0
#var angle_mercury = 0.0
#var angle_earth 
var angle = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,]

func _ready():
	pass

func _process(delta):
	
	var distance_scale = 1.5
	
	var time_scale = 1
	
	angle[0] = planet_orbit($Mercury, 4200.0 * distance_scale, 0.0714 * time_scale, angle[0], delta)
	
	angle[1] = planet_orbit($Venus, 7100.0 * distance_scale, 0.0280 * time_scale, angle[1], delta)
	
	angle[2] = planet_orbit($Earth, 10000.0 * distance_scale, 0.0175 * time_scale, angle[2], delta)
	
func planet_orbit(planet, radius, speed, angle, delta):
	
	angle += speed * delta
	var x_pos = cos(angle)
	var y_pos = sin(angle)
	
	planet.position.x = radius * x_pos + 150
	planet.position.y = radius * y_pos + 150
	
	planet.rotation += speed * delta
	
	return angle
