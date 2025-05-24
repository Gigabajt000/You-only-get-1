extends TextureButton

func _ready() -> void:
	$"../Magazyn_Button".visible = true
	visible = true
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

#Podanie Przedmiotu Klientowi
func _on_pressed() -> void:
	#Animacja Podania Przedmiotu
	if Global.Play_Tutorial == false:
		Global.klient_res = null
		Global.Podany_Przedmiot = Global.Przedmiot
		Global.Przedmiot = ""
		Global.podany = true
		Global.Start_Timer = true
		#klient
		Global.Klient += 1
		if Global.Klient == 5:
			Global.Klient = 0
			Global.Dostawa = true
			$"../Magazyn_Button".visible = false
			visible = false
			$Timer.start()
	else:
		Global.klient_res = null
		Global.Podany_Przedmiot = Global.Przedmiot
		Global.Przedmiot = ""
		Global.podany = true
func _on_timer_timeout() -> void:
	Global.Dzien +=1

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
