extends Area2D

#variables
var partner

#signals
signal do_interact
signal stop_interact

func _on_area_entered(area: Area2D) -> void:
	partner = true


func _on_area_exited(area: Area2D) -> void:
	partner = false


func _interact():
	emit_signal("do_interact")

func _not_interact():
	emit_signal("stop_interact")


func _process(delta: float) -> void:
	if partner:
		_interact()
	else:
		_not_interact()
