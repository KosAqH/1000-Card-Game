extends Node2D

onready var hand = $Hand

signal move_done #signal sended when move is decided
signal bid_done #signal sended when decision about bid or pass is made

var is_ai = true setget is_ai_setter
var is_bidding = false # is player still bidding in the auction phase

var gathered_points = 0 # points gathered by player in current game
var gathered_cards = [] # cards gathered by plaayer in current game 

func is_ai_setter(ai):
	is_ai = ai

func set_cards(c):
	hand.cards = c
	
func get_cards():
	return hand.cards

func make_move():
	"""
	Abstract function for getting player's move
	"""
	pass
	
func is_raising(current_bid):
	"""
	Abstract function, that is called to knew if player is still bidding or passing
	"""
	pass
