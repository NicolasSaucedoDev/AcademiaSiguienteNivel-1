extends Control

var on_lost = false

func _physics_process(delta: float) -> void:
	if $"..".on_game_over == true and !on_lost and !get_tree().paused:
		$PanelContainer/VBoxContainer/Restart.set_focus_mode(2)
		$PanelContainer/VBoxContainer/Restart.grab_focus()
		get_tree().paused = true
		Engine.time_scale = 1
		

func _on_restart_pressed():
	$PanelContainer/VBoxContainer/Restart.set_focus_mode(0)
	$"..".on_game_over = false
	get_tree().paused = false
	get_tree().reload_current_scene()
	


func _on_exit_game_pressed():
	$PanelContainer/VBoxContainer/Exit_Game.set_focus_mode(0)
	get_tree().quit()
