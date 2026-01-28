extends Node2D

@onready var player: Player = $Player


func _ready() -> void:
	player.global_position = WorldToBattle.player_pos

func _process(delta: float) -> void:
	WorldToBattle.player_pos = player.global_position


func _on_player_fishing() -> void:
	WorldToBattle.change_stage()
