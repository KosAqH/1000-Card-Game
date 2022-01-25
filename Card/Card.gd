extends Area2D

var points # points given for that card
var color # hearts/diamonds/clubs/spade
var card_type #ace/10/king/queen/jack/9

onready var face = $Face
onready var texxt = load("res://Card/Texture.tres")

func setup(pts, col, type):
	"""
	Parameters:
		pts - points
		col - color
		type - type
	"""
	points = pts
	color = col
	card_type = type
	
	var FILENAME = card_type + "_of_" + color + ".png"
	
	face.texture = load("res://Card/CardsTextures/" + FILENAME)

