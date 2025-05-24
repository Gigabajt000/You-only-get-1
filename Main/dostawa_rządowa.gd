extends TextureButton

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	visible = true

func _on_pressed() -> void:
	if Global.Vdolce >= 20:
		Global.Vdolce -= 20
		Global.ilosc_przedmiotow_od_rzadu *= 2
		visible = false

var tween: Tween


func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func _on_mouse_entered():
	reset_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.05)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.2)

func _on_mouse_exited():
	reset_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
