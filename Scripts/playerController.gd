extends CharacterBody2D

# Rotación: radianes/s y radianes/s^2
@export var rotation_speed: float = PI
@export var rotational_acceleration: float = TAU * 1

# Movimiento: píxeles/s y píxeles/s^2
@export var max_speed: float = 400
@export var vel_acceleration: float = 600
@export var vel_deceleration: float = 50

var rotation_direction: float = 0
var movement_direction: float = 0
var rotational_velocity:float  = 0

# Rotación y movimiento de la nave con aceleración y fricción
func movement(delta):
	# Rotación con deceleración y aceleración
	rotation_direction = Input.get_axis("left", "right")
	#rotation += rotation_direction * rotation_speed * delta
	if(rotation_direction == 0):
		rotation_direction = sign(rotational_velocity) * -1
	
	rotational_velocity += rotation_direction * rotational_acceleration * delta
	rotational_velocity = clamp(rotational_velocity, -rotation_speed, rotation_speed)
	
	rotation += rotational_velocity * delta
	
	
	# Movimiento con fricción y aceleración
	movement_direction = Input.get_axis("down", "up")
	if(movement_direction == 0):
		velocity = velocity.move_toward(Vector2.ZERO, (vel_deceleration * delta))
	else:
		velocity += transform.x * movement_direction * (vel_acceleration * delta)
		velocity = velocity.limit_length(max_speed)
		
func teleport():
	var screen_size = get_viewport_rect().size
	var sprite_size_x = $Sprite2D.texture.get_width() / 2
	var sprite_size_y = $Sprite2D.texture.get_height() / 2
	
	#if global_position.y < -sprite_size_y:
		#global_position.y = screen_size.y + sprite_size_y
	#elif global_position.y > screen_size.y + sprite_size_y:
		#global_position.y = -sprite_size_y
	
	#if global_position.x < -sprite_size_x:
		#global_position.x = screen_size.x + sprite_size_x
	#elif global_position.x > screen_size.x + sprite_size_x:
		#global_position.x = -sprite_size_x
	
	position.x = wrapf(position.x, -sprite_size_x, screen_size.x + sprite_size_x)
	position.y = wrapf(position.y, -sprite_size_y, screen_size.y + sprite_size_y)
		

func _physics_process(delta):
	movement(delta)
	move_and_slide()
	teleport()
