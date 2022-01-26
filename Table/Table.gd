extends Node2D

const COLORS = ["hearts", "diamonds", "clubs", "spades"]
const CARD_TYPES = ["ace", "king", "queen", "jack", "10", "9"]
const POINTS = {
	"ace": 11,
	"king": 4,
	"queen": 3,
	"jack": 2,
	"10": 10,
	"9": 2
}
const PLAYERS = 3

var deck = []
var hands = []

var stock = [] # musik

onready var card_scene = preload("res://Card/Card.tscn")
onready var ai_scene = preload("res://AI/AIPlayer.tscn")

func _ready():
	randomize()
	setup_cards()
	setup_players()
	
	deal_the_cards()
	
func deal_the_cards():
	deck.shuffle()
	
	stock = deck.slice(0,2)
	$PlayerHand.set_cards(deck.slice(3,9), true)
	$AIPlayers.get_child(0).set_cards(deck.slice(10,16))
	$AIPlayers.get_child(1).set_cards(deck.slice(17,23))
	
func setup_cards():
	for color in COLORS:
		for type in CARD_TYPES:
			var c = card_scene.instance()
			c.setup(color, type, POINTS[type])
			deck.append(c)

func setup_players():
	for i in range(PLAYERS - 1):
		var ai = ai_scene.instance()
		$AIPlayers.add_child(ai)
		print("OK")
