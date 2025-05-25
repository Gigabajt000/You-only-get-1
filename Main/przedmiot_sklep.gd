extends TextureButton

var Nazwa: String #Nazwa
var stats: Resource

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
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

var tween: Tween

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func _on_mouse_entered():
	AudioManager.button_hover.play()
	reset_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.05)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.2)

func _on_mouse_exited():
	reset_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
