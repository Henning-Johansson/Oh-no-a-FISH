extends CharacterBody2D
class_name Player

@onready var anim = $AnimationPlayer

#constants
const MAX_SPEED = 400
const ACC = 2000


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = velocity.move_toward(direction*MAX_SPEED, ACC*delta)
	
	#Moves the player
	move_and_slide()
