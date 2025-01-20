extends Area2D

@onready var _sprite : Sprite2D = $Sprite2D

var _direction : Vector2
var _is_friendly : bool # if true hurts the boss, if false hurts the player
const _speed : float = 180.0

func setup(direction : Vector2, is_friendly : bool):
	_direction = direction
	_is_friendly = is_friendly
	
	if _is_friendly == false:
		_sprite.region_rect.position.x = 32.0

func _physics_process(delta : float):
	position += _direction * _speed * delta

func _on_body_entered(body : Node2D):
	if body is Player && _is_friendly == false:
		body.take_damage()
		queue_free()
	elif body is Boss && _is_friendly:
		body.take_damage()
		queue_free()

func _on_life_timer_timeout():
	queue_free()
