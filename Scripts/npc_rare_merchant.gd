extends Node2D

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_sprite.play("default")


func _on_interactible_do_interact() -> void:
	WorldToBattle._trade_rarity("rare")


func _on_interactible_stop_interact() -> void:
	WorldToBattle._trade_rarity("none")
