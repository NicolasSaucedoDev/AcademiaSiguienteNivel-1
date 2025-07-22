extends CanvasLayer

var start_level = load("res://Scenes/main.tscn") as PackedScene

func _ready():
	$VBoxContainer/Start.grab_focus()
	

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)


func _on_exit_pressed() -> void:
		get_tree().quit()
