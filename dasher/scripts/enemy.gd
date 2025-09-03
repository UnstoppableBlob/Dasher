extends CharacterBody2D

var speed = 50
var chase = false
var player = null

var health = 50
var player_in_attack_zone = false

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
		
		
func enemy():
	pass



func damage():
	health -= 20
	print("slime health = ", health)
	if health <= 0:
		self.queue_free()
		


func _on_hitbox_enemy_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_attack"):
		player_in_attack_zone = false
		damage()


func _on_hitbox_enemy_area_exited(area: Area2D) -> void:
	if area.is_in_group("player_attack"):
		player_in_attack_zone = true
