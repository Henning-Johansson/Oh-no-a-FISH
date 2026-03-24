extends Node2D

# What the program does when the start button is pressed
func _on_start_button_pressed() -> void:
	WorldToBattle._game_start()

# What the program does when the quit button is pressed
func _on_quit_button_pressed() -> void:
	get_tree().quit()
