extends Node2D
class_name TurretGunControllerComponent

@export var turretGun:TurretGun
@export var targetTrackerComponent: TargetTrackerComponent
@export var rotateToTargetComponent: RotateToTargetComponent
@export_range(0,1) var aimOffsetToFire:float
@onready var aimOffsetInRadians:float = aimOffsetToFire * 6.28319

func _process(_delta: float) -> void:
	if targetTrackerComponent.isTargeting:
		
		var trackerRot:float = targetTrackerComponent.rotation
		var gunRot:float = rotateToTargetComponent.rotation
		
		if trackerRot < gunRot + aimOffsetInRadians and trackerRot > gunRot - aimOffsetInRadians:
			turretGun.AttemptToFire()


