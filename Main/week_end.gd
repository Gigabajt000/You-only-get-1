extends Control

func _ready() -> void:
	$AnimationPlayer/Node2D.position.x = (Global.Dzien - 1) * 140
	$AnimationPlayer.play("przesowanie")
