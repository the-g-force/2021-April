extends Control

func _ready():
	randomize()


func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/GameFrame.tscn")
