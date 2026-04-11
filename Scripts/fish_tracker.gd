extends Node2D

"Variable values"# Variable values were divided into to groups due to there being so many
# Bool variable values
var atlantic_bass_caught: bool = false
var axolotl_caught: bool = false
var blue_gill_caught: bool = false
var clownfish_caught: bool = false
var dab_caught: bool = false
var freshwater_snail_caught: bool = false
var golden_tench_caught: bool = false
var guppy_caught: bool = false
var high_fin_banded_shark_caught: bool = false
var sea_spider_caught: bool = false
var octopus_caught: bool = false
var bone_fish_caught: bool = false
var inventory_open: bool = false


# Integer variable values
var atlantic_bass_count: int = 0
var axolotl_count: int = 0
var blue_gill_count: int = 0
var clownfish_count: int = 0
var dab_count: int = 0
var freshwater_snail_count: int = 0
var golden_tench_count: int = 0
var guppy_count: int = 0
var high_fin_banded_shark_count: int = 0
var sea_spider_count: int = 0
var money: int = 0
var octo_bait: int = 0
var octopus_count: int = 0
var bones: int = 0
var bone_fish_count: int = 0

# Updates each fishes icon in the inventory
func update_icon(fish: String) -> void:
	if fish == "atlantic_bass":
		atlantic_bass_caught = true
	elif fish == "axolotl":
		axolotl_caught = true
	elif fish == "blue_gill":
		blue_gill_caught = true
	elif fish == "clownfish":
		clownfish_caught = true
	elif fish == "dab":
		dab_caught = true
	elif fish == "freshwater_snail":
		freshwater_snail_caught = true
	elif fish == "golden_tench":
		golden_tench_caught = true
	elif fish == "guppy":
		guppy_caught = true
	elif fish == "high_fin_banded_shark":
		high_fin_banded_shark_caught = true
	elif fish == "sea_spider":
		sea_spider_caught = true
	elif fish == "octopus":
		octopus_caught = true
	elif fish == "bone_fish":
		bone_fish_caught = true

# Increases the amount of fish the player has
func update_count_plus(fish: String) -> void:
	if fish == "atlantic_bass":
		atlantic_bass_count += 1
	elif fish == "axolotl":
		axolotl_count += 1
	elif fish == "blue_gill":
		blue_gill_count += 1
	elif fish == "clownfish":
		clownfish_count += 1
	elif fish == "dab":
		dab_count += 1
	elif fish == "freshwater_snail":
		freshwater_snail_count += 1
	elif fish == "golden_tench":
		golden_tench_count += 1
	elif fish == "guppy":
		guppy_count += 1
	elif fish == "high_fin_banded_shark":
		high_fin_banded_shark_count += 1
	elif fish == "sea_spider":
		sea_spider_count += 1
	elif fish == "octopus":
		octopus_count += 1
	elif fish == "bone_fish":
		bone_fish_count += 1

# Decreases the amount of fish the player has
func update_count_minus(fish: String) -> void:
	if fish == "atlantic_bass":
		atlantic_bass_count -= 1
	elif fish == "axolotl":
		axolotl_count -= 1
	elif fish == "blue_gill":
		blue_gill_count -= 1
	elif fish == "clownfish":
		clownfish_count -= 1
	elif fish == "dab":
		dab_count -= 1
	elif fish == "freshwater_snail":
		freshwater_snail_count -= 1
	elif fish == "golden_tench":
		golden_tench_count -= 1
	elif fish == "guppy":
		guppy_count -= 1
	elif fish == "high_fin_banded_shark":
		high_fin_banded_shark_count -= 1
	elif fish == "sea_spider":
		sea_spider_count -= 1

# Increases the amount of mony the player has
func money_counter(fish: String) -> void:
	if fish == "atlantic_bass":
		money += 100
	elif fish == "axolotl":
		money += 200
	elif fish == "blue_gill":
		money += 100
	elif fish == "clownfish":
		money += 100
	elif fish == "dab":
		money += 100
	elif fish == "freshwater_snail":
		money += 200
	elif fish == "golden_tench":
		money += 200
	elif fish == "guppy":
		money += 200
	elif fish == "high_fin_banded_shark":
		money += 200
	elif fish == "sea_spider":
		money += 100
