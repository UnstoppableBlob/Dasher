extends CharacterBody2D

var speed = 50
var chase = false
var player = null


func _physics_process(delta: float) -> void:
	if chase:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk")
		
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player = body
		chase = true
		


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player = null
		chase = false
