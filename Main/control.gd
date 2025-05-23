extends TextureButton

var stat : Resource #Laduje Resource aby wziasc z niego teksture

func _process(delta: float) -> void:
	stat = load("res://Recourses/Products/%s.tres" % Global.Przedmiot)
	if stat != null:
		texture_normal = preload("res://Maro_ZdjęcieOG.png") 
		#texture_normal = stat.Textura -------Tak Powinno Wygladac Gdy Tekstury Beda
		
		tooltip_text = stat.Tooltip

func _on_pressed() -> void:
	tooltip_text = ""
	texture_normal = null
	Global.Lista.append(Global.Przedmiot)
	Global.Przedmiot = ""
	
