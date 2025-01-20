class_name Boss
extends CharacterBody2D

@onready var _behavior_tree : BTBehaviorTree = $BTBehaviorTree
@onready var _shot_sound : AudioStreamPlayer = $Shot
@onready var _hurt_sound : AudioStreamPlayer = $Hurt

const _projectile_scene : PackedScene = preload("res://scenes/objects/projectile.tscn")

func _ready():
	_behavior_tree.blackboard["health"] = 100
	_behavior_tree.blackboard["is_fighting"] = false

func take_damage():
	_behavior_tree.blackboard["health"] -= 1
	_hurt_sound.play()
	get_tree().current_scene.set_boss_health(_behavior_tree.blackboard["health"])
	
	if _behavior_tree.blackboard["is_fighting"] == false:
		_behavior_tree.blackboard["is_fighting"] = true

func shoot(direction : Vector2):
	var projectile := _projectile_scene.instantiate()
	get_tree().current_scene.add_child(projectile)
	projectile.global_position = global_position
	projectile.setup(direction, false)
	
	_shot_sound.play()
