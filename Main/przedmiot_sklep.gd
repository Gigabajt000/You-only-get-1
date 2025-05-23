extends TextureButton

var Nazwa: String #Nazwa
var stats: Resource

func _ready() -> void:
	pass
	#To Działa Tylko Narazie Nie Ma Resourcesów Zrobionych --------------------
	stats = load("res://Recourses/Products/%s.tres" % Nazwa) 
	#texture_normal = stats.Textura 
	#tooltip_text = stats.Tooltip
