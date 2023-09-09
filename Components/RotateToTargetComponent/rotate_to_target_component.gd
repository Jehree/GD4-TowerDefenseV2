extends Node2D
class_name RotateToTargetComponent #THINKING

@export var turnSpeed:float
@export var target:Node2D

func _process(delta: float) -> void:
	
	if target.rotation > self.rotation:
		rotate(turnSpeed * delta)
	elif target.rotation < self.rotation:
		rotate(-turnSpeed * delta)


