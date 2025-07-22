extends Area2D


@onready var killzone = $"../../Killzone"

func _on_body_entered(body: Node2D) -> void:
	if killzone.life == 2:
		DialogueManager.show_dialogue_balloon(load("res://Dialogos/Fallo 1 - Comentario.dialogue"), "start")
	elif killzone.life == 1:
		DialogueManager.show_dialogue_balloon(load("res://Dialogos/fallo 2 - Comentario.dialogue"), "start")
