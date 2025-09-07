extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Play.pressed.connect(play)
	%Quit.pressed.connect(quit_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func play():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func quit_game():
	get_tree().quit()
