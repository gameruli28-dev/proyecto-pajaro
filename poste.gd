extends CharacterBody2D

var MOVIMIENTO = 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
func _ready():
	position.y = randf_range(600, 100)
	


func _physics_process(delta: float) -> void:
	if MOVIMIENTO == 1:
		MOVIMIENTO = 0
		for i in range(700):
			await get_tree().create_timer(0.0).timeout
			position.x += 2
		position.y = randf_range(600, 100)
		position.x = -30
		MOVIMIENTO = 1
