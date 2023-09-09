extends Area2D
class_name DetectionAreaComponent #SENSE

#this component is a "LIMB", It should be USED by other "THINKING" components
#AVOID making this component control any others

@export var groupsToDetect:Array[String]
var detectedEntitiesDict:Dictionary = {}

signal entity_detected
signal entity_undetected

func _ready() -> void:
	VerifyShape2DExists()


func _on_area_entered(area: Area2D) -> void:
	var entityNode:Node2D = area.owner
	var entityID := entityNode.get_instance_id()
	
	
	for group in groupsToDetect:
		if entityNode.is_in_group(group):
			detectedEntitiesDict[entityID] = entityNode
			entity_detected.emit()
			break


func _on_area_exited(area: Area2D) -> void:
	var entityNode:Node2D = area.owner
	var entityID := entityNode.get_instance_id()
	
	for group in groupsToDetect:
		if entityNode.is_in_group(group):
			detectedEntitiesDict.erase(entityID)
			entity_undetected.emit()
			break


func VerifyShape2DExists() -> void:
	var childrenOfArea2D:Array = self.get_children()
	var collisionShape2DCounter:int = 0
	
	for child in childrenOfArea2D:
		if child.get_class() == "CollisionShape2D":
			collisionShape2DCounter += 1
	
	if collisionShape2DCounter > 1:
		assert(false, self.name + " must have exactly 1 CollisionShape2D node as a child!")


