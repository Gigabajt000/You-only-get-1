extends TextureButton



#Podanie Przedmiotu Klientowi
func _on_pressed() -> void:
	#Animacja Podania Przedmiotu
	Global.Podany_Przedmiot = Global.Przedmiot
	Global.Przedmiot = ""
	Global.podany = true
	Global.Start_Timer = true
	#klient
	Global.Klient += 1
	print("numer_kienta:",Global.Klient)
	print("Dostawa:",Global.Dostawa)
	print("Dzien:",Global.Dzien)
	if Global.Klient == 5:
		Global.Dzien +=1
		Global.Klient = 0
		Global.Dostawa = true
	
