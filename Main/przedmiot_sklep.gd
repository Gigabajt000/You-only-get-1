extends TextureButton

var Nazwa: String #Nazwa
var stats: Resource

var parent

func _ready() -> void:
	#To Działa Tylko Narazie Nie Ma Resourcesów Zrobionych --------------------
	stats = load("res://Recourses/Products/%s.tres" % Nazwa) 
	#texture_normal = stats.Textura 
	tooltip_text = stats.Tooltip


func _on_pressed() -> void:
	parent = get_node("/root/Shop-Magazyn")
	Global.Przedmiot = Nazwa
	Global.Lista.erase(Nazwa)
	get_tree().change_scene_to_file("res://Main/Main.tscn")
