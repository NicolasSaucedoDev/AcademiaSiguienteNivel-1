extends Control

var on_win_game = false

func _physics_process(delta: float) -> void:
	if $"..".on_next_level == true and !on_win_game:
		print("focused")
		$Panel/Button.grab_focus()
		on_win_game = true

func _on_button_pressed() -> void:
	get_tree().quit()
