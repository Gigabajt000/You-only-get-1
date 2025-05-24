extends Control

func _ready() -> void:
	$MarginContainer/AnimationPlayer.position.x = (Global.Dzien - 1) * 140
	$MarginContainer/AnimationPlayer.play("przesowanie")
