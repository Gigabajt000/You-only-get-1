extends TextureButton

func _ready() -> void:
	$"../Magazyn_button".visible = true
	visible = true
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
			$"../Magazyn_button".visible = false
			visible = false
			$Timer.start()
	else:
		Global.klient_res = null
		Global.Podany_Przedmiot = Global.Przedmiot
		Global.Przedmiot = ""
		Global.podany = true
func _on_timer_timeout() -> void:
	Global.Dzien +=1
