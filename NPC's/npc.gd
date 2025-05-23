extends CharacterBody2D

var kat_path = "res://NPC's/Dialog/Kategoria/"
var podkat_path = "res://NPC's/Dialog/Podkategorie"

var kategoria : Kategoria
var podkategoria : dialog

var k = "i"
var name_kat = 0 

@export var label : Label


func _ready() -> void:
	if Global.klient_res == null:
		losowanie()
	else:
		podkategoria = Global.klient_res
	label.text = podkategoria.Dialog


func losowanie():
	random_kategoria()
	random_podkategoria()

func random_kategoria():
	kat_path = "res://NPC's/Dialog/Kategoria/"
	var kat = randi_range(0,3)
	kat = str(kat)
	#print(kat)
	kat_path = kat_path+ kat + ".tres"
	#print(kat_path)
	kategoria = ResourceLoader.load(kat_path)
	name_kat = kategoria.name
	
	#print(name_kat)

func random_podkategoria():
	podkat_path = "res://NPC's/Dialog/Podkategorie"
	#range musi byc powyzej 1 (np: od 2 do 6)
	var pkat = randi_range(2,6)
	pkat = str(pkat)
	podkat_path = podkat_path+"/"+name_kat+"/"+pkat+".tres"
	print(podkat_path)
	podkategoria = ResourceLoader.load(podkat_path)
	if podkategoria == null:
		random_podkategoria() 
	Global.klient_res = podkategoria
	
	
	
	
