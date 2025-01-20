extends Node2D

@onready var player : Player = $Player
@onready var boss : Boss = $Boss

@onready var _player_health : Label = $CanvasLayer/MarginContainer/PlayerHealth
@onready var _progress_bar : ProgressBar = $CanvasLayer/MarginContainer/ProgressBar


func set_player_health(health : int):
	_player_health.text = "Health: " + str(health)

func set_boss_health(health : int):
	_progress_bar.value = health
