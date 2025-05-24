extends TextureButton


func _on_pressed() -> void:
	Global.Zarobione_Pieniadze = 0
	if Global.Dzien == 6:
		Global.Play_End = true
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Main/Main.tscn")
	
