extends Node2D


var player_current_attack = false

var progress = 0

@onready var tilemap = $levelcont/TileMap
@onready var player = $Player
@onready var spawn_timer = $Spawn

var player_speed = 50

func _on_spawn_timeout() -> void:
	print("spawned")
	player.spawned = true
	player.visible = true


func _process(delta: float) -> void:
	if progress == 2:
		finish()


func finish():
	print(progress)
