extends Node2D


var stage = "game"
var player_pos = Vector2(0,0)
var boss_stage: bool = false

@onready var anim: AnimationPlayer = $AnimationPlayer


func change_stage()-> void:
	if (FishTracker.atlantic_bass_caught and FishTracker.axolotl_caught 
	and FishTracker.bluegill_caught and FishTracker.clownfish_caught 
	and FishTracker.dab_caught and FishTracker.freshwater_snail_caught 
	and FishTracker.golden_tench_caught and FishTracker.guppy_caught 
	and FishTracker.high_fin_banded_shark_caught and FishTracker.sea_spider_caught):
		if stage == "game":
			anim.play("fade_in")
			await anim.animation_finished
			get_tree().change_scene_to_file("res://Scenes/boss_battle.tscn")
			stage = "battle"
			anim.play("fade_out")
		else:
			anim.play("fade_in")
			await anim.animation_finished
			get_tree().change_scene_to_file("res://Scenes/game.tscn")
			stage = "game"
			anim.play("fade_out")
	elif boss_stage:
		if stage == "game":
			anim.play("fade_in")
			await anim.animation_finished
			get_tree().change_scene_to_file("res://Scenes/boss_battle.tscn")
			stage = "battle"
			anim.play("fade_out")
		else:
			anim.play("fade_in")
			await anim.animation_finished
			get_tree().change_scene_to_file("res://Scenes/game.tscn")
			stage = "game"
			anim.play("fade_out")
	else:
		if stage == "game":
			anim.play("fade_in")
			await anim.animation_finished
			get_tree().change_scene_to_file("res://Scenes/battle_stage.tscn")
			stage = "battle"
			anim.play("fade_out")
		else:
			anim.play("fade_in")
			await anim.animation_finished
			get_tree().change_scene_to_file("res://Scenes/game.tscn")
			stage = "game"
			anim.play("fade_out")


func _game_start() -> void:
	anim.play("fade_in")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	anim.play("fade_out")
	
