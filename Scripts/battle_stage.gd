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
@onready var win_timer: Timer = $Timers/WinTimer
@onready var defeat_timer: Timer = $Timers/DefeatTimer
@onready var can_attack: Label = $CanvasLayer/CanAttack
@onready var cooldown_text: Label = $CanvasLayer/CooldownLabel
@onready var round_label: Label = $CanvasLayer/RoundText
@onready var healable: Label = $CanvasLayer/HealingLabel
@onready var win_lable: Label = $CanvasLayer/WinLabel
@onready var defeat_label: Label = $CanvasLayer/DefeatLabel
@onready var anim: AnimationPlayer = $AnimationPlayer

signal fighting
signal atlantic_bass_caught
signal clownfish_caught
signal dab_caught
signal sea_spider_caught
signal blue_gill_caught
signal guppy_caught
signal freshwater_snail_caught
signal axolotl_caught
signal high_fin_banded_shark_caught
signal golden_tench_caught

var can_fight: bool = true
var b2_cooldown = 0
var round_value = 0
var win: bool = false
var loss: bool = false
var atlantic_bass: bool = false
var clownfish: bool = false
var dab: bool = false
var sea_spider: bool = false
var blue_gill: bool = false
var guppy: bool = false
var freshwater_snail: bool = false
var axolotl: bool = false
var high_fin_banded_shark: bool = false
var golden_tench: bool = false
var count_up: bool = false


func _ready()-> void:
	atlantic_bass = false
	clownfish = false
	dab= false
	sea_spider = false
	blue_gill = false
	guppy = false
	freshwater_snail = false
	axolotl = false
	high_fin_banded_shark = false
	golden_tench = false
	count_up = false
	win = false
	loss = false
	emit_signal("fighting")
	enemy_health.value = 100
	player_health.value = 100
	can_fight = true
	can_attack.visible = false
	cooldown_text.visible = false
	healable.visible = false
	b2_cooldown = 0
	round_value = 0
	round_label.text = "Round: " + str(round_value)
	round_label.visible = true
	win_lable.visible = false
	defeat_label.visible = false


func _process(delta: float) -> void:
	if enemy_health.value == 0:
		win_lable.visible = true
		win = true
	if player_health.value == 0:
		defeat_label.visible = true
		defeat_timer.start()
		can_fight = false
		loss = true
	if win == true:
		if atlantic_bass == true:
			FishTracker.update_icon("atlantic_bass")
			if count_up == false:
				FishTracker.update_count_plus("atlantic_bass")
				count_up = true
		elif axolotl == true:
			FishTracker.update_icon("axolotl")
			if count_up == false:
				FishTracker.update_count_plus("axolotl")
				count_up = true
		elif blue_gill == true:
			FishTracker.update_icon("blue_gill")
			if count_up == false:
				FishTracker.update_count_plus("blue_gill")
				count_up = true
		elif clownfish == true:
			FishTracker.update_icon("clownfish")
			if count_up == false:
				FishTracker.update_count_plus("clownfish")
				count_up = true
		elif dab == true:
			FishTracker.update_icon("dab")
			if count_up == false:
				FishTracker.update_count_plus("dab")
				count_up = true
		elif freshwater_snail == true:
			FishTracker.update_icon("freshwater_snail")
			if count_up == false:
				FishTracker.update_count_plus("freshwater_snail")
				count_up = true
		elif golden_tench == true:
			FishTracker.update_icon("golden_tench")
			if count_up == false:
				FishTracker.update_count_plus("golden_tench")
				count_up = true
		elif guppy == true:
			FishTracker.update_icon("guppy")
			if count_up == false:
				FishTracker.update_count_plus("guppy")
				count_up = true
		elif high_fin_banded_shark == true:
			FishTracker.update_icon("high_fin_banded_shark")
			if count_up == false:
				FishTracker.update_count_plus("high_fin_banded_shark")
				count_up = true
		elif sea_spider == true:
			FishTracker.update_icon("sea_spider")
			if count_up == false:
				FishTracker.update_count_plus("sea_spider")
				count_up = true
	elif loss == true:
		WorldToBattle.player_pos = Vector2(0,0)



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
		win_timer.start()


#Timer functions
func _can_fight_timeout() -> void:
	can_fight = true
	can_attack.visible = false


func _on_cooldown_text_display_timer_timeout() -> void:
	cooldown_text.visible = false


func _on_healing_text_display_timer_timeout() -> void:
	healable.visible = false


func _on_win_timer_timeout() -> void:
	WorldToBattle.change_stage()


func _on_defeat_timer_timeout() -> void:
	WorldToBattle.change_stage()


#Inventory Update Functions
func _on_fishable_items_atlantic_bass() -> void:
	atlantic_bass = true


func _on_fishable_items_axolotl() -> void:
	axolotl = true


func _on_fishable_items_blue_gill() -> void:
	blue_gill = true


func _on_fishable_items_clownfish() -> void:
	clownfish = true


func _on_fishable_items_dab() -> void:
	dab = true


func _on_fishable_items_freshwater_snail() -> void:
	freshwater_snail = true


func _on_fishable_items_golden_tench() -> void:
	golden_tench = true


func _on_fishable_items_guppy() -> void:
	guppy = true


func _on_fishable_items_high_fin_banded_shark() -> void:
	high_fin_banded_shark = true


func _on_fishable_items_sea_spider() -> void:
	sea_spider = true
