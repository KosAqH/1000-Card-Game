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

onready var card_scene = preload("res://Card/Card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var card = card_scene.instance()
	add_child(card)
	card.setup(2, "hearts", "9")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
