extends Node2D


var stage = "game"
var player_pos = Vector2(0,0)
var boss_stage: bool = false
var battle_type = "saltwater"
var trading_rarity = "none"
var can_do_trade = false
var is_speaking = false


@onready var anim: AnimationPlayer = $AnimationPlayer

func change_stage() -> void:
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

func _game_start() -> void:
	anim.play("fade_in")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	anim.play("fade_out")


func _trade_rarity(rarity:String) -> void:
	if rarity == "common":
		trading_rarity = "common"
	elif rarity == "rare":
		trading_rarity = "rare"
	elif rarity == "none" and can_do_trade == false:
		trading_rarity = "none"


func _guide_speech_start() -> void:
	pass


func _guide_speech_stop() -> void:
	pass
