extends Label

func _ready() -> void:
	if Global.Zarobione_Pieniadze < 0:
		label_settings.font_color = Color(1,0,0)
	else:
		label_settings.font_color = Color(0,1,0)
	text = str(Global.Zarobione_Pieniadze)
