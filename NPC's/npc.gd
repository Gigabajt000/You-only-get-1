extends CharacterBody2D

var kat_path = "res://NPC's/Dialog/Kategoria/"

var kategoria : Kategoria

var k = "i"


func _ready() -> void:
	var kat = randi_range(0,4)
	kat = str(kat)
	print(kat)
	kat_path = kat_path+ kat + ".tres"
	print(kat_path)
	kategoria = ResourceLoader.load(kat_path)
	print(kategoria.name)
	
