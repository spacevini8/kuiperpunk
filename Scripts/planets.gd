extends Node

#var speed = 0.0227  # rotation speed (in radians)
#var angle = 0.0
#var angle_mercury = 0.0
#var angle_earth 
var angle = []

func _ready():
	pass

func _process(delta):
	
	var distance_scale = Global.distance_scale
	
	var time_scale = Global.time_scale
	
	for i in 11:
		angle.append(randf_range(-720, 720))
	
	# Planet orbits
	
	angle[0] = Orbits($Rock/Mercury, 4200.0 * distance_scale, 0.0714 * time_scale, 0.0714 * time_scale, angle[0], delta)
	
	angle[1] = Orbits($Rock/Venus, 7100.0 * distance_scale, 0.0280 * time_scale, 0.0280 * time_scale, angle[1], delta)
	
	angle[2] = Orbits($Rock/Earth, 10000.0 * distance_scale, 0.0175 * time_scale, 0.0175 * time_scale, angle[2], delta)
	
	angle[3] = Orbits($Rock/Mars, 15237.0 * distance_scale, 0.0091 * time_scale, 0.0091 * time_scale, angle[3], delta)
	
	# Asteroid Belts
	
	angle[9] = Orbits($"../Asteroid_belt_1", 17000.0 * distance_scale, 200 * time_scale, 200 * time_scale, angle[9], delta)
	
	# Stations
	
	angle[10] = Orbits($Rock/Earth/Space_station_earth, 250 * distance_scale, 0.05 * time_scale, 0.1 * time_scale, angle[10], delta)
	return angle

func Orbits(planet, radius, speed, rotation_speed, angle, delta):
	
	angle += speed * delta
	var x_pos = cos(angle)
	var y_pos = sin(angle)
	
	planet.position.x = radius * x_pos
	planet.position.y = radius * y_pos
	
	planet.rotation += rotation_speed * delta
	
	return angle
