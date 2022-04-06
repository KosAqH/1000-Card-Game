extends "res://Player/Player.gd"

var player_turn = false
var card_chosen = false
var can_select_card = true

onready var auction_ui_scene = preload("res://UI/Auction/auction.tscn")

func set_cards(c):
	hand.cards = c
	setup_signals()
	
func add_card(c):
	hand.add_card(c)
	#hand.setup_signals()
	#c.get_node("CardVisual").connect("chosen_card", self, "on_card_chosen")
	
func setup_signals():
	for c in hand.cards:
		if not c.get_node("CardVisual").is_connected("chosen_card", self, "on_card_chosen"):
			c.get_node("CardVisual").connect("chosen_card", self, "on_card_chosen")

func on_card_chosen(card_name):
	hand.show_cards()
	print("AMENO")
	if can_select_card:
		print("Wybrano karte" + str(card_name))
		player_turn = false
		emit_signal("move_done", card_name)
	
func make_move():
	player_turn = true
	#connect($Hand.)
	#setup_signals()
	#print("Ruch Człowieka")
	#print("Wybrano kartę")
	#player_turn = false

func is_raising(current_bid):
	yield(get_tree(), "idle_frame") 
	var a = auction_ui_scene.instance()
	add_child(a)
	print("TEST")
	a.connect("button_pressed", self, "decision_done")
	yield(a, "button_pressed")
	
func decision_done(dec):
	$Auction.call_deferred("queue_free")
	is_bidding = dec
	print(dec)

func select_card():
	can_select_card = true
	
func foo():
	for c in hand.cards:
		print(c.get_node("CardVisual").is_connected("chosen_card", self, "on_card_chosen"))
