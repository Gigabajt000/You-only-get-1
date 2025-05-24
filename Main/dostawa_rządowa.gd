extends TextureButton

func _ready() -> void:
	visible = true

func _on_pressed() -> void:
	if Global.Vdolce >= 20:
		Global.Vdolce -= 20
		Global.ilosc_przedmiotow_od_rzadu *= 2
		visible = false
