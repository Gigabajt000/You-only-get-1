extends TextureButton

var stat : Resource #Laduje Resource aby wziasc z niego teksture

func _process(delta: float) -> void:
	if Global.Przedmiot != "":
		stat = load("res://Recourses/Products/%s.tres" % Global.Przedmiot)
	if stat != null:
		
		texture_normal = stat.Textura 
		
		tooltip_text = stat.Tooltip
		
	if Global.Przedmiot == "":
		tooltip_text = ""
		texture_normal = null

func _on_pressed() -> void:
	Global.Lista.append(Global.Przedmiot)
	Global.Przedmiot = ""
	
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
