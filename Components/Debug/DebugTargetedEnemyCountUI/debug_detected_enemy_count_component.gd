extends Label
class_name DebugDetectionAreaUI

@export var detectionAreaComponent:DetectionAreaComponent

func _ready() -> void:
	ConnectSignals()

func _on_entity_detected() -> void:
	#Signal func for DetectionAreaComponent
	UpdateEnemyCountUI()

func _on_entity_undetected() -> void:
	#Signal func for DetectionAreaComponent
	UpdateEnemyCountUI()


func UpdateEnemyCountUI() -> void:
	self.text = "# of Enemies: " + str(detectionAreaComponent.detectedEntitiesDict.size())

func ConnectSignals() -> void:
	if detectionAreaComponent:
		detectionAreaComponent.entity_detected.connect(_on_entity_detected)
		detectionAreaComponent.entity_undetected.connect(_on_entity_undetected)
