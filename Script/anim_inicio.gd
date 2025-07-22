extends CanvasLayer

@onready var continuar = preload("res://Scenes/Start_Menu.tscn") as PackedScene

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(continuar)
