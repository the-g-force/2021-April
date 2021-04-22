extends Control


func _on_GuessingGame_next():
	var next_round = preload("res://src/GuessingGame.tscn").instance()
	remove_child(get_child(0))
	add_child(next_round)
	next_round.connect("next", self, "_on_GuessingGame_next")
