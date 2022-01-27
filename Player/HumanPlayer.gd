extends "res://Player/Player.gd"

var player_turn = false
var card_chosen = false

func make_move():
	player_turn = true
	#connect($Hand.)
	print("Ruch Człowieka")
	while not card_chosen:
		pass
	print("Wybrano kartę")
	player_turn = false

func _on_card_click():
	card_chosen = true

