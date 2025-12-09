extends CharacterBody2D

var SPEED = 300.0
const JUMP_VELOCITY = -400.0
func _ready():
	position.x = 200
	position.y = 300


func _physics_process(delta: float) -> void:
	#vertical
	
	if Input.is_action_just_pressed("mover_arriba"):
		velocity.y = JUMP_VELOCITY
	elif is_on_floor() == false:
		velocity += get_gravity() * delta
	else:
		velocity.y = 0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("mover_izquierda", "mover_derecha")
	#lateral
	if direction:
		SPEED = SPEED + 300
		velocity.x = direction * SPEED
		SPEED = pow(2,1/SPEED)
	else:
		SPEED = pow(2,1/SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	move_and_slide()
	
