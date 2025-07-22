extends CharacterBody2D


const SPEED = 400
const JUMP_VELOCITY = -550

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980

var life = 3

@onready var animated_sprite = $AnimatedSprite2D; #Importamos las propiedades de AnimatedSprite2D
@onready var animJump = $AnimationPlayer
@onready var ligth = $AreaOfSightAgent2D

var is_on_movie = false

func _physics_process(delta): #Esta funcion actualiza las fisicas * segundos (delta) frame por frame
	#Añadimos la gravedad.
	if not is_on_floor(): #Basicamente esta funcion verifica si el jugador "NO" se encuentra en el piso.
		velocity.y += gravity * delta #Tomamos la propiedad velocity.y (vertical) y sumamos la gravedad * delta (frame)
		
		

	# Si la tecla "ESPACIO" es precionada y el jugador, se encuentra en el piso..
	if Input.is_action_just_pressed("Saltar") and is_on_floor() and !get_tree().paused:
		velocity.y = JUMP_VELOCITY #Se agregara... tal propiedad
		animJump.play("jump")
		
	
	# Obtenemos las direcciones  Izquierda  , Derecha .
	var direction = Input.get_axis("Izquierda", "Derecha")
	
	if direction > 0:
		animated_sprite.flip_h = false;
	elif direction < 0:
		animated_sprite.flip_h = true;
	
	if animated_sprite.flip_h == false:
		ligth.scale.x = 1
	elif animated_sprite.flip_h == true:
		ligth.scale.x = -1
		
	
	if Input.is_action_just_pressed("Linterna") and ligth.visible == true:
		ligth.visible = false
	elif  Input.is_action_just_pressed("Linterna") and ligth.visible == false:
		ligth.visible = true
	
	
	#Establecemos animaciones de "quieto" , "correr" y "saltar"
	if is_on_floor():
		if direction == 0: #Es decir, no esta en movimiento.
			animated_sprite.play("idle");
		else:  #Si nos movemos, izquierda o derecha, correra la siguiente animación
			animated_sprite.play("run");
	else: 
		animated_sprite.play("jump");
		
		
		
# Simplemente aplicamos el movimiento.
	if direction and !is_on_movie:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	move_and_slide() #Metodo importante para indicarle a Godot que nuestro personaje se encontrara en movimiento.

func tool_movie():
	is_on_movie = !is_on_movie;
