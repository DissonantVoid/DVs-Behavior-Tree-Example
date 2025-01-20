class_name Player
extends CharacterBody2D

@onready var _camera : Camera2D = $Camera2D
@onready var _gun_sprite : Sprite2D = $Gun
@onready var _shot_cooldown_timer : Timer = $ShotCooldown
@onready var _damage_cooldown_timer : Timer = $DamageCooldown

@onready var _shot_sound : AudioStreamPlayer = $Shot
@onready var _hurt_sound : AudioStreamPlayer = $Hurt

const _projectile_scene : PackedScene = preload("res://scenes/objects/projectile.tscn")

const _speed = 300.0
var _health : int = 4

const _camera_mouse_offset : float = 120.0
const _gun_mouse_offset : float = 38.0

func _physics_process(delta : float):
	# movement
	var input : Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	if input:
		velocity = input * _speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
	# camera offset
	var camera_direction : Vector2 = get_global_mouse_position() - global_position
	_camera.position = lerp(_camera.position, _camera_mouse_offset * camera_direction.normalized(), 2.0 * delta)
	
	# gun offset
	_gun_sprite.rotation = camera_direction.angle()
	_gun_sprite.position = _gun_mouse_offset * camera_direction.normalized()
	
	# shooting
	if Input.is_action_just_pressed("shoot") && _shot_cooldown_timer.is_stopped():
		var projectile := _projectile_scene.instantiate()
		get_tree().current_scene.add_child(projectile)
		projectile.global_position = _gun_sprite.global_position
		projectile.setup(camera_direction.normalized(), true)
		
		_shot_sound.play()
		_shot_cooldown_timer.start()

func take_damage():
	if _damage_cooldown_timer.is_stopped() == false:
		return
	
	_health -= 1
	_hurt_sound.play()
	get_tree().current_scene.set_player_health(_health)
	
	_damage_cooldown_timer.start()
	if _health == 0.0:
		get_tree().reload_current_scene()
