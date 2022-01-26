extends Node2D

var points # points given for that card
var color # hearts/diamonds/clubs/spade
var card_type #ace/10/king/queen/jack/9

var FILENAME = "res://Card/CardsTextures/"

var visual = preload("res://Card/CardVisual.tscn")

func setup(col, type, pts):
	"""
	Parameters:
		col - color
		type - type
		pts - points
	"""
	points = pts
	color = col
	card_type = type
	
	FILENAME += type + "_of_" + color + ".png"

func show_card(pos):
	var v = visual.instance()
	add_child(v)
	v.setup(FILENAME, pos)

func print_details():
	print(str(color) + " " + str(card_type) + " " + str(points))
