extends Line2D

@onready var length : = 10

@onready var parent:CharacterBody2D = get_parent()
var offset := Vector2.ZERO

func _ready():
	offset = position
	top_level = true
	
func _physics_process(delta: float) -> void:
	var point = position + offset
	add_point(point, 0)
	if get_point_count() > length: remove_point(get_point_count() - 1)
