extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("back"):
		get_tree().change_scene_to_file("res://UI/Main Menu/main_menu.tscn")

func _on_back_pressed() -> void:
	AudioManager.menu_button_down.play()
	get_tree().change_scene_to_file("res://UI/Main Menu/main_menu.tscn")

func _ready() -> void:
	AudioManager.find_and_connect_buttons(get_tree().root)
