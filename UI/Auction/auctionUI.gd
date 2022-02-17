extends Control

signal button_pressed(dec)

func _on_Bid_pressed():
	emit_signal("button_pressed", true)

func _on_Pass_pressed():
	emit_signal("button_pressed", false)
