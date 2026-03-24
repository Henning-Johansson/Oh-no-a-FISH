extends Node2D

# Variable values activated upon the programs start
@onready var col_rec: ColorRect = $ColorRect
@onready var pause_text: Label = $PauseLabel
@onready var cont_button: Button = $ContinueButton
@onready var quit_button: Button = $QuitButton
@onready var cheat_button: Button = $CheatButton
@onready var cheat_sprite: Sprite2D = $CheatSprite

# Variable values
var paused: bool = false
var stage: bool = false

# Signal
signal unpaused

# The first thing the program does when called
func _ready() -> void:
	paused = false
	col_rec.visible = false
	pause_text.visible = false
	cont_button.visible = false
	quit_button.visible = false
	cheat_button.visible = false
	cheat_sprite.visible = false
	cheat_sprite.modulate = Color(0,0,0)

# What the program does when the quit button is pressed
func _on_quit_button_pressed() -> void:
	get_tree().quit()

# What the program does when the continue button is pressed
func _on_continue_button_pressed() -> void:
	paused = false
	col_rec.visible = false
	pause_text.visible = false
	cont_button.visible = false
	quit_button.visible = false
	cheat_button.visible = false
	cheat_sprite.visible = false
	emit_signal("unpaused")

# What the program does when the game is paused
func _on_player_pause() -> void:
	if paused == false:
		paused = true
		col_rec.visible = true
		pause_text.visible = true
		cont_button.visible = true
		quit_button.visible = true
		cheat_button.visible = true
		cheat_sprite.visible = true
	elif paused == true:
		paused = false
		col_rec.visible = false
		pause_text.visible = false
		cont_button.visible = false
		quit_button.visible = false
		cheat_button.visible = false
		cheat_sprite.visible = false

# What the program does when the cheat button is pressed
func _on_cheat_button_pressed() -> void:
	if stage == false:
		WorldToBattle.boss_stage = true
		stage = true
		cheat_sprite.modulate = Color(1,1,1)
	else:
		WorldToBattle.boss_stage = false
		stage = false
		cheat_sprite.modulate = Color(0,0,0)
