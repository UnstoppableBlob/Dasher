extends SubViewport


@onready var player: CharacterBody2D = $"../../../Player"
@onready var cam: Camera2D = $Camera2D

func _ready():
	world_2d = get_tree().root.world_2d
	
func _physics_process(delta: float) -> void:
	cam.global_position = player.global_position
