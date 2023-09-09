extends Node2D

@export var healthComponent:HealthComponent

func _process(_delta: float) -> void:
	if healthComponent and Input.is_action_just_pressed("ui_text_backspace"):
		healthComponent.TakeDamage(1)
		
		if healthComponent.currentHealth <= 0:
			owner.queue_free()
