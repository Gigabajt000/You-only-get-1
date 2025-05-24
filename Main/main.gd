extends Node2D

var dzien : int 

func _ready() -> void:
	dzien = Global.Dzien

func _process(delta: float) -> void:
	if dzien != Global.Dzien:
		dzien = Global.Dzien
		get_tree().change_scene_to_file("res://Main/week_end.tscn")


func _on_timer_timeout() -> void:
	pass # Replace with function body.
