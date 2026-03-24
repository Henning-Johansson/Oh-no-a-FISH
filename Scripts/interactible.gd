extends Area2D

# Variables
var partner

# Signals
signal do_interact
signal stop_interact

# What the program does when it is entered by something
func _on_area_entered(area: Area2D) -> void:
	partner = true

# What the program does when afformentioned something leaves it
func _on_area_exited(area: Area2D) -> void:
	partner = false

# Emits a signal to start something
func _interact():
	emit_signal("do_interact")

# Emits a signal to stop something
func _not_interact():
	emit_signal("stop_interact")

# What the program does every frame
func _process(delta: float) -> void:
	if partner:
		_interact()
	else:
		_not_interact()
