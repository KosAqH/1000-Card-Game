extends Area2D

var face # sprite with card texture

signal chosen_card(card_name) # signal sended when player click on one of cards

func setup(filename, pos):
	"""
	Parameters:
		filename
		pos
	"""	
	face = $Face
	face.texture = load(filename)
	position = pos

func _on_CardVisual_mouse_entered():
	"""
	Increasing sprite card on hover
	"""
	face.scale = Vector2(0.4, 0.4)
	z_index = 1

func _on_CardVisual_mouse_exited():
	"""
	Decreasing sprite card on unhover
	"""
	face.scale = Vector2(0.3, 0.3)
	z_index = 0

func _on_CardVisual_input_event(viewport, event, shape_idx):
	"""
	Function sends signal that particular card was chosen
	"""
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("chosen_card", get_parent().name)
