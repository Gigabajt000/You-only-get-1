extends CharacterBody2D

var kat_path = "res://NPC's/Dialog/Kategoria/"
var podkat_path = "res://NPC's/Dialog/Podkategorie"

var kategoria : Kategoria
var podkategoria : dialog

var k = "i"
var name_kat = 0 


func _ready() -> void:
	random_kategoria()
	random_podkategoria()


func random_kategoria():
	var kat = randi_range(0,3)
	kat = str(kat)
	print(kat)
	kat_path = kat_path+ kat + ".tres"
	print(kat_path)
	kategoria = ResourceLoader.load(kat_path)
	name_kat = kategoria.name
	print(name_kat)

func random_podkategoria():
	var pkat = randi_range(1,1)
	pkat = str(pkat)
	podkat_path = podkat_path+"/"+name_kat+"/"+pkat+".tres"
	podkategoria = ResourceLoader.load(podkat_path)
	print(podkat_path)
	print(podkategoria.Dialog)
	
	
