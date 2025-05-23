extends Label

func _process(delta: float) -> void:
	text = str(Global.punkty_po_podaniu * 10)
	if Global.punkty_po_podaniu * 10 < 0:
		label_settings.font_color = Color(1,0,0)
	else:
		label_settings.font_color = Color(0,1,0)
		
	if Global.Start_Timer == true:
		Global.Start_Timer = false
		$Timer.start()
		visible = true
		

func _on_timer_timeout() -> void:
	visible = false
