extends Node2D

# Variable values activated upon the programs start
@onready var col_rec: ColorRect = $ColorRect
@onready var pause_text: Label = $PauseLabel
@onready var cont_button: Button = $ContinueButton
@onready var quit_button: Button = $QuitButton

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
	emit_signal("unpaused")

# What the program does when the game is paused
func _on_player_pause() -> void:
	if paused == false:
		paused = true
		col_rec.visible = true
		pause_text.visible = true
		cont_button.visible = true
		quit_button.visible = true
	elif paused == true:
		paused = false
		col_rec.visible = false
		pause_text.visible = false
		cont_button.visible = false
		quit_button.visible = false
