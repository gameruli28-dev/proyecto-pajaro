extends CharacterBody2D
var direction = 1
var SPEED = 300.0
const JUMP_VELOCITY = -400.0
func _ready():
	position.x = 200
	position.y = 300


func _physics_process(delta: float) -> void:
	#vertical
	if is_on_floor() == true:
		velocity.x -= velocity.x * 0.03
	
	if Input.is_action_just_pressed("mover_arriba"):
		rotation_degrees=0
		velocity.y = JUMP_VELOCITY
	elif is_on_floor() == false:
		velocity += get_gravity() * delta
	else:
		velocity.y = 0
		
	direction = Input.get_axis("mover_izquierda", "mover_derecha")
	#lateral
	if direction:
		SPEED = SPEED + 300
		velocity.x = direction * SPEED
		SPEED = pow(2,1/SPEED)
		rotation_degrees = 180 * position.y / 720
	else:
		SPEED = pow(2,1/SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		rotation_degrees = -180 * position.y / 720
					
	print(direction)
	
	move_and_slide()
	
