extends Control

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if Global.Dostawa == true:
		visible = true

func _on_pressed() -> void:
	Global.Rzadowa_Dostawa(Global.ilosc_przedmiotow_od_rzadu)
	visible = false
	Global.Dostawa = false
	Global.ilosc_przedmiotow_od_rzadu = Global.deafultowa_ilosc
	get_tree().reload_current_scene()
