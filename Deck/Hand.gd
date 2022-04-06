extends Node2D

var cards = [] setget set_cards

#var is_player_hand = false

var window_width
var card_offset
var current_card_offset

func set_cards(cards_):
	print("SETGET")
	cards = cards_
	for c in cards:
		add_child(c)
	
	if not get_parent().is_ai:
		calc_visuals_position()
		setup_signals()


func add_card(card_):
	cards.append(card_)
	add_child(card_)
	calc_visuals_position()
	setup_signals()
	card_.show()

func on_card_chosen(card_name):
	print("Wybrano kartę " + card_name)
	
func calc_visuals_position():
	window_width = get_viewport().size.x
	card_offset = (window_width - 200)/(len(cards) + 1)
	current_card_offset = 100
	set_cards_positions()
	
func setup_signals():
	for c in cards:
		if not c.visual.is_connected("chosen_card", self, "on_card_chosen"):
			c.visual.connect("chosen_card", self, "on_card_chosen")
	
func set_cards_positions():
	for c in cards:
		current_card_offset += card_offset
		c.set_card_position(Vector2(current_card_offset,500))

func show_cards():
	for c in cards:
		print("SHOW!")
		c.show()

func hide_cards():
	for c in cards:
		c.hide()
