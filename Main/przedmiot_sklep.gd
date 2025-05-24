extends TextureButton

var Nazwa: String #Nazwa
var stats: Resource

func _ready() -> void:
	#To Działa Tylko Narazie Nie Ma Resourcesów Zrobionych --------------------
	stats = load("res://Recourses/Products/%s.tres" % Nazwa) 
	texture_normal = stats.Textura 
	scale = Vector2(2,2)
	tooltip_text = stats.Tooltip


func _on_pressed() -> void:
	if Global.Przedmiot != "":
		Global.Lista.append(Global.Przedmiot)
	Global.Przedmiot = Nazwa
	Global.Lista.erase(Nazwa)
	get_tree().change_scene_to_file("res://Main/Main.tscn")
