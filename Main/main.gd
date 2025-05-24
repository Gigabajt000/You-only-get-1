extends Node2D

var dzien : int 

func _ready() -> void:
	dzien = Global.Dzien

func _process(delta: float) -> void:
	if dzien != Global.Dzien:
		dzien = Global.Dzien
		Transition.transition()
		await Transition.on_transition_finished
		get_tree().change_scene_to_file("res://Main/week_end.tscn")
