extends TextureProgressBar

func _process(delta: float) -> void:
	$TextureRect.position.x = ((Global.Vdolce * 1.3) + 67) 
	
