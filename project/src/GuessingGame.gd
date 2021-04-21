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

onready var _button_grid := $ButtonGrid

func _ready():
	var options = FLOWERS
	$TextureRect.texture = options[0].image
	
	# The fact that the first of the four buttons is correct
	# is currently hard-coded here.
	for i in range(0,4):
		var b := Button.new()
		b.set_script(preload("res://src/GuessButton.gd"))
		b.text = options[i].name
		b.size_flags_horizontal = SIZE_EXPAND_FILL
		b.size_flags_vertical = SIZE_EXPAND_FILL
		b.correct = i == 0
		b.connect("pressed", self, "_on_GuessButton_pressed", [b], CONNECT_ONESHOT)
		$ButtonGrid.add_child(b)


func _on_GuessButton_pressed(button:Button):
	for b in _button_grid.get_children():
		b.disabled = true
	
	if button.correct:
		_show_success()
	else:
		_show_failure()


func _show_success():
	print("Success")
	

func _show_failure():
	print("Failure")
