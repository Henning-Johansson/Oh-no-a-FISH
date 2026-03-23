extends Node2D

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

var is_trading: bool = false

func _ready() -> void:
	not_enough_fish_label.visible = false
	not_enough_money_label.visible = false
	common_trading.visible = false
	background.visible = false
	rare_trading.visible = false


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


func _on_timer_timeout() -> void:
	not_enough_fish_label.visible = false
	not_enough_money_label.visible = false


func _on_player_common_trade() -> void:
	if is_trading == false:
		common_trading.visible = true
		background.visible = true
		is_trading = true


func _on_player_rare_trade() -> void:
	if is_trading == false:
		rare_trading.visible = true
		background.visible = true
		is_trading = true


func _on_player_stop_trade() -> void:
	if is_trading == true:
		common_trading.visible = false
		rare_trading.visible = false
		background.visible = false
		is_trading = false


func _on_octopus_bait_button_pressed() -> void:
	if FishTracker.money >= 10000:
		FishTracker.octo_bait += 1
		FishTracker.money -= 10000
	else:
		not_enough_money_label.visible = true
		label_timer.start()
