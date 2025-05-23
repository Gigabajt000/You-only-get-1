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

#Przedmioty
var Lista: Array = []

var Przedmioty: Array = ["jabłko","chleb","kiełbasa","ziemniak","mleko","konserwa","ocet","papier toaletowy",
"szare mydło","pasta do zębów","szczototka do kibla","klucz hydrauliczny","klej","farba","gwoździe","gazeta",
"książka marola karksa","alkohol","fajki"]
var ilosc_przedmiotow_od_rzadu: int = 5

var Przedmiot: String #przedmiot podany klientowi

func _ready() -> void:
	Rzadowa_Dostawa(10)

func Rzadowa_Dostawa(x):
	for i in range(0,x):
		var y = randi_range(0,len(Przedmioty) - 1)
		Lista.append(Przedmioty[y])
		
