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
		#setup_signals()

func on_card_chosen(card_name):
	print("Wybrano kartę " + card_name)
	
func setup_visuals():
	window_width = get_viewport().size.x
	card_offset = (window_width - 200)/(len(cards) + 1)
	current_card_offset = 100
	set_hand_visible()
	
func setup_signals():
	for c in cards:
		c.get_node("CardVisual").connect("chosen_card", self, "on_card_chosen")
	
func set_hand_visible():
	for c in cards:
		current_card_offset += card_offset
		if c.has_node("CardVisual"):
			c.get_node("CardVisual").queue_free()
		c.show_card(Vector2(current_card_offset,500))
