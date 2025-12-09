extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Handle jump.
	if Input.is_action_just_pressed("mover_arriba"):
		velocity.y = JUMP_VELOCITY
	else:
		velocity += get_gravity() * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("mover_izquierda", "mover_derecha")
	if direction:
		SPEED = SPEED * 0.8 + 10
		velocity.x = direction * SPEED
	else:
		SPEED = SPEED * 0.8 - 10
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
