extends Node2D


@onready var tilemap = $levelcont/TileMap
@onready var player = $Player


func _on_spawn_timeout() -> void:
	print("spawned")
	player.spawned = true
	player.visible = true
