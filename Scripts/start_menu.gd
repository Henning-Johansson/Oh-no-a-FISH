extends Node2D


func _on_start_button_pressed() -> void:
	WorldToBattle._game_start()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
