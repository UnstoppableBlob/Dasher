extends CharacterBody2D

var speed = 50
var chase = false
var player = null

var can_pick = false

var letter_list = ["res://materials/tile_0357.png", "res://materials/tile_0358.png", "res://materials/tile_0359.png", "res://materials/tile_0360.png","res://materials/tile_0361.png","res://materials/tile_0362.png", "res://materials/tile_0363.png","res://materials/tile_0364.png","res://materials/tile_0365.png"
	, "res://materials/tile_0366.png", "res://materials/tile_0392.png", "res://materials/tile_0393.png",
	"res://materials/tile_0393.png", "res://materials/tile_0394.png", "res://materials/tile_0395.png",
	"res://materials/tile_0396.png", "res://materials/tile_0397.png", "res://materials/tile_0398.png", 
	"res://materials/tile_0399.png", "res://materials/tile_0400.png", "res://materials/tile_0428.png",
	"res://materials/tile_0427.png", "res://materials/tile_0429.png", "res://materials/tile_0430.png",
	"res://materials/tile_0431.png", "res://materials/tile_0432.png", "res://materials/tile_0433.png",]

var alive = true

var health = 60
var player_in_attack_zone = false

@export var item: InvItem

@onready var e_popup = $e_popup

func _ready() -> void:
	rotation = 0

func _physics_process(delta: float) -> void:
	if alive:
		update_health()
		if chase:
			position += (player.position - position)/speed
			$AnimatedSprite2D.play("walk")
			
			if (player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("idle")
	else:
		if can_pick:
			if Input.is_action_just_pressed("pick"):
				Global.progress += 1
				Global.player.collect(item)
				$AnimationPlayer.play("die")


func _on_detection_area_body_entered(body: Node2D) -> void:
	if alive:
		if body is CharacterBody2D:
			player = body
			chase = true
		


func _on_detection_area_body_exited(body: Node2D) -> void:
	if alive:
		if body is CharacterBody2D:
			player = null
			chase = false
		
		
func enemy():
	pass



func damage():
	if alive:
		health -= 20
		print("slime health = ", health)
		if health <= 0:
			print(health)
			die()
		


func _on_hitbox_enemy_area_entered(area: Area2D) -> void:
	if alive:
		if area.is_in_group("player_attack"):
			player_in_attack_zone = false
			damage()
	else:
		if area.is_in_group("player_hitbox"):
			e_popup.visible = true
			can_pick = true


func _on_hitbox_enemy_area_exited(area: Area2D) -> void:
	if alive:
		if area.is_in_group("player_attack"):
			player_in_attack_zone = true
	else:
		if area.is_in_group("player_hitbox"):
			e_popup.visible = false
	
	
func update_health():
	if alive:
		var healthbar = $healthbar
		healthbar.value = health
		
		if health >= 60:
			healthbar.visible = false
		else:
			healthbar.visible = true



func die():
	alive = false
	$healthbar.visible = false
	$detection_area/CollisionShape2D.disabled = true
	$AnimatedSprite2D.visible = false
	$hitbox_enemy/CollisionShape2D.disabled = true
	$CollisionShape2D.disabled = true
	var letter = $letter
	
	
	
	var random = load(letter_list.pick_random())
	
	item.texture = random
	
	letter.texture = random
	
	letter.visible = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "die":
		self.queue_free()
