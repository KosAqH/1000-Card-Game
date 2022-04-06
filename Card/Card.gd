extends Node2D

var points # points given for that card
var color # hearts/diamonds/clubs/spade
var card_type #ace/10/king/queen/jack/9

var FILENAME = "res://Card/CardsTextures/"

var visual_preloaded = preload("res://Card/CardVisual.tscn")
var visual #child of Card - visuual side

func setup(col, type, pts):
	"""
	Parameters:
		col - color
		type - type
		pts - points
		pos - position
	"""
	points = pts
	color = col
	card_type = type
	
	FILENAME += type + "_of_" + color + ".png"

	# Set visuals
	visual = visual_preloaded.instance()
	add_child(visual)
	hide()

func set_card_position(pos):
	"""s
	"""
	visual.position = pos
	visual.setup(FILENAME, pos)

func print_details():
	"""
	Just function for easier debugging - i'm gonna remove it later
	"""
	print(str(color) + " " + str(card_type) + " " + str(points))

