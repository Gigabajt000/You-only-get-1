extends Control

func _ready() -> void:
	AudioManager.find_and_connect_buttons(get_tree().root)
	$AnimationPlayer/Node2D.position.x = (Global.Dzien - 1) * 140
	$AnimationPlayer.play("przesowanie")
