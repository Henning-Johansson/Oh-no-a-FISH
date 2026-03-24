extends Node2D

# Variable value activated upon the programs start
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

# The first thing the program does when called
func _ready() -> void:
	anim_sprite.play("default")

# What the program does when the player interacts with the guide
func _on_interactible_do_interact() -> void:
	WorldToBattle.is_speaking = true
	WorldToBattle._guide_speech_start()

# What the program does when the player stops interacting with the guide
func _on_interactible_stop_interact() -> void:
	WorldToBattle.is_speaking = false
