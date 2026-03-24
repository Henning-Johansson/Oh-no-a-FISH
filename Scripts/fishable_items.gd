extends Node2D
class_name Fishables

# Variable values activated upon the programs start
@onready var fishable_items: Sprite2D = $FishableItemSprite
@onready var fish_name: Label = $FishName

# Signals
signal atlantic_bass
signal clownfish
signal dab
signal sea_spider
signal blue_gill
signal guppy
signal freshwater_snail
signal axolotl
signal high_fin_banded_shark
signal golden_tench

# Variable dictionary used to keep track of all the fish
var fish_name_dict = {"Atlantic Bass": 0, "Clownfish": 1, "Dab": 2,
	"Sea Spider": 3, "Blue Gill": 4, "Guppy": 5, "Freshwater Snail": 6,
	"Axolotl": 7, "High Fin Banded Shark": 8, "Golden Tench": 9}


# Decides which fish to fight when fishing in salwater
func _on_battle_stage_fighting_saltwater() -> void:
	var what_fish = randi_range(0, 3)
	fishable_items.frame = what_fish
	fish_name.text = fish_name_dict.find_key(what_fish)
	if what_fish == 0:
		emit_signal("atlantic_bass")
	elif what_fish == 1:
		emit_signal("clownfish")
	elif what_fish == 2:
		emit_signal("dab")
	elif what_fish == 3:
		emit_signal("sea_spider")

# Decides which fish to fight when fishing in freshwater
func _on_battle_stage_fighting_freshwater() -> void:
	var what_fish = randi_range(4, 9)
	fishable_items.frame = what_fish
	fish_name.text = fish_name_dict.find_key(what_fish)
	if what_fish == 4:
		emit_signal("blue_gill")
	elif what_fish == 5:
		emit_signal("guppy")
	elif what_fish == 6:
		emit_signal("freshwater_snail")
	elif what_fish == 7:
		emit_signal("axolotl")
	elif what_fish == 8:
		emit_signal("high_fin_banded_shark")
	elif what_fish == 9:
		emit_signal("golden_tench")
