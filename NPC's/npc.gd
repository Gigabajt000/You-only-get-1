extends CharacterBody2D

var kat_path = "res://NPC's/Dialog/Kategoria/"
var podkat_path = "res://NPC's/Dialog/Podkategorie"

var gender_path = "res://NPC's/Gender/"

var kategoria : Kategoria
var podkategoria : dialog


var image 
var imie 

var gender
var zul : bool

var k 

var name_kat = 0 

var numer_klienta : int

var accept_button

@export var label : Label
@export var icon : Sprite2D


func _ready() -> void:
	icon.texture = Global.Klient_icon
	icon.scale = Vector2(0.7,0.7)
	accept_button = get_node("/root/Main/CanvasLayer/accept_button")
	
	$Node2D/Sprite2D.scale=Vector2(1,1)
	if Global.Play_End == true:
		podkategoria = ResourceLoader.load("res://NPC's/Dialog/Kategoria/End.tres")
		Start_Timer()
		$Node2D/Sprite2D.position.x=893.0
	elif Global.klient_res == null:
		losowanie()
	else:
		podkategoria = Global.klient_res
		$Node2D/Sprite2D.position.x=893.0
	label.text = Global.Name + ": " + podkategoria.Dialog

func _process(delta: float) -> void:
	if Global.Play_Tutorial == true:
		var tut_image = "res://NPC's/Gender/1/icon/3.tres"
		var o = ResourceLoader.load(tut_image)
		image = o.icon
		icon.scale = Vector2(0.7,0.7)
		imie = "Michajov Pyckov" 
		icon.texture = o.icon
	icon.scale = Vector2(0.7,0.7)
	if Global.podany == true:
		accept_button.visible = false
		Global.podany = false
		if podkategoria.Specjalne == true:
			Global.Dodatkowy_Hajs = 2
		else:
			Global.Dodatkowy_Hajs = 1
			
		if podkategoria.Oficer == true:
			if len(Global.Lista) > 8:
				Global.punkty_po_podaniu = 0.1 * len(Global.Lista)
				Global.Vdolce += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
				Global.Zarobione_Pieniadze += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
			else:
				Global.punkty_po_podaniu = -0.1 * (21 - len(Global.Lista))
				Global.Vdolce += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
				Global.Zarobione_Pieniadze += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
		elif Global.Play_Tutorial == true and Global.Podany_Przedmiot != "":
			checkItem()
		elif Global.Play_Tutorial == true:
			pass
		elif Global.Podany_Przedmiot != "":
			checkItem()
		elif Global.Podany_Przedmiot == "" and podkategoria.Bezdomny == true:
			Global.punkty_po_podaniu = 0.0
			Global.Vdolce += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
			Global.Zarobione_Pieniadze += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
		else:
			Global.punkty_po_podaniu = -1
			Global.Vdolce += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
			Global.Zarobione_Pieniadze += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
		$AnimationPlayer.play("odejscie")
		
		
		#Komentarz Koncowy
		if podkategoria.Oficer == true and len(Global.Lista) > 8:
			label.text = "It Seems You are Doing Well. Goodbye Comrade"
		elif podkategoria.Oficer == true and len(Global.Lista) < 8:
			label.text = "You THINK It's Just A Game Don't You! You Are On A Thin Ice You Know."
		elif Global.Play_Tutorial == true and Global.punkty_po_podaniu == 1.0:
			label.text = "Oh... thanks! I'll Gladly Take This"
			Global.Play_Tutorial = false
		elif Global.Play_Tutorial == true:
			label.text = "See You Around, and Beaware... We are Watching You"
			Global.Play_Tutorial = false
		elif podkategoria.Bezdomny == true and Global.punkty_po_podaniu == 0.5:
			label.text = "Ohh... how grateful of you! I think I fell in love..."
		elif podkategoria.Bezdomny == true and Global.punkty_po_podaniu == 0.0:
			label.text = "Man... Really? Huh... thats life"
		elif Global.punkty_po_podaniu == 1.0 and Global.Podany_Przedmiot == "alkohol" or Global.Podany_Przedmiot == "fajki":
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
		
#pokazuje accept button
func ShowButton():
	accept_button.visible = true
	label.text = imie + ": " + podkategoria.Dialog
		
func checkItem():
	var przedmiot = Global.Podany_Przedmiot
	Global.punkty_po_podaniu = podkategoria.Items[przedmiot]
	Global.Vdolce += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs
	Global.Zarobione_Pieniadze += Global.punkty_po_podaniu * 10 * Global.Dodatkowy_Hajs

	
