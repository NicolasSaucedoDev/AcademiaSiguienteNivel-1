extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var game_manager = $"../../HUD - Game_Manager"

func _on_body_entered(body):
	if body.name == "Player":
		game_manager.add_point()
		animation_player.play("pickup")
