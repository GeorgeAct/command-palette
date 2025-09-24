extends CharacterBody2D

@export var SPEED: float = 100

func _physics_process(_delta: float) -> void:
	var directionX := Input.get_axis("keyLeft", "keyRight")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directionY := Input.get_axis("keyUp", "keyDown")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
