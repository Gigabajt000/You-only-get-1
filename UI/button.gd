extends TextureButton

var tween: Tween

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


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
