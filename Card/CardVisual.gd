extends Area2D

#onready var face = $Face
var face

signal chosen_card

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
	face.scale = Vector2(0.4, 0.4)
	z_index = 1

func _on_CardVisual_mouse_exited():
	face.scale = Vector2(0.3, 0.3)
	z_index = 0

func _on_CardVisual_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print(get_parent().points)
		emit_signal("chosen_card", get_parent())
