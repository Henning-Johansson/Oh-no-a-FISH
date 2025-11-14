extends CharacterBody2D
class_name Player

#Dictionaries
enum {IDLE, WALK, FISHING, BATTLE, DAMAGE, DEAD,}

#Variable values
var state = WALK
var is_dead: bool = false

#Variables activated upon the programs start
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

#Exported variable
@export var speed = 400

"GAME LOOP"#The code that runs the game
#Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match state:
		IDLE:
			_idle_state(delta)
		WALK:
			_walk_state(delta)
		FISHING:
			_fishing_state(delta)
		BATTLE:
			_battle_state(delta)
		DAMAGE:
			_damage_state(delta)
		DEAD:
			_dead_state(delta)

"GENERAL HELP FUNCTIONS"#Functions that help with general pieces of data
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _movement(delta):
	get_input()
	move_and_slide()


"STATE FUNCTIONS"#Defines each state the player can be in
func _idle_state(delta: float) -> void:
	pass

func _walk_state(delta: float) -> void:
	_movement(delta)

func _fishing_state(delta: float) -> void:
	pass

func _battle_state(delta: float) -> void:
	pass

func _damage_state(delta: float) -> void:
	pass

func _dead_state(delta: float) -> void:
	pass

"ENTER STATE FUNCTIONS"#Defines what happens when each state is entered
func _enter_idle_state():
	state = IDLE
	anim.play("Idle")

func _enter_walk_state():
	state = WALK
	anim.play("Walk")

func _enter_fishing_state():
	state = FISHING
	anim.play("FISHING")

func _enter_battle_state():
	state = BATTLE
	anim.play("Battle")

func _enter_damage_state():
	state = DAMAGE
	anim.play("Damage")

"PUBLIC FUNCTIONS"#Functions visible to other scripts
func enter_dead_state(dir: Vector2) -> void:
	if not is_dead:
		is_dead = true
		state = DEAD
		anim.play("Dead")
		$CollisionShape2D.set_deferred("disabled", true)

"SIGNALS"#Signals emited by the script
