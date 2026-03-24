extends Node2D

# Variable values
var stage = "game"
var player_pos = Vector2(0,0)
var battle_type = "saltwater"
var trading_rarity = "none"
var can_do_trade = false
var is_speaking = false

# Variable value activated upon the programs start
@onready var anim: AnimationPlayer = $AnimationPlayer

# What the program does when the player fishes in saltwater with or without octopus bait
func change_stage_saltwater()-> void:
	if FishTracker.octo_bait > 0:
		FishTracker.octo_bait -= 1
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
			battle_type = "saltwater"
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

# What the program does when the player fishes in freshwater
func change_stage_freshwater() -> void:
	if stage == "game":
		battle_type = "freshwater"
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

# What the program does when the games is started
func _game_start() -> void:
	anim.play("fade_in")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	anim.play("fade_out")

# How the program keeps track of which trading rarity is being used
func _trade_rarity(rarity:String) -> void:
	if rarity == "common":
		trading_rarity = "common"
	elif rarity == "rare":
		trading_rarity = "rare"
	elif rarity == "none" and can_do_trade == false:
		trading_rarity = "none"
