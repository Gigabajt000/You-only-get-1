extends Label



func _ready() -> void:
	visible = false
	
	

func _process(delta: float) -> void:
	position.x = 772.0
	position.y = 50
	text = str(Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs)
	if Global.punkty_po_podaniu * 10 < 0:
		label_settings.font_color = Color(1,0,0)
	else:
		label_settings.font_color = Color(0,1,0)
		
	if Global.Start_Timer == true:
		var tween = create_tween()
		modulate.a = 1
		Global.Start_Timer = false
		$Timer.start()
		visible = true
		tween.set_parallel(true) 
		tween.tween_property($".","global_position",Vector2(772,10),1)
		tween.tween_property($".","modulate:a",0,1)

func _on_timer_timeout() -> void:
	visible = false
