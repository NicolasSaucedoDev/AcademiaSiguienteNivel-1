extends Area2D

@onready var CollisionShape = $CollisionShape2D
@onready var AnimPlayer = $"../../Label/Label2/AnimationPlayer"


func _on_body_entered(body: Node2D) -> void:
	if CollisionShape.disabled == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialogos-lvl2/Comentario-1.dialogue"), "start")
		AnimPlayer.play("mensaje")
		CollisionShape.disabled = true
	
