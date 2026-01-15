extends Node2D

@onready var player_health: ProgressBar = $Player/CanvasLayer/Healthbar
@onready var enemy_health: ProgressBar = $Enemy/CanvasLayer/Healthbar
@onready var fish: Node2D = $Enemy/FishableItems
@onready var player: Sprite2D = $Player/PlayerFig
@onready var b1: Button = $Player/CanvasLayer/Button
@onready var b2: Button = $Player/CanvasLayer/Button2
@onready var b3: Button = $Player/CanvasLayer/Button3
@onready var b4: Button = $Player/CanvasLayer/Button4

enum {FISH_SLAP, BUBBLE_BREATH, FISH_FOOD}

#Player attack and ability functions
func _on_button_1_pressed() -> void:
	enemy_health.value -= 10


func _on_button_2_pressed() -> void:
	enemy_health.value -= 20


func _on_button_3_pressed() -> void:
	enemy_health.value -= 5


func _on_button_4_pressed() -> void:
	player_health.value += 20

#Fish attacks and abilityfunctions
func _fish_attack()-> void:
	pass
