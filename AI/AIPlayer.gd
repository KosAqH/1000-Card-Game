extends "res://Player/Player.gd"


func make_move():
	print("Ruch AI")
	var card = hand.cards[randi() % hand.cards.size()]
	print(card.name)
	#return card
	#yield(get_tree().create_timer(1.0), "timeout") # sygnal jest wysylany za szybko
	#i przez to nie dziala, mozna to zastapic z call_defffered
	call_deferred("emit_move_done")

func emit_move_done():
	emit_signal("move_done")

func is_raising(current_bid):
	yield(get_tree(), "idle_frame")
	print("is raising")
	## temporary code
	if 0 == 0:
		is_bidding = false
	elif current_bid < 140:
		is_bidding = true
	else:
		is_bidding = false
