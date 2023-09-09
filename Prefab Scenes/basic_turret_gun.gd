extends TurretGun #LIMB

@onready var fireCooldownTimer:Timer = $FireCooldownTimer

@export var fireCooldown:float = 1

var fireOnCooldown:bool = false

func _ready() -> void:
	fireCooldownTimer.wait_time = fireCooldown

func AttemptToFire() -> void:
	if !fireOnCooldown:
		print("Shot fired!")
		fireOnCooldown = true
		fireCooldownTimer.start()

func _on_fire_cooldown_timer_timeout() -> void:
	fireOnCooldown = false
