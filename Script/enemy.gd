extends CharacterBody2D


const SPEED = 300.0
var direction = 1

var is_on_movie = false

@onready var RayFloor = $RayCast2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if !RayFloor.is_colliding() and is_on_floor():
		direction = -direction
		scale.x = -scale.x
		
		
	if is_on_movie == false:
		position.x += direction * SPEED * delta
	move_and_slide()

func tool_movie():
	is_on_movie = !is_on_movie
