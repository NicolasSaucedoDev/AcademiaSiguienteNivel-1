extends Control

var on_win = false

func _physics_process(delta: float) -> void:
	if $"..".on_win == true and !on_win:
		$Panel/Next_level.grab_focus()
		on_win = true


func _on_next_level_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/anim-preLevel2.tscn")
	


func _on_reiniciar_pressed() -> void:
	get_tree().reload_current_scene()

func _on_salir_pressed() -> void:
	get_tree().quit()
