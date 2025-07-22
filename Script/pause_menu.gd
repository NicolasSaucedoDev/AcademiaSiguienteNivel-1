extends Control


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("Escape") and !get_tree().paused:
		$Resume.grab_focus()
		$Resume.set_focus_mode(2)
		pause()
		$"..".visible = true
		visible = true
		Engine.time_scale = 1
	elif Input.is_action_just_pressed("Escape") and get_tree().paused:
		resume()
		$"..".visible = false
		visible = false
		

func _on_resume_pressed() -> void:
	$Resume.set_focus_mode(0)
	visible = false
	$"..".visible = false
	print($Resume.set_focus_mode)
	resume()

func _on_restart_pressed() -> void:
	visible = false
	$"..".visible = false
	resume()
	get_tree().reload_current_scene()

func _on_exit_game_pressed() -> void:
	visible = false
	$"..".visible = false
	get_tree().quit()

func _physics_process(delta):
	testEsc()
