extends Control

const FLOWERS = [
	{
		"name": "Trout Lily",
		"image": preload("res://assets/icon.png"),
		"fact": "It is named after a fish"
	},
	{
		"name": "Placeholder 1",
		"image": preload("res://assets/icon.png"),
		"fact": "It is a placeholder"
	},
	{
		"name": "Placeholder 2",
		"image": preload("res://assets/icon.png"),
		"fact": "It is a placeholder"
	},
	{
		"name": "Placeholder 3",
		"image": preload("res://assets/icon.png"),
		"fact": "It is a placeholder"
	},
]

onready var _flower_image := $CanvasLayer/FlowerImage
onready var _button_grid := $ButtonGrid
onready var _fact_label := $FactContainer/FactLabel

func _ready():
	var options = FLOWERS
	_flower_image.texture = options[0].image
	
	for i in range(0,4):
		var b := _button_grid.get_child(i)
		b.fact = options[i].fact
		b.text = options[i].name
		# The fact that the first of the four buttons is correct
		# is currently hard-coded here.
		b.correct = i == 0
		b.connect("pressed", self, "_on_GuessButton_pressed", [b], CONNECT_ONESHOT)


func _on_GuessButton_pressed(button:Button):
	for b in _button_grid.get_children():
		b.disabled = true
	
	if button.correct:
		_show_success(button)
	else:
		_show_failure()


func _show_success(button:Button):
	_fact_label.text = "%s\n\n%s" % [button.text, button.fact]
	$AnimationPlayer.play("success")


func _show_failure():
	$NextButton.visible = true
	for button in _button_grid.get_children():
		if button.correct:
			$SolutionHighlightingTimer.button = button
			$SolutionHighlightingTimer.start()
			return


func _on_NextButton_pressed():
	print("TODO: Figure out the next thing to go to, and go there")
	get_tree().change_scene_to(load("res://src/GuessingGame.tscn"))
