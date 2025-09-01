extends Node2D


@onready var tilemap = $levelcont/TileMap
@onready var player = $Player
@onready var spawn_timer = $Spawn

var player_speed = 50

func _on_spawn_timeout() -> void:
	print("spawned")
	player.spawned = true
	player.visible = true
