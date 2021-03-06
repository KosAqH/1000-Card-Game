extends Node2D

### CONSTANTS ###

const COLORS = ["hearts", "diamonds", "clubs", "spades"]
const CARD_TYPES = ["ace", "king", "queen", "jack", "10", "9"]
const POINTS = {
	"ace": 11,
	"king": 4,
	"queen": 3,
	"jack": 2,
	"10": 10,
	"9": 0
}
const PLAYERS = 3

### SIGNALS ###

signal auction_done
signal stock_given(bid_winner)
signal cards_given_away

### VARIABLES ###

var highest_bid

var deck = []

var stock = [] # musik

var first_player_round = 0 # player that is starting whole round
var current_player = 0 # player that is starting one turn
var human_player = 0 #player that is playing on this computer
var players = []

var scores = {}

### PRELOADED SCENES ### 
onready var card_scene = preload("res://Card/Card.tscn")
onready var human_player_scene = preload("res://Player/HumanPlayer.tscn")
onready var ai_player_scene = preload("res://AI/AIPlayer.tscn")

func _ready():
	randomize()
	setup_cards()
	setup_players()
	setup_signals()
	
	game_round()
	
func game_round():
	"""
	One game round: Dealing cards, auction, and 8 turns of game
	"""
	deal_the_cards()
	auction()
	var bid_winner = yield(self, "auction_done")
	give_stock(bid_winner)
	give_cards_back()
	yield(self, "cards_given_away")	
	print("PEJA")
	
	# auction -> give_cards_away -> turn
	# turn: move 1 -> move 2 -> move 3 ->check for winner
	#var auction_returned = auction()
	"""current_player = auction_returned
	
	yield(auction(), "completed")
	print("Highest bid: " + highest_bid)
	print("Current player: " + current_player)
	give_stock()
	give_cards_back()
	turn()
	first_player_round = (first_player_round + 1) % 3"""
	
	
func deal_the_cards():
	"""
	Function is assigning cards to every player and put 3 cards on the stock 
	(musik)
	"""
	deck.shuffle()
	stock = deck.slice(0,2) # danie kart do musika
	var i = 0
	for player in players:
		player.set_cards(deck.slice(3+7*i, 9+7*i))
		i += 1
		
func auction() -> void:
	for player in players:
		player.is_bidding = true
	var cur_player = first_player_round
	var bid_winner = cur_player
	highest_bid = 100
	var no_retired = 0
	while no_retired < PLAYERS - 1:
		if players[cur_player].is_bidding:
			#if players[cur_player].is_raising(highest_bid)
			#var resp = players[cur_player].is_raising(highest_bid)
			yield(players[cur_player].is_raising(highest_bid), "completed")
			if players[cur_player].is_bidding:
				highest_bid += 10
				bid_winner = cur_player
			else:
				players[cur_player].is_bidding = false
				no_retired += 1
		cur_player = (cur_player + 1) % 3
	emit_signal("auction_done", bid_winner)

func give_stock(winner_idx) -> void:
	current_player = winner_idx
	#var tmp_cards = players[winner_idx].get_cards() + stock
	players[winner_idx].add_card(stock[0])
	players[winner_idx].add_card(stock[1])
	players[winner_idx].add_card(stock[2])
	emit_signal("stock_given")

func turn():
	for player in players:
		player.make_move()
		yield(player, "move_done")

func give_cards_back():
	human_player.hand.show_cards()
	
	print("Wybierz kart?? dla 1. gracza")
	players[current_player].select_card()
	yield(players[current_player], "move_done")

	print("Wybierz kart?? dla 2. gracza")
	yield(players[current_player], "move_done")

	emit_signal("cards_given_away")

func setup_cards():
	for color in COLORS:
		for type in CARD_TYPES:
			var c = card_scene.instance()
			c.setup(color, type, POINTS[type])
			deck.append(c)

func setup_players():
	human_player = human_player_scene.instance()
	$Players.add_child(human_player)
	human_player.is_ai_setter(false)
	for _i in range(PLAYERS - 1):
		var ai = ai_player_scene.instance()
		$Players.add_child(ai)
	
	players = $Players.get_children()

func setup_signals():
	#connect("auction_done", self, "give_stock")
	#connect("stock_given", self, "give_cards_back")
	pass
	
func on_round_end():
	calculate_score()
	if not get_winner():
		game_round()
	# else end_game()

func calculate_score():
	pass

func get_winner():
	pass
