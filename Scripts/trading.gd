extends Node2D

# Variable values activated upon the programs start
@onready var atlantic_bass_button: Button = $CommonTradning/Buttons/AtlanticBassButton
@onready var clownfish_button: Button = $CommonTradning/Buttons/ClownfishButton
@onready var dab_button: Button = $CommonTradning/Buttons/DabButton
@onready var sea_spider_button: Button = $CommonTradning/Buttons/SeaSpiderButton
@onready var blue_gill_button: Button = $CommonTradning/Buttons/BlueGillButton
@onready var guppy_button: Button = $CommonTradning/Buttons/GuppyButton
@onready var freshwater_snail_button: Button = $CommonTradning/Buttons/FreshwaterSnailButton
@onready var axolotl_button: Button = $CommonTradning/Buttons/AxolotlButton
@onready var high_fin_banded_shark_button: Button = $CommonTradning/Buttons/HighFinBandedSharkButton
@onready var golden_tench_button: Button = $CommonTradning/Buttons/GoldenTenchButton
@onready var not_enough_fish_label: Label = $Labels/FishTradeLabel
@onready var label_timer: Timer = $Timers/Timer
@onready var common_trading: Node2D = $CommonTradning
@onready var background: Sprite2D = $TradingBackground
@onready var rare_trading: Node2D = $RareTrading
@onready var octo_bait_button: Button = $RareTrading/Buttons/OctopusBaitButton
@onready var not_enough_money_label: Label = $Labels/BaitTradeLabel
@onready var strange_trading: Node2D = $StrangeTrading
@onready var bones_button: Button = $StrangeTrading/Buttons/BoneButton
@onready var bones: Control = $StrangeTrading/Sprites/Control/Bones
@onready var bone_1: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone
@onready var bone_2: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone2
@onready var bone_3: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone3
@onready var bone_4: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone4
@onready var bone_5: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone5
@onready var bone_6: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone6
@onready var bone_7: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone7
@onready var bone_8: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone8
@onready var bone_9: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone9
@onready var bone_10: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone10
@onready var bone_11: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone11
@onready var bone_12: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone12
@onready var bone_13: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone13
@onready var bone_14: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone14
@onready var bone_15_1: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone15
@onready var bone_15_2: Sprite2D = $StrangeTrading/Sprites/Control/Bones/Bone16

# Variable value
var is_trading: bool = false

# Variable dictionary used to keep track of all the bones
var bone_dict = {"bone_1": 1, "bone_2": 2, "bone_3": 3, "bone_4": 4, 
	"bone_5": 5, "bone_6": 6, "bone_7": 7, "bone_8": 8, "bone_9": 9, 
	"bone_10": 10, "bone_11": 11, "bone_12": 12, "bone_13": 13, 
	"bone_14": 14, "bone_15_1": 15, "bone_15_2": 15}

# The first thing the program does when called
func _ready() -> void:
	not_enough_fish_label.visible = false
	not_enough_money_label.visible = false
	common_trading.visible = false
	background.visible = false
	rare_trading.visible = false

"Fish buttons"# Exchanges different fish for different amounts of money
func _on_atlantic_bass_button_pressed() -> void:
	if FishTracker.atlantic_bass_count > 0:
		FishTracker.update_count_minus("atlantic_bass")
		FishTracker.money_counter("atlantic_bass")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_clownfish_button_pressed() -> void:
	if FishTracker.clownfish_count > 0:
		FishTracker.update_count_minus("clownfish")
		FishTracker.money_counter("clownfish")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_dab_button_pressed() -> void:
	if FishTracker.dab_count > 0:
		FishTracker.update_count_minus("dab")
		FishTracker.money_counter("dab")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_sea_spider_button_pressed() -> void:
	if FishTracker.sea_spider_count > 0:
		FishTracker.update_count_minus("sea_spider")
		FishTracker.money_counter("sea_spider")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_blue_gill_button_pressed() -> void:
	if FishTracker.blue_gill_count > 0:
		FishTracker.update_count_minus("blue_gill")
		FishTracker.money_counter("blue_gill")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_guppy_button_pressed() -> void:
	if FishTracker.guppy_count > 0:
		FishTracker.update_count_minus("guppy")
		FishTracker.money_counter("guppy")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_freshwater_snail_button_pressed() -> void:
	if FishTracker.freshwater_snail_count > 0:
		FishTracker.update_count_minus("freshwater_snail")
		FishTracker.money_counter("freshwater_snail")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_axolotl_button_pressed() -> void:
	if FishTracker.axolotl_count > 0:
		FishTracker.update_count_minus("axolotl")
		FishTracker.money_counter("axolotl")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_high_fin_banded_shark_button_pressed() -> void:
	if FishTracker.high_fin_banded_shark_count > 0:
		FishTracker.update_count_minus("high_fin_banded_shark")
		FishTracker.money_counter("high_fin_banded_shark")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()


func _on_golden_tench_button_pressed() -> void:
	if FishTracker.golden_tench_count > 0:
		FishTracker.update_count_minus("golden_tench")
		FishTracker.money_counter("golden_tench")
	else:
		not_enough_fish_label.visible = true
		label_timer.start()

# What happens when the timer timesout
func _on_timer_timeout() -> void:
	not_enough_fish_label.visible = false
	not_enough_money_label.visible = false

# What the program does during a common trade
func _on_player_common_trade() -> void:
	if is_trading == false:
		common_trading.visible = true
		background.visible = true
		is_trading = true

# What the program does during a rare trade
func _on_player_rare_trade() -> void:
	if is_trading == false:
		rare_trading.visible = true
		background.visible = true
		is_trading = true

# What the program does when trading is stopped
func _on_player_stop_trade() -> void:
	if is_trading == true:
		common_trading.visible = false
		rare_trading.visible = false
		background.visible = false
		is_trading = false

# Exchanges money for octopus bait
func _on_octopus_bait_button_pressed() -> void:
	if FishTracker.money >= 2500:
		FishTracker.octo_bait += 1
		FishTracker.money -= 2500
	else:
		not_enough_money_label.visible = true
		label_timer.start()

"Bone Button Function"# Changes which bone is showed
func bone_picker() -> void:
	var bone_value = randi_range(1,15)
	#bone_dict.find_key()
