extends Node2D


var stage = "game"
var player_pos = Vector2(0,0)

@onready var anim: AnimationPlayer = $AnimationPlayer


func change_stage()-> void:
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
