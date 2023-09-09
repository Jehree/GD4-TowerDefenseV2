extends Node2D

var enemyPath:Path2D
@export var enemyToInstantiate:PackedScene

func _ready() -> void:
	InitPath2D()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		InstantiateEnemy()

func InstantiateEnemy() -> void:
	var enemyInstance:Node2D = enemyToInstantiate.instantiate()
	enemyPath.add_child(enemyInstance)

func InitPath2D() -> void:
	var childrenOfSpawner:Array = self.get_children()
	var path2DCounter:int = 0
	
	for child in childrenOfSpawner:
		if child.get_class() == "Path2D":
			path2DCounter += 1
			enemyPath = get_node(child.get_path())
	
	if path2DCounter != 1:
		assert(false, self.name + " must have exactly 1 Path2D node as a child!")

