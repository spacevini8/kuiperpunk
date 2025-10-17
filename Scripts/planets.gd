extends Node

#var speed = 0.0227  # rotation speed (in radians)
#var angle = 0.0
#var angle_mercury = 0.0
#var angle_earth 
var angle = []

func _ready():
	pass

func _process(delta):
	
	var distance_scale = 1.5
	
	var time_scale = 10
	
	for i in 11:
		angle.append(randf_range(-720, 720))
	
	# Planet orbits
	
	angle[0] = Orbits($Mercury, 4200.0 * distance_scale, 0.0714 * time_scale, angle[0], delta)
	
	angle[1] = Orbits($Venus, 7100.0 * distance_scale, 0.0280 * time_scale, angle[1], delta)
	
	angle[2] = Orbits($Earth, 10000.0 * distance_scale, 0.0175 * time_scale, angle[2], delta)
	
	angle[3] = Orbits($Mars, 15237.0 * distance_scale, 0.0091 * time_scale, angle[3], delta)
	
	# Asteroid Belts
	
	angle[9] = Orbits($"../Asteroid_belt_1", 17000.0 * distance_scale, 200 * time_scale, angle[9], delta)
	
	# Stations
	
	angle[10] = Orbits($Earth/Space_station_earth, 300 * distance_scale, 0.05 * time_scale, angle[10], delta)
	
func Orbits(planet, radius, speed, angle, delta):
	
	angle += speed * delta
	var x_pos = cos(angle)
	var y_pos = sin(angle)
	
	planet.position.x = radius * x_pos + 150
	planet.position.y = radius * y_pos + 150
	
	planet.rotation += speed * delta
	
	return angle
