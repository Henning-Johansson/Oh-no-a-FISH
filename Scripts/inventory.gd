extends Node2D


@onready var inv = $"."
@onready var canvas = $FishCanvas
@onready var atlantic_bass: Sprite2D = $FishCanvas/AtlanticBass
@onready var clownfish: Sprite2D = $FishCanvas/Clownfish
@onready var dab: Sprite2D = $FishCanvas/Dab
@onready var sea_spider: Sprite2D = $FishCanvas/SeaSpider
@onready var blue_gill: Sprite2D = $FishCanvas/BlueGill
@onready var guppy: Sprite2D =$FishCanvas/Guppy
@onready var freshwater_snail: Sprite2D = $FishCanvas/FreshwaterSnail
@onready var axolotl: Sprite2D = $FishCanvas/Axolotl
@onready var high_fin_banded_shark: Sprite2D = $FishCanvas/HighFinBandedShark
@onready var golden_tench: Sprite2D = $FishCanvas/GoldenTench
@onready var atlantic_bass_amount: Label = $Control/Label
@onready var clownfish_amount: Label = $Control/Label2
@onready var dab_amount: Label = $Control/Label3
@onready var sea_spider_amount: Label = $Control/Label4
@onready var blue_gill_amount: Label = $Control/Label5
@onready var guppy_amount: Label = $Control/Label6
@onready var freshwater_snail_amount: Label = $Control/Label7
@onready var axolotl_amount: Label = $Control/Label8
@onready var high_fin_bande_shark_amount: Label = $Control/Label9
@onready var golden_tench_amount: Label = $Control/Label10

var inventory_accessed: bool = false

func _ready() -> void:
	inventory_accessed = false
	inv.visible = false
	canvas.visible = false
	if FishTracker.atlantic_bass_caught == false:
		atlantic_bass.modulate = Color(0,0,0,255)
	if FishTracker.axolotl_caught == false:
		axolotl.modulate = Color(0,0,0,255)
	if FishTracker.blue_gill_caught == false:
		blue_gill.modulate = Color(0,0,0,255)
	if FishTracker.clownfish_caught == false:
		clownfish.modulate = Color(0,0,0,255)
	if FishTracker.dab_caught == false:
		dab.modulate = Color(0,0,0,255)
	if FishTracker.freshwater_snail_caught == false:
		freshwater_snail.modulate = Color(0,0,0,255)
	if FishTracker. golden_tench_caught == false:
		golden_tench.modulate = Color(0,0,0,255)
	if FishTracker. guppy_caught == false:
		guppy.modulate = Color(0,0,0,255)
	if FishTracker.high_fin_banded_shark_caught == false:
		high_fin_banded_shark.modulate = Color(0,0,0,255)
	if FishTracker.sea_spider_caught == false:
		sea_spider.modulate = Color(0,0,0,255)

func _process(delta: float) -> void:
	atlantic_bass_amount.text = str(FishTracker.atlantic_bass_count)
	axolotl_amount.text = str(FishTracker.axolotl_count)
	blue_gill_amount.text = str(FishTracker.blue_gill_count)
	clownfish_amount.text = str(FishTracker.clownfish_count)
	dab_amount.text = str(FishTracker.dab_count)
	freshwater_snail_amount.text = str(FishTracker.freshwater_snail_count)
	golden_tench_amount.text = str(FishTracker.golden_tench_count)
	guppy_amount.text = str(FishTracker.guppy_count)
	high_fin_bande_shark_amount.text = str(FishTracker.high_fin_banded_shark_count)
	sea_spider_amount.text = str(FishTracker.sea_spider_count)



func _on_player_inventory() -> void:
	if inventory_accessed == false:
		inv.visible = true
		canvas.visible = true
		inventory_accessed = true
	elif inventory_accessed == true:
		inv.visible = false
		canvas.visible = false
		inventory_accessed = false
