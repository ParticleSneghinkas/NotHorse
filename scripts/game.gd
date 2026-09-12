extends Node2D

var ballon_scene := preload("res://scenes/ballon.tscn")

var ballons = []

func hit_ballon(body) -> void:
	if body.name == "Dawg":
		$GameoverSound.play()
		$Gameover.show()
		get_tree().paused = true

func generate_ballons() -> void:
	var ballon_instance = ballon_scene.instantiate();
	ballon_instance.position = Vector2i(1044.0 + (1 if ballons.is_empty() else ballons.back().position.x) + randi() % 10 , 452.0)
	ballon_instance.body_entered.connect(hit_ballon)
	add_child(ballon_instance)
	ballons.append(ballon_instance)


func update_ballons() -> void:
	for ballon in ballons:
		if ballon.position.x < -100 :
			ballon.queue_free()
			ballons.erase(ballon)

func _ready() -> void:
	$Gameover.hide()


func _process(delta: float) -> void:
	if ballons.size() < 5:
		generate_ballons()
	update_ballons()
