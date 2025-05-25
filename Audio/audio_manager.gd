extends AudioStreamPlayer

@onready var music: AudioStreamPlayer = $SovietMarchRoyaltyFreeRussianOrchestralMusic

@onready var button_hover: AudioStreamPlayer = $ButtonHover

@onready var buy_1: AudioStreamPlayer = $Buy/Buy1
@onready var buy_2: AudioStreamPlayer = $Buy/Buy2
@onready var buy_3: AudioStreamPlayer = $Buy/Buy3

@onready var menu_button_down: AudioStreamPlayer = $MenuButtonDown
@onready var menu_button_up: AudioStreamPlayer = $MenuButtonUp

func play_random_accept_sound():
	var x = randi_range(0,2)
	match(x):
		0:
			buy_1.play()
		1:
			buy_2.play()
		2:
			buy_3.play()

func _ready():
	# Optionally run this after the scene loads
	find_and_connect_buttons(get_tree().root)

func find_and_connect_buttons(node: Node):
	for child in node.get_children():
		if child is TextureButton:
			# Avoid duplicate connections
			if not child.is_connected("mouse_entered", Callable(self, "_on_button_hover")):
				child.mouse_entered.connect(_on_button_hover)
		# Recurse into children
		find_and_connect_buttons(child)

func _on_button_hover():
	if button_hover and button_hover.stream:
		button_hover.play()
