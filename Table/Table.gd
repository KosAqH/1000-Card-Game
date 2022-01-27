extends Node2D

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

var deck = []
var hands = []

var stock = [] # musik

var first_player = 0
var players = []

onready var card_scene = preload("res://Card/Card.tscn")
onready var human_player_scene = preload("res://Player/HumanPlayer.tscn")
onready var ai_player_scene = preload("res://AI/AIPlayer.tscn")

func _ready():
	randomize()
	setup_cards()
	setup_players()
	
	yield(get_tree().create_timer(3), "timeout")
	game_loop()
	
func game_loop():
	while true:
		deal_the_cards()
		auction()
		for player in players:
			#pass
			print(player.make_move())
		first_player = (first_player + 1) % 3
		break
	
func deal_the_cards():
	deck.shuffle()
	
	stock = deck.slice(0,2) # danie kart do musika
	
	var i = 0
	for player in players:
		player.set_cards(deck.slice(3+7*i, 9+7*i))
		i += 1
		
func auction():
	pass
	
func setup_cards():
	for color in COLORS:
		for type in CARD_TYPES:
			var c = card_scene.instance()
			c.setup(color, type, POINTS[type])
			deck.append(c)

func setup_players():
	var human = human_player_scene.instance()
	$Players.add_child(human)
	human.is_ai_setter(false)
	for _i in range(PLAYERS - 1):
		var ai = ai_player_scene.instance()
		$Players.add_child(ai)
	
	players = $Players.get_children()
