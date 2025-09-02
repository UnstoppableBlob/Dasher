extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var anim_player = $AnimationPlayer
@onready var dash = $Dash

@export var is_attacking = false

var dashing = false
var dash_speed = 200
var can_dash = true

var spawned = false

var enemy_in_attack_range = false
var enemy_attack_cooldown = true
var health = 100
var alive = true

func _ready() -> void:
	visible = false
	spawned = false
	dash.visible = false
	Global.player = self

func _physics_process(delta: float) -> void:
	enemy_attack()
	if spawned:
		var input_dir = Vector2.ZERO
		input_dir = Input.get_vector("left", "right", "up", "down")
		input_dir = input_dir.normalized()
		if input_dir.x != 0:
			if Input.is_action_just_pressed("attack"):
				anim_player.play("isattacking")
				anim.play("attackright")
				print("ran")
			if !is_attacking:
				anim.play("walkright")
			anim.flip_h = input_dir.x < 0
		elif input_dir.y == 1:
			if Input.is_action_just_pressed("attack"):
				anim_player.play("isattacking")
				anim.play("attackfront")
			if !is_attacking:
				anim.play("walkfront")
		elif input_dir.y == -1:
			if Input.is_action_just_pressed("attack"):
				anim_player.play("isattacking")
				anim.play("attackback")
			if !is_attacking:
				anim.play("walkback")
		else:
			if Input.is_action_just_pressed("attack"):
				anim_player.play("isattacking")
				anim.play("attackfront")
			if !is_attacking:
				anim.play("idlefront")

		if Input.is_action_just_pressed("dash") and can_dash:
			dash.emitting = true
			dash.visible = true
			dashing = true
			can_dash = false
			$Timer2.start()
			$Timer.start()

		if !dashing:
			if !is_attacking:
				velocity = input_dir * Global.player_speed
		else:
			velocity = input_dir * dash_speed
		
		print(Global.player_speed)
		
		move_and_slide()


func _on_timer_timeout() -> void:
	dashing = false
	dash.visible = false

func _on_timer_2_timeout() -> void:
	can_dash = true

func player():
	pass



func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_in_attack_range = true


func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_in_attack_range = false



func enemy_attack():
	if enemy_in_attack_range:
		print("player took damage")
