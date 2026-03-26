extends Node2D

# Variable values activated upon the programs start
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var player_health: ProgressBar = $PlayerNode/PlayerHealth
@onready var hook_pierce: Button = $PlayerNode/HookPierceButton
@onready var fishingrod_whip: Button = $PlayerNode/FishingrodWhipButton
@onready var punch: Button = $PlayerNode/PunchButton
@onready var deep_breath: Button = $PlayerNode/DeepBreathButton
@onready var boss_sprite: AnimatedSprite2D = $BossNode/AnimatedSprite2D
@onready var bossbar_visual: ProgressBar = $BossNode/BossHealthbarVisual
@onready var bossbar_procentage: ProgressBar = $BossNode/BossHealthbarProcentage
@onready var cutscene_box: ColorRect = $CutsceneNode/ColorRect
@onready var attack_sprite: Sprite2D = $CutsceneNode/AttackSprite
@onready var awake_sprite: Sprite2D = $CutsceneNode/AwakeSprite
@onready var cutscene_timer: Timer = $CutsceneNode/CutsceneTimer
@onready var enemy_timer: Timer = $TimerNode/EnemyAttackTimer
@onready var player_timer: Timer = $TimerNode/PlayerAttackReloadTimer
@onready var cooldown_timer: Timer = $TimerNode/CooldownTextDisplayTimer
@onready var healing_timer: Timer = $TimerNode/HealingTextDisplayTimer
@onready var win_timer: Timer = $TimerNode/WinTimer
@onready var defeat_timer: Timer = $TimerNode/DefeatTimer
@onready var boss_attack_timer: Timer = $TimerNode/BossAttackAnimTimer
@onready var boss_hurt_timer: Timer = $TimerNode/BossHurtAnimTimer
@onready var boss_death_timer: Timer = $TimerNode/BossDeathAnimTimer
@onready var can_attack: Label = $TextNode/CanAttack
@onready var cooldown_text: Label = $TextNode/CooldownLabel
@onready var round_label: Label = $TextNode/RoundText
@onready var healable: Label = $TextNode/HealingLabel
@onready var win_lable: Label = $TextNode/WinLabel
@onready var defeat_label: Label = $TextNode/DefeatLabel

# Variable values
var can_fight: bool = true
var b2_cooldown = 0
var round_value = 0
var win: bool = false
var loss: bool = false

# The first thing the program does when called
func _ready() -> void:
	cutscene_box.visible = true
	attack_sprite.visible = true
	awake_sprite.visible = true
	boss_sprite.visible = false
	bossbar_visual.value = 100
	bossbar_procentage.value = 100
	player_health.value = 100
	can_fight = false
	can_attack.visible = false
	cooldown_text.visible = false
	healable.visible = false
	b2_cooldown = 0
	round_value = 0
	round_label.text = "Round: " + str(round_value)
	round_label.visible = true
	win_lable.visible = false
	defeat_label.visible = false
	boss_sprite.play("Walk")
	cutscene()

# What the program does every frame
func _process(delta: float) -> void:
	if bossbar_visual.value == 0:
		win_lable.visible = true
		win = true
	if player_health.value == 0:
		defeat_label.visible = true
		defeat_timer.start()
		can_fight = false
		loss = true
	if loss == true:
		WorldToBattle.player_pos = Vector2(0,0)

# The cutscene that plays upon start
func cutscene() -> void:
	anim.play("Cutscene")
	cutscene_timer.start()


"Player attack and ability functions"
func _on_hook_pierce_button_pressed() -> void:# Attack: Hook-Pierce
	if can_fight == true:
		var a = randi_range(7,13)
		bossbar_procentage.value -= a
		bossbar_visual.value -= a
		can_fight = false
		boss_sprite.play("Hurt")
		boss_hurt_timer.start()
	else:
		can_attack.visible = true


func _on_fishingrod_whip_button_pressed() -> void:# Attack: Fishingrod-Whip
	if can_fight == true and b2_cooldown == 0:
		var a = randi_range(18, 24)
		bossbar_procentage.value -= a
		bossbar_visual.value -= a
		can_fight = false
		b2_cooldown = 3
		boss_sprite.play("Hurt")
		boss_hurt_timer.start()
	elif can_fight == true and not b2_cooldown == 0:
		cooldown_text.text = ("This attack is on cooldown. 
		You can use it in " + str(b2_cooldown) + " rounds")
		cooldown_text.visible = true
		cooldown_timer.start()
	else:
		can_attack.visible = true


func _on_punch_button_pressed() -> void:# Attack: Punch
	if can_fight == true:
		var a = randi_range(3, 7)
		bossbar_procentage.value -= a
		bossbar_visual.value -= a
		can_fight = false
		boss_sprite.play("Hurt")
		boss_hurt_timer.start()
	else:
		can_attack.visible = true


func _on_deep_breath_button_pressed() -> void:# Attack: Deep Breath
	if can_fight == true:
		if not player_health.value == player_health.max_value:
			player_health.value += randi_range(7, 15)
			enemy_timer.start()
			can_fight = false
			anim.play("PlayerHeal")
		else:
			healable.visible = true
			healing_timer.start()
	else:
		can_attack.visible = true

"Fish attacks and abilityfunctions"
# What the enemy boss does on its turn of combat
func boss_action() -> void:
	var a = randi_range(1,3)
	if not bossbar_visual.value == 0:
		if a == 1 and not bossbar_visual.value == bossbar_visual.max_value:
			var b = randi_range(7,12)
			bossbar_visual.value += b
			bossbar_procentage.value += b
			player_timer.start()
		elif a == 2:
			player_health.value -= randi_range(10, 19)
			boss_sprite.play("Attack")
			boss_attack_timer.start()
			anim.play("PlayerHurt")
		else:
			player_health.value -= randi_range(6, 11)
			boss_sprite.play("Attack")
			boss_attack_timer.start()
			anim.play("PlayerHurt")
		if not b2_cooldown == 0:
			b2_cooldown -= 1
		round_value += 1
		round_label.text = "Round: " + str(round_value)
	if bossbar_visual.value == 0:
		boss_sprite.play("Death")
		win_timer.start()

"Timer functions"# What happens when the timers timeout
func _on_cutscene_timer_timeout() -> void:
	boss_sprite.visible = true
	cutscene_box.visible = false
	attack_sprite.visible = false
	awake_sprite.visible = false
	can_fight = true


func _on_player_attack_reload_timer_timeout() -> void:
	can_fight = true
	can_attack.visible = false


func _on_cooldown_text_display_timer_timeout() -> void:
	cooldown_text.visible = false


func _on_healing_text_display_timer_timeout() -> void:
	healable.visible = false


func _on_win_timer_timeout() -> void:
	WorldToBattle.change_stage_freshwater()


func _on_defeat_timer_timeout() -> void:
	WorldToBattle.change_stage_freshwater()


func _on_boss_attack_anim_timer_timeout() -> void:
	boss_sprite.play("Walk")
	can_fight = true
	can_attack.visible = false


func _on_boss_hurt_anim_timer_timeout() -> void:
	boss_sprite.play("Walk")
	boss_action()
