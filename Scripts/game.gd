extends Node2D

# Variable values activated upon the programs start
@onready var player: Player = $Player
@onready var money_count: Label = $Player/MoneyCounter/MoneyCount
@onready var bait_count: Label = $Player/BaitCounter/BaitCount


# The first thing the program does when called
func _ready() -> void:
	player.global_position = WorldToBattle.player_pos

# What the program does every frame
func _process(delta: float) -> void:
	WorldToBattle.player_pos = player.global_position
	money_count.text = str(FishTracker.money)
	bait_count.text = str(FishTracker.octo_bait)

# Starts a battle against a freshwater fish when the player fishes in freshwater
func _on_player_fishing_freshwater() -> void:
	WorldToBattle.change_stage_freshwater()

# Starts a battle against a saltwater fish when the player fishes in saltwater
func _on_player_fishing_saltwater() -> void:
	WorldToBattle.change_stage_saltwater()