func losowanie():
	if Global.Klient <= 4:
		Global.Klient += 1
		$AnimationPlayer.play("przyjście")
		random_kategoria()
		random_podkategoria()
		choseGender()
		icon.texture = image
		icon.scale = Vector2(0.7,0.7)
		if Global.Dzien == 3 and Global.Oficer_Played == false:
			Global.Play_Oficer = true
		
		
var kat
func random_kategoria():
	kat_path = "res://NPC's/Dialog/Kategoria/"
	kat = randi_range(0,4)
	kat = str(kat)
	#print(kat)
	kat_path = kat_path+ kat + ".tres"
	#print(kat_path)
	kategoria = ResourceLoader.load(kat_path)
	name_kat = kategoria.name
	
	#print(name_kat)

func random_podkategoria():
	if Global.Play_Tutorial == true:
		podkategoria = ResourceLoader.load("res://NPC's/Dialog/Kategoria/Tutorial.tres")
		Global.klient_res = podkategoria
	elif Global.Play_Oficer == true and Global.Oficer_Played == false:
		podkategoria = ResourceLoader.load("res://NPC's/Dialog/Kategoria/Oficer.tres")
		Global.klient_res = podkategoria
		Global.Oficer_Played = true
	else:
		podkat_path = "res://NPC's/Dialog/Podkategorie"
		#range musi byc powyzej 1 (np: od 2 do 6)
		var pkat = randi_range(2,5)
		pkat = str(pkat)
		podkat_path = podkat_path+"/"+name_kat+"/"+pkat+".tres"
		#print(podkat_path)
		podkategoria = ResourceLoader.load(podkat_path)
	
		if podkategoria == null:
			random_podkategoria() 
	Global.klient_res = podkategoria
	

# if Global.tutorial = jedna postac 
#POSTACIE-------------------------------------------------------------------

func choseGender():
	if Global.Play_Tutorial == true: 
		var tut_image = "res://NPC's/Gender/1/icon/3.tres"
		var o = ResourceLoader.load(tut_image)
		image = o.icon
		icon.scale = Vector2(0.7,0.7)
		imie = "Michajov Pyckov" 
		#print(image,imie)
	elif podkategoria.Bezdomny:
		var tut_image = "res://NPC's/Gender/1/icon/6.tres"
		var o = ResourceLoader.load(tut_image)
		image = o.icon
		imie = "Homeles"
		Global.Klient_icon = o.icon
		Global.Name = imie
	elif podkategoria.Oficer:
		var tut_image = "res://NPC's/Gender/1/icon/7.tres"
		var o = ResourceLoader.load(tut_image)
		image = o.icon
		Global.Klient_icon = o.icon
	else :
		gender = randi_range(0,1)
	#0=kobieta 1=facet
		if gender == 0:
			female()
		else:
			male()
	

func female():
	gender_path = "res://NPC's/Gender/"
	#name
	var n = randi_range(1,5)
	n = str(n)
	#icon 
	var  i = randi_range(1,2)
	i = str(i)
	var genderimage_path = gender_path + str(gender) + "/icon/" + i + ".tres"
	var o = ResourceLoader.load(genderimage_path)
	image = o.icon
	Global.Klient_icon = o.icon
	icon.scale = Vector2(0.7,0.7)
	var gendername_path = gender_path + str(gender) + "/name/" + n+ ".tres"
	var j = 0
	j = ResourceLoader.load(gendername_path)
	imie = j.name
	Global.Name = imie
	#print(image," " ,imie)

func male():
	gender_path = "res://NPC's/Gender/"
	#name
	var n = randi_range(1,7)
	n = str(n)
	#icon
	var  i = randi_range(1,5)
	i = str(i)
	var genderimage_path = gender_path + str(gender) + "/icon/" + i + ".tres"
	var o = ResourceLoader.load(genderimage_path)
	image = o.icon
	Global.Klient_icon = o.icon
	icon.scale = Vector2(0.7,0.7)
	var gendername_path = gender_path + str(gender) + "/name/" + n+ ".tres"
	var j = 0
	j = ResourceLoader.load(gendername_path)
	imie = j.name
	Global.Name = imie
	#print(image," " ,imie)

var dobre_zakonczenie = "res://UI/dobre_zakonczenie.tscn"
var zue_zakonczenie = "res://UI/zue_zakonczenie.tscn"

func Start_Timer():
	if Global.Play_End == true:
		$Timer.start()

func Zakonczenie():
	Transition.transition()
	await Transition.on_transition_finished
	if Global.Vdolce > 0:
		get_tree().change_scene_to_file(dobre_zakonczenie)
	else:
		get_tree().change_scene_to_file(zue_zakonczenie)


func _on_timer_timeout() -> void:
	#Fade out
	Zakonczenie()
