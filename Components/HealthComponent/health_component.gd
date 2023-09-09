extends Node2D
class_name HealthComponent #LIMB, sense

@export var maxHealth:int = 10
@onready var currentHealth:int = maxHealth

@export var debugHealthUILabel:DebugHealthUI

signal health_updated(entityName:String, damageAmount:int, remainingHealth:int)
signal entity_death(entityName:String)


func _ready() -> void:
	UpdateDebugLabel(currentHealth)

func TakeDamage(damage:int) -> void:
	currentHealth -= damage
	
	if currentHealth <= 0:
		currentHealth = 0
		entity_death.emit(self.owner.name)
	health_updated.emit(self.owner.name, damage, currentHealth)
	
	UpdateDebugLabel(currentHealth)

func UpdateDebugLabel(newHealth:int) -> void:
	if debugHealthUILabel != null:
		debugHealthUILabel.UpdateHealthUI(newHealth)


