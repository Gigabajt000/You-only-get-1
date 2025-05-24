extends Control

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if Global.Dostawa == true:
		visible = true
		


func _on_texture_button_pressed() -> void:
	Global.Rzadowa_Dostawa(Global.ilosc_przedmiotow_od_rzadu)
	visible = false
	Global.Dostawa = false
