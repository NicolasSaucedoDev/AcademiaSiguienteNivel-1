extends Area2D

@onready var CollisionShape = $CollisionShape2D


func _on_body_entered(body: Node2D) -> void:
	if CollisionShape.disabled == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialogos/Alerta-Rio.dialogue"), "start")
		CollisionShape.disabled = true
