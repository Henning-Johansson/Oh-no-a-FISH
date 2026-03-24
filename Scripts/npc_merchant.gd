extends Node2D

# Variable value activated upon the programs strat
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

# The first thing the program does when called
func _ready() -> void:
	anim_sprite.play("default")

# What the program does when the player interacts with the merchant
func _on_interactible_do_interact() -> void:
	WorldToBattle._trade_rarity("common")

# What the program does when the player stops interacting with the merchant
func _on_interactible_stop_interact() -> void:
	WorldToBattle._trade_rarity("none")
