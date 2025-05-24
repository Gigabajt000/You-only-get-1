extends CharacterBody2D

var kat_path = "res://NPC's/Dialog/Kategoria/"
var podkat_path = "res://NPC's/Dialog/Podkategorie"

var kategoria : Kategoria
var podkategoria : dialog

var k = "i"
var name_kat = 0 

var numer_klienta : int


@export var label : Label


func _ready() -> void:
	$Node2D/Sprite2D.scale=Vector2(1,1)
	if Global.klient_res == null:
		losowanie()
	else:
		podkategoria = Global.klient_res
		$Node2D/Sprite2D.position.x=893.0
	label.text = podkategoria.Dialog

func _process(delta: float) -> void:
	if Global.podany == true:
		Global.podany = false
		if Global.Podany_Przedmiot != "":
			checkItem()
		else:
			Global.punkty_po_podaniu = -1
			Global.Vdolce += Global.punkty_po_podaniu * 10
		$AnimationPlayer.play("odejscie")
		
		
		#Komentarz Koncowy
		if Global.punkty_po_podaniu == 1.0 and Global.Podany_Przedmiot == "alkohol" or Global.Podany_Przedmiot == "fajki":
			label.text = "That'll always do"
		elif Global.punkty_po_podaniu > 0.5:
			label.text = "Dear Companion, you saved my day"
		elif Global.punkty_po_podaniu > 0.0:
			var x = randi_range(0,2)
			if x == 0:
				label.text = "That'll Do"
			elif x == 1:
				label.text = "Sure, that'll work"
			elif x == 2:
				label.text = "I guess that's good enough"
		elif Global.punkty_po_podaniu > -0.5:
			var x = randi_range(0,1)
			if x == 0:
				label.text = "I Guess that'll have to make it"
			if x == 1:
				label.text = "really? Well, could've been worse"
		elif Global.punkty_po_podaniu >= -1.0:
			label.text = "Are you fucking joking?"
		else:
			label.text = "Are you fucking deaf or what?"

	if $AnimationPlayer.is_playing() == false:
		$AnimationPlayer.play("idle")
		
func checkItem():
	var przedmiot = Global.Podany_Przedmiot
	Global.punkty_po_podaniu = podkategoria.Items[przedmiot]
	Global.Vdolce += Global.punkty_po_podaniu * 10
	
func losowanie():
	$AnimationPlayer.play("przyjście")
	random_kategoria()
	random_podkategoria()
	label.text = podkategoria.Dialog

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
	#print(podkat_path)
	podkategoria = ResourceLoader.load(podkat_path)
	if podkategoria == null:
		random_podkategoria() 
	Global.klient_res = podkategoria
	
	
	
	
