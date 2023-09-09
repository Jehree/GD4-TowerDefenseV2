extends Node2D #INDEPENDENT LIMB

@export var moveSpeed:float = 100
@onready var pathFollow:PathFollow2D = self.owner

func _process(delta: float) -> void:
	pathFollow.progress += moveSpeed * delta
