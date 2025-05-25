extends Node

#Settings
var current_resolution: Vector2i
var current_resolution_id: int
var current_fullscreen_mode: int # 1-windowed, 2-fullscreen, 3-borderless

var current_master_volume: float = 100
var current_music_volume: float = 100
var current_sfx_volume: float = 100

var is_in_settings := false # dotyczy settingsów w pause menu
var is_in_game := false
var is_in_pause_menu := false

#Przedmioty-------------------------------------------------------------------------
var Lista: Array = []

var Przedmioty: Array = ["jabłko","chleb","kiełbasa","ziemniak","mleko","konserwa","ocet","papier toaletowy",
"szare mydło","pasta do zębów","szczototka do kibla","klucz hydrauliczny","klej","farba","gwoździe","gazeta",
"książka marola karksa","alkohol","fajki"]
var deafultowa_ilosc: int
var ilosc_przedmiotow_od_rzadu: int = 4

var Przedmiot: String = ""           #przedmiot na ladzie
var Podany_Przedmiot: String = ""    #przedmiot podany klientowi
var punkty_po_podaniu: float
var podany = false
#klient Resource---------------------------------------------------------------------
var Vdolce: int = 0
var Start_Timer: bool = false        #start timer w labelu 

#Dialog klienta---------------------------------------------------------------------
var klient_res : Resource
var Name : String = "Mikhail Pychkov"

var Dodatkowy_Hajs: int = 1

#Klient icon -----------------------------------------------------------------------
var Klient_icon 

#system dni---------------------------------------------------------------------
var Zarobione_Pieniadze: int = 0
var Klient : int = 0
var Dzien : int 
var Dostawa : bool
#tutorial and End--------------------------------------------------------------------------
var Play_Tutorial: bool = true
var Play_End: bool = false
var Play_Oficer: bool = false
var Oficer_Played: bool = false

var disable_buttons: bool = false

func _ready() -> void:
	deafultowa_ilosc = 4
	Rzadowa_Dostawa(6)

func _process(delta: float) -> void:
	if Vdolce >= 200:
		Vdolce = 200
	if Vdolce <= -200:
		Vdolce = -200

func Rzadowa_Dostawa(x):
	for i in range(0,x):
		if len(Lista) < 21:
			var y = randi_range(0,len(Przedmioty) - 1)
			Lista.append(Przedmioty[y])
		
