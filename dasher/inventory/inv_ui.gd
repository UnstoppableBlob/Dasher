extends Control

var is_open = false


func _ready():
	close()
	
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("inv"):
		print(is_open)
		if is_open:
			print("closed")
			close()
		else:
			print("opened")
			open()
	
	
func open():
	visible = true
	is_open = true

	
func close():
	visible = false
	is_open = false
