extends TextureButton

var stat : Resource #Laduje Resource aby wziasc z niego teksture

func _process(delta: float) -> void:
	if Global.Przedmiot != "":
		stat = load("res://Recourses/Products/%s.tres" % Global.Przedmiot)
	if stat != null:
		
		texture_normal = preload("res://Maro_ZdjęcieOG.png") 
		#texture_normal = stat.Textura -------> Tak Powinno Wygladac Gdy Tekstury Beda
		
		tooltip_text = stat.Tooltip
		
	if Global.Przedmiot == "":
		tooltip_text = ""
		texture_normal = null

func _on_pressed() -> void:
	Global.Lista.append(Global.Przedmiot)
	Global.Przedmiot = ""
	
