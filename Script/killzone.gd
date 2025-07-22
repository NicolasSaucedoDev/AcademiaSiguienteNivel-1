extends Area2D


@onready var timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.life -=1
		Engine.time_scale = 0.5
		timer.start()
		body.position = Vector2(175,-78)
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
