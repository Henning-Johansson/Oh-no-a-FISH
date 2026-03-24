extends Node2D

# Variable value activated upon the programs start
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

# The first thing the program does when called
func _ready() -> void:
	anim_sprite.play("default")

# What the program does when the player interacts with the rare merchant
func _on_interactible_do_interact() -> void:
	WorldToBattle._trade_rarity("rare")

# What the program does when the player stops interacting with the rare merchant
func _on_interactible_stop_interact() -> void:
	WorldToBattle._trade_rarity("none")
