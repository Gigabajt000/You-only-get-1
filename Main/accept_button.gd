extends TextureButton

#Podanie Przedmiotu Klientowi
func _on_pressed() -> void:
	#Animacja Podania Przedmiotu
	Global.Podany_Przedmiot = Global.Przedmiot
	Global.Przedmiot = ""
	Global.podany = true
