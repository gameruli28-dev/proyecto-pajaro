extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("mover_derecha"):
		position.x -= 10
	if Input.is_action_pressed("mover_izquierda"):
		position.x += 10
	if Input.is_action_pressed("mover_abajo"):
		position.y -= 10
	if Input.is_action_pressed("mover_arriba"):
		position.y += 10
