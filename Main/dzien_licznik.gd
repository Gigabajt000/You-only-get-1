extends Label

var dzien : int 

func _process(delta: float) -> void:
	dzien = Global.Dzien
	text = "Dzien:" + str(dzien)
