extends AudioStreamPlayer

@onready var gadanie: AudioStreamPlayer = $Gadanie

@onready var buy_1: AudioStreamPlayer = $Buy/Buy1
@onready var buy_2: AudioStreamPlayer = $Buy/Buy2
@onready var buy_3: AudioStreamPlayer = $Buy/Buy3

func play_random_accept_sound():
	var x = randi_range(0,2)
	match(x):
		0:
			buy_1.play()
		1:
			buy_2.play()
		2:
			buy_3.play()
