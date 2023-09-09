extends Node2D
class_name TargetAcquisitionComponent #THINKING

@export var detectionAreaComponent:DetectionAreaComponent

var currentAcquiredEnemy:Node2D

func _ready() -> void:
	ConnectSignals()

func _on_entity_detected() -> void:
	#Signal func for DetectionAreaComponent
	if detectionAreaComponent.detectedEntitiesDict.size() == 1:
		AcquireFirstTarget()

func _on_entity_undetected() -> void:
	#Signal func for DetectionAreaComponent
	if detectionAreaComponent.detectedEntitiesDict.size() > 0:
			AcquireFirstTarget()
	else:
		currentAcquiredEnemy = null

func AcquireFirstTarget() -> void:
	if detectionAreaComponent:
		var detectedEntitiesDict:Dictionary = detectionAreaComponent.detectedEntitiesDict
		for entity in detectedEntitiesDict:
			currentAcquiredEnemy = detectedEntitiesDict[entity]

func ConnectSignals() -> void:
	if detectionAreaComponent:
		detectionAreaComponent.entity_detected.connect(_on_entity_detected)
		detectionAreaComponent.entity_undetected.connect(_on_entity_undetected)
