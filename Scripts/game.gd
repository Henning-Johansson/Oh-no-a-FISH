extends Node2D

@onready var player: Player = $Player
@onready var money_count: Label = $Player/MoneyCounter/MoneyCount
@onready var bait_count: Label = $Player/BaitCounter/BaitCount



func _ready() -> void:
	player.global_position = WorldToBattle.player_pos


func _process(delta: float) -> void:
	WorldToBattle.player_pos = player.global_position
	money_count.text = str(FishTracker.money)
	bait_count.text = str(FishTracker.octo_bait)


func _on_player_fishing_freshwater() -> void:
	WorldToBattle.change_stage_freshwater()


func _on_player_fishing_saltwater() -> void:
	WorldToBattle.change_stage_saltwater()
