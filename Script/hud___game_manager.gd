extends CanvasLayer

var score = 0;
@export var is_lvl2_running = false

@onready var label_score = $Label
@onready var Killzone = $"../Killzone"
@onready var player = $"../Player"
@onready var enemy = $"../Enemigos/Enemy"

@onready var animationPlayer = $Game_Over/AnimationPlayer
@onready var animationWin = $win/AnimationPlayer
@onready var animationFinal = $Siguiente_Nivel/AnimationPlayer

var on_game_over : bool = false
var on_win : bool = false
var on_next_level : bool = false



func add_point():
	score += 1
	label_score.text = str(score)
	

func _process(delta):
	
	if player.life == 2:
		$"Ceibo-3".visible = false
	elif player.life == 1:
		$"Ceibo-2".visible = false
	elif player.life == 0:
		$"Ceibo-1".visible = false
		player.life = 3
		animationPlayer.play("animation")
		on_game_over = true
		player.tool_movie()
		enemy.tool_movie()
		
	
	if score == 8:
		if is_lvl2_running == false:
			animationWin.play("siguienteNivel")
			score = 0
			player.tool_movie()
			enemy.tool_movie()
			on_win = true
		elif is_lvl2_running == true:
			animationFinal.play("Final")
			player.tool_movie()
			enemy.tool_movie()
			score = -1
			on_next_level = true
			
		
		
