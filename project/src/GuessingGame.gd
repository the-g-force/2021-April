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

func _ready():
	var options = FLOWERS
	$TextureRect.texture = options[0].image
	for i in range(0,4):
		var b := Button.new()
		b.text = options[i].name
		b.size_flags_horizontal = SIZE_EXPAND_FILL
		b.size_flags_vertical = SIZE_EXPAND_FILL
		$ButtonGrid.add_child(b)
		
