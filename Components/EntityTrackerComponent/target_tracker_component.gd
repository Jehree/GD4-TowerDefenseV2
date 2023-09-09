extends Node2D
class_name TargetTrackerComponent #LIMB

@export var targetAcquisitionComponent:TargetAcquisitionComponent
var isTargeting:bool

func _process(_delta: float) -> void:
	if targetAcquisitionComponent and targetAcquisitionComponent.currentAcquiredEnemy:
		isTargeting = true
		look_at(targetAcquisitionComponent.currentAcquiredEnemy.global_position)
	elif isTargeting:
		isTargeting = false
