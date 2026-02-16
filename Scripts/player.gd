extends CharacterBody2D
class_name Player

#Dictionaries
enum states {IDLE, WALK, FISHING, INVENTORY, PAUSED}


#Variable values
var state = states.IDLE
var is_dead: bool = false
var is_able_to_fish: bool = false
var dir: String = "down"
var anim_played: bool = false
var inventory_opened: bool = false
var game_paused: bool = false
var is_able_to_interact: bool = false

#Variables activated upon the programs start
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var can_fish: Label = $CanFish
@onready var fishing_down: RayCast2D = $FishingDown
@onready var fishing_right: RayCast2D =$FishingRight
@onready var fishing_up: RayCast2D = $FishingUp
@onready var fishing_left: RayCast2D = $FishingLeft
@onready var fishing_time: Timer = $FishingTimer
@onready var interact: Area2D = $NpcInteractions/Area2D
@onready var can_interact: Label = $CanInteract

#Constant values
const MAX_SPEED = 600
const ACC = 10000000

#Signals
signal fishing
signal inventory
signal pause

"GAME LOOP"#The code that runs the game
#Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match state:
		states.IDLE:
			_idle_state(delta)
		states.WALK:
			_walk_state(delta)
		states.FISHING:
			_fishing_state(delta)
		states.INVENTORY:
			_inventory_state(delta)
		states.PAUSED:
			_paused_state(delta)


"GENERAL HELP FUNCTIONS"#Functions that help with general pieces of data
func _movement(delta: float, input_x: float, input_y: float):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_x != 0:
		velocity.x =  move_toward(velocity.x, input_direction[0]*MAX_SPEED, ACC*delta)
	else:
		velocity.x = move_toward(velocity.x, 0, ACC*delta)
	if input_y != 0:
		velocity.y =  move_toward(velocity.y, input_direction[1]*MAX_SPEED, ACC*delta)
	else:
		velocity.y = move_toward(velocity.y, 0, ACC*delta)
	move_and_slide()

func _update_direction(input_x: float) -> void:
	if input_x > 0:
		sprite.flip_h = false
	elif input_x < 0:
		sprite.flip_h = true

"STATE FUNCTIONS"#Defines each state the player can be in
func _idle_state(delta: float) -> void:
	_can_fish(fishing_down, fishing_right, fishing_left, fishing_up)
	anim_played = false
	if is_able_to_fish:
		if Input.is_action_just_pressed("fishing"):
			_enter_fishing_state()
	if velocity.length() == 0:
		if dir == "horizontal":
			anim.play("Idle_h")
		elif dir == "down":
			anim.play("Idle_down")
		elif dir == "up":
			anim.play("Idle_up")
	var input_x = Input.get_axis("left", "right")
	var input_y =Input.get_axis("up", "down")
	_update_direction(input_x)
	_movement(delta, input_x, input_y)
	if velocity.length() != 0:
		_enter_walk_state()
	if Input.is_action_just_pressed("access_inventory"):
		_enter_inventory_state()
	if Input.is_action_just_pressed("pause_menu"):
		_enter_paused_state()

func _walk_state(delta: float) -> void:
	_can_fish(fishing_down, fishing_right, fishing_left, fishing_up)
	anim_played = false
	if is_able_to_fish:
		if Input.is_action_just_pressed("fishing"):
			_enter_fishing_state()
	var input_x = Input.get_axis("left", "right")
	var input_y =Input.get_axis("up", "down")
	if velocity.length() != 0:
		if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
			anim.play("Walk_h")
			dir = "horizontal"
		elif Input.is_action_pressed("down"):
			anim.play("Walk_down")
			dir = "down"
		elif Input.is_action_pressed("up"):
			anim.play("Walk_up")
			dir = "up"
	_update_direction(input_x)
	_movement(delta, input_x, input_y)
	if velocity.length() == 0:
		_enter_idle_state()
	if Input.is_action_just_pressed("access_inventory"):
		_enter_inventory_state()
	if Input.is_action_just_pressed("pause_menu"):
		_enter_paused_state()

func _fishing_state(delta: float) -> void:
	if fishing_down.is_colliding() and anim_played == false:
		anim.play("Fishing_Cast_down")
		anim_played = true
		emit_signal("fishing")
	elif fishing_right.is_colliding() and anim_played == false:
		sprite.flip_h = false
		anim.play("Fishing_Cast_h")
		anim_played = true
		emit_signal("fishing")
	elif fishing_left.is_colliding() and anim_played == false:
		sprite.flip_h = true
		anim.play("Fishing_Cast_h")
		anim_played = true
		emit_signal("fishing")
	elif fishing_up.is_colliding() and anim_played == false:
		anim.play("Fishing_Cast_up")
		anim_played = true
		emit_signal("fishing")

func _inventory_state(delta) -> void:
	if not inventory_opened:
		emit_signal("inventory")
		inventory_opened = true
	if Input.is_action_just_pressed("access_inventory") and inventory_opened:
		inventory_opened = false
		emit_signal("inventory")
		_enter_idle_state()

func _paused_state(delta) -> void:
	if not game_paused:
		emit_signal("pause")
		game_paused = true
	if Input.is_action_just_pressed("pause_menu") and game_paused:
		game_paused = false
		emit_signal("pause")
		_enter_idle_state()


"ENTER STATE FUNCTIONS"#Defines what happens when each state is entered
func _enter_idle_state():
	state = states.IDLE

func _enter_walk_state():
	state = states.WALK

func _enter_fishing_state():
	state = states.FISHING

func _enter_inventory_state():
	state = states.INVENTORY

func _enter_paused_state():
	state = states.PAUSED

"PUBLIC FUNCTIONS"#Functions visible to other scripts
func _can_fish(fishing_down: RayCast2D, fishing_right: RayCast2D, fishing_left: RayCast2D, fishing_up: RayCast2D):
	if fishing_down.is_colliding():
		can_fish.visible = true
		is_able_to_fish = true
	elif fishing_right.is_colliding():
		can_fish.visible = true
		is_able_to_fish = true
	elif fishing_left.is_colliding():
		can_fish.visible = true
		is_able_to_fish = true
	elif fishing_up.is_colliding():
		can_fish.visible = true
		is_able_to_fish = true
	else:
		can_fish.visible = false
		is_able_to_fish = false

func _can_trade(interact):
	if interact.is_colliding():
		can_interact.visible = true
		is_able_to_fish = true
	else:
		can_interact.visible = false
		is_able_to_interact = false


func _on_pause_menu_unpaused() -> void:
	_enter_idle_state()
	game_paused = false
