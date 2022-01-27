extends "res://Player/Player.gd"


func make_move():
	print("Ruch AI")
	var card = hand.cards[randi() % hand.cards.size()]
	return card
