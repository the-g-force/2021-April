extends Control

signal next

const FLOWERS = preload("res://src/Flowers.gd").FLOWERS

onready var _flower_image := $FlowerImage
onready var _button_grid := $ButtonGrid
onready var _fact_label := $FactContainer/FactLabel

func _ready():
	var options = FLOWERS
	options.shuffle()
	
	var correct_index := randi() % 4	
	_flower_image.texture = options[correct_index].image
	
	for i in range(0,4):
		var b := _button_grid.get_child(i)
		b.fact = options[i].fact
		b.text = options[i].name
		b.correct = i == correct_index
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
	$NavigationButtonBox.visible = true
	for button in _button_grid.get_children():
		if button.correct:
			$SolutionHighlightingTimer.button = button
			$SolutionHighlightingTimer.start()
			return


func _on_NextButton_pressed():
	emit_signal("next")


func _on_ExitButton_pressed():
	get_tree().change_scene("res://src/TitleScreen.tscn")
