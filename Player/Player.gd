extends Node2D

onready var hand = $Hand

var is_ai = true setget is_ai_setter

var gathered_points = 0

func is_ai_setter(ai):
	is_ai = ai

func set_cards(c):
	hand.cards = c

func make_move():
	pass
