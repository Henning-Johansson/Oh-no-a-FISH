extends Node2D

@onready var atlantic_bass: Sprite2D = $FishCanvas/AtlanticBass
@onready var clownfish: Sprite2D = $FishCanvas/Clownfish
@onready var dab: Sprite2D = $FishCanvas/Dab
@onready var sea_spider: Sprite2D = $FishCanvas/SeaSpider
@onready var blue_gill: Sprite2D = $FishCanvas/BlueGill
@onready var guppy: Sprite2D =$FishCanvas/Guppy
@onready var sea_snail: Sprite2D = $FishCanvas/SeaSnail
@onready var axolotl: Sprite2D = $FishCanvas/Axolotl
@onready var high_fin_banded_shark: Sprite2D = $FishCanvas/HighFinBandedShark
@onready var golden_tench: Sprite2D = $FishCanvas/GoldenTench


func _ready() -> void:
	atlantic_bass.modulate = Color(0,0,0,255)
	clownfish.modulate = Color(0,0,0,255)
	dab.modulate = Color(0,0,0,2)
	sea_spider.modulate = Color(0,0,0,255)
	blue_gill.modulate = Color(0,0,0,255)
	guppy.modulate = Color(0,0,0,255)
	sea_snail.modulate = Color(0,0,0,255)
	axolotl.modulate = Color(0,0,0,255)
	high_fin_banded_shark.modulate = Color(0,0,0,255)
	golden_tench.modulate = Color(0,0,0,255)
