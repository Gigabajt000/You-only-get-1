extends TextureRect

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if Global.Dzien == 1 or Global.Dzien == 2:
		visible = true
	else:
		visible = false
