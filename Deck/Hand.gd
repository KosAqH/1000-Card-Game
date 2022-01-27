extends Node2D

var cards = [] setget set_cards

#var is_player_hand = false

var window_width
var card_offset
var current_card_offset

func set_cards(cards_):
	cards = cards_
	for c in cards:
		add_child(c)
	
	if get_parent().is_ai == false:
		setup_visuals()

func setup_visuals():
	window_width = get_viewport().size.x
	card_offset = (window_width - 200)/8
	current_card_offset = 100
	set_hand_visible()
	
func set_hand_visible():
	for c in cards:
		current_card_offset += card_offset
		c.show_card(Vector2(current_card_offset,500))
