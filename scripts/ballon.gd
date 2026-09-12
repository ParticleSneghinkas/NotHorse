extends Area2D


const SPEED = 400.0 

func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta
	
