extends Control

#------------------------------------------------------
var preload_path = preload("res://Main/przedmiot_sklep.tscn") # Preload Itemku
@onready var h_box_container: HBoxContainer = $MarginContainer/VBoxContainer/HBoxContainer #Pierwszy HBox
@onready var h_box_container_2: HBoxContainer = $MarginContainer/VBoxContainer/HBoxContainer2 #Drugi HBox
@onready var h_box_container_3: HBoxContainer = $MarginContainer/VBoxContainer/HBoxContainer3 #Trzeci HBox
#-------------------------------------------------------

func _ready() -> void:
	Rozstawienie()

#Rozstawia Przedmioty Na Półkach
func Rozstawienie():
	for i in Global.Lista:
		var item = preload_path.instantiate()
		item.Nazwa = i
		if h_box_container.get_child_count() < 7:
			h_box_container.add_child(item)
		elif h_box_container_2.get_child_count() < 7:
			h_box_container_2.add_child(item)
		elif h_box_container_3.get_child_count() < 7:
			h_box_container_3.add_child(item)


func _on_back_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Main/Main.tscn")
	
