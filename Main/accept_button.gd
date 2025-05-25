extends TextureButton

func _ready() -> void:
	$"../Magazyn_Button".visible = true
	visible = true
	
func _process(delta: float) -> void:
	if $"../Control".texture_normal == null:
		texture_normal = preload("res://Art/UI/pass_button.png")
		texture_hover = preload("res://Art/UI/pass_button_hover.png")
		texture_pressed = preload("res://Art/UI/pass_button_pressed.png")
	else:
		texture_normal = preload("res://Art/UI/accept_button.png")
		texture_hover = preload("res://Art/UI/accept_button_hover.png")
		texture_pressed = preload("res://Art/UI/accept_button_pressed.png")

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
		if Global.Klient == 5:
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
