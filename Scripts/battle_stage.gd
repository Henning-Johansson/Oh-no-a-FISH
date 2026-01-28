extends Node2D

@onready var player_health: ProgressBar = $Player/CanvasLayer/Healthbar
@onready var enemy_health: ProgressBar = $Enemy/CanvasLayer/Healthbar
@onready var fish: Node2D = $Enemy/FishableItems
@onready var player: Sprite2D = $Player/PlayerFig
@onready var b1: Button = $Player/CanvasLayer/Button
@onready var b2: Button = $Player/CanvasLayer/Button2
@onready var b3: Button = $Player/CanvasLayer/Button3
@onready var b4: Button = $Player/CanvasLayer/Button4
@onready var enemy_timer: Timer = $Timers/EnemyAttackTimer
@onready var player_timer: Timer = $Timers/PlayerAttackReloadTimer
@onready var cooldown_timer: Timer = $Timers/CooldownTextDisplayTimer
@onready var healing_timer: Timer = $Timers/HealingTextDisplayTimer
@onready var can_attack: Label = $CanvasLayer/CanAttack
@onready var cooldown_text: Label = $CanvasLayer/CooldownLabel
@onready var round_label: Label = $CanvasLayer/RoundText
@onready var healable: Label = $CanvasLayer/HealingLabel
@onready var win_lable: Label = $CanvasLayer/WinLabel
@onready var anim: AnimationPlayer = $AnimationPlayer

signal fighting

var can_fight: bool = true
var b2_cooldown = 0
var round_value = 0
var win: bool = false


func _ready()-> void:
	enemy_health.value = 100
	player_health.value = 100
	emit_signal("fighting")
	can_fight = true
	can_attack.visible = false
	cooldown_text.visible = false
	healable.visible = false
	b2_cooldown = 0
	round_value = 0
	round_label.text = "Round: " + str(round_value)
	round_label.visible = true
	win_lable.visible = false

func _process(delta: float) -> void:
	if enemy_health.value == 0:
		win_lable.visible = true
		win = true


#Player attack and ability functions
func _on_button_1_pressed() -> void: #Attack: Hook-Pierce
	if can_fight == true:
		enemy_health.value -= randi_range(7,13)
		enemy_timer.start()
		player_timer.start()
		can_fight = false
		anim.play("EnemyHurt")
	else:
		can_attack.visible = true


func _on_button_2_pressed() -> void: #Attack: Fishingrod-Whip
	if can_fight == true and b2_cooldown == 0:
		enemy_health.value -= randi_range(18, 24)
		enemy_timer.start()
		player_timer.start()
		can_fight = false
		b2_cooldown = 3
		anim.play("EnemyHurt")
	elif can_fight == true and not b2_cooldown == 0:
		cooldown_text.text = ("This attack is on cooldown. 
		You can use it in " + str(b2_cooldown) + " rounds")
		cooldown_text.visible = true
		cooldown_timer.start()
	else:
		can_attack.visible = true


func _on_button_3_pressed() -> void: #Attack: Punch
	if can_fight == true:
		enemy_health.value -= randi_range(3, 7)
		enemy_timer.start()
		player_timer.start()
		can_fight = false
		anim.play("EnemyHurt")
	else:
		can_attack.visible = true


func _on_button_4_pressed() -> void: #Attack: Deep Breath
	if can_fight == true:
		if not player_health.value == player_health.max_value:
			player_health.value += randi_range(7, 15)
			enemy_timer.start()
			player_timer.start()
			can_fight = false
			anim.play("PlayerHeal")
		else:
			healable.visible = true
			healing_timer.start()
	else:
		can_attack.visible = true


#Fish attacks and abilityfunctions
func _fish_attack()-> void:
	var a = randi_range(1,3)
	if not enemy_health.value == 0:
		if a == 1 and not enemy_health.value == enemy_health.max_value:
			enemy_health.value += randi_range(4,9)
			anim.play("EnemyHeal")
		elif a == 2:
			player_health.value -= randi_range(7, 16)
			anim.play("PlayerHurt")
		else:
			player_health.value -= randi_range(3, 8)
			anim.play("PlayerHurt")
		if not b2_cooldown == 0:
			b2_cooldown -= 1
		round_value += 1
		round_label.text = "Round: " + str(round_value)
	if enemy_health.value == 0:
		WorldToBattle.change_stage()


#Timer functions
func _can_fight_timeout() -> void:
	can_fight = true
	can_attack.visible = false


func _on_cooldown_text_display_timer_timeout() -> void:
	cooldown_text.visible = false


func _on_healing_text_display_timer_timeout() -> void:
	healable.visible = false

#Inventory Update Functions
func _on_atlantic_bass():
	pass
