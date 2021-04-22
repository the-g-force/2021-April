extends Control


func _on_GuessingGame_next():
	$AnimationPlayer.get_animation("FlyOut").track_set_path(0, "CanvasLayer:offset")
	$AnimationPlayer.play("FlyOut")
	yield($AnimationPlayer, "animation_finished")
	
	var next_round = preload("res://src/GuessingGame.tscn").instance()
	var canvas_layer = CanvasLayer.new()
	canvas_layer.add_child(next_round)
	remove_child($CanvasLayer)
	canvas_layer.name = "CanvasLayer"
	next_round.connect("next", self, "_on_GuessingGame_next")
	add_child(canvas_layer)
