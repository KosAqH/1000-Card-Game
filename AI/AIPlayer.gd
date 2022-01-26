extends Node2D

onready var hand = $Hand

func set_cards(c):
	hand.cards = c
